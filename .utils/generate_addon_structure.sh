#!/bin/bash -e

unset -v ADDON_NAME
unset -v ADDON_WEBSITE_URL

usage()
{
    echo ""
    echo "Usage:"
    echo "Run './generate_addon_structure.sh [ -n NAME ] [ -w DOCS_WEBSITE ]'."
    echo ""
    echo "(-h)       Show usage and brief help"
    echo "(-n)       (Required) Name of the addon/kubernetes plugin"
    echo "(-w)       (Required) Addon official documentation home page URL"
}

while getopts ":n:w:" opt; do
  case $opt in
     n)
        ADDON_NAME=$OPTARG
        ;;
     w)
        ADDON_WEBSITE_URL=$OPTARG
        ;;
     *)
        usage
        exit 0
       ;;
  esac
done

shift "$(( OPTIND - 1 ))"

if [ -z "$ADDON_NAME" ] || [ -z "$ADDON_WEBSITE_URL" ]; then
    usage
    echo ""
    echo "Error: Missing -n or -w" >&2
    exit 1
fi

function print_green(){
    local green='\033[0;32m'
    echo -e "$green$1"
}

function check_addon(){
    if [ -d "../modules/$ADDON_DIR" ]; then
        echo "Error: $ADDON_DIR folder already exists!"
        exit 1
    fi
}

function request_approve(){
    echo ""
    echo "##############################################################################"
    echo "Please,"
    echo "be advised, that this script uses relative paths and adds content to existing"
    echo "files." 
    echo ""
    echo "You may not move this script to a different directory to ensure the proper"
    echo "functioning."
    echo "##############################################################################"
    echo ""
    read -r -p "Do you want to continue? [y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY])
            ;;
        *)
            exit 0
            ;;
    esac
}

function clone_template() {
    git clone "https://github.com/equinix-labs/terraform-equinix-template.git" $ADDON_DIR
}

function override_template(){
    ## remove not required files
    local files_rm=(".github/" ".gitignore" ".terraform.lock.hcl" "CODEOWNERS" "LICENSE")
    for f in ${files_rm[@]}; do
        rm -rf ./$ADDON_DIR/$f
    done
    ## add templates header
    find ./$ADDON_DIR -type f -name "*.tf" -exec perl -pi -e 'print "# TEMPLATE: This file was automatically generated with \`generate_addon_structure.sh\`\n# TEMPLATE: and should be modified as necessary\n" if $. == 1' {} \;
    find ./$ADDON_DIR -type f -iname "*.md" -exec perl -pi -e 'print "<!-- TEMPLATE: This file was automatically generated with `generate_addon_structure.sh` and should be modified as necessary -->\n" if $. == 1' {} \;
    ## add/replace addon_specific_templates files
    rsync -avP ./addon_specific_templates/ ./$ADDON_DIR/
    ## get latest equinix provider version
    get_equinix_provider_latest_release
    ## replace variables
    replace_text_in_addon "{EQUINIX_PROVIDER_VERSION}" "${EQUINIX_PROVIDER_VERSION}"
    replace_text_in_addon "{ADDON_DIR}" "${ADDON_DIR}"
    replace_text_in_addon "{ADDON_NAME}" "${ADDON_NAME}"
    replace_text_in_addon "{ADDON_NAME^}" "${CAPITALIZED_ADDON_NAME}"
    replace_text_in_addon "{ADDON_WEBSITE_URL}" "${ADDON_WEBSITE_URL}"
    ## remove templates extension
    find ./$ADDON_DIR -depth -name "*.tpl" -exec sh -c 'mv "$1" "${1%.*}"' _ {} \;
}

function replace_text_in_addon(){
    grep -rl "${1}" ./$ADDON_DIR/ | xargs sed -i "" "s|${1}|${2}|g"
}

function move_template(){
    mv ./$ADDON_DIR ../modules/
}

function get_equinix_provider_latest_release() {
    local equinix_provider_repo="equinix/terraform-provider-equinix"
    local equinix_tag_version=$(curl --silent "https://api.github.com/repos/$equinix_provider_repo/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    EQUINIX_PROVIDER_VERSION=${equinix_tag_version#v}
    echo "Using latest Equinix terraform provider version ${EQUINIX_PROVIDER_VERSION}"
}

#Adds addon specific structures to the repo
function setup_addon() {
    clone_template
    override_template
    move_template
}

function ensure_new_line_to_file_end() {
    if ! [[ $(tail -c1 "$1" | wc -l) -gt 0 ]]; then
        echo "" >> $1
    fi
}

#Link addon to main module
function add_addon_to_module() {
    ensure_new_line_to_file_end ./../variables.tf
    cat <<EOT >> ./../variables.tf

variable "enable_${ADDON_NAME}" {
    type        = bool
    description = "Enable ${CAPITALIZED_ADDON_NAME} add-on"
    default     = false
}

variable "${ADDON_NAME}_config" {
    type        = any
    description = "Configuration for ${CAPITALIZED_ADDON_NAME} add-on"
    default     = {}
}
EOT

    ensure_new_line_to_file_end ./../main.tf
    cat <<EOT >> ./../main.tf

module "${ADDON_NAME}" {
    count  = var.enable_${ADDON_NAME} ? 1 : 0
    source = "./modules/${ADDON_DIR}"

    ssh_config    = local.ssh_config
    addon_context = local.addon_context

    ${ADDON_NAME}_config = var.${ADDON_NAME}_config
}
EOT

    ensure_new_line_to_file_end ./../outputs.tf
    cat <<EOT >> ./../outputs.tf

output "${ADDON_NAME}" {
    value = module.${ADDON_NAME}
    description = "Map of attributes available for the ${CAPITALIZED_ADDON_NAME} addon"
}
EOT
}

#sanitize vars
CAPITALIZED_ADDON_NAME=`echo ${ADDON_NAME:0:1} | tr  '[a-z]' '[A-Z]'`${ADDON_NAME:1}
ADDON_NAME=$(echo $ADDON_NAME | tr '[- ]' '_' | tr -dc '[:alnum:]_' | tr '[:upper:]' '[:lower:]')
ADDON_DIR=$(echo $ADDON_NAME | tr '_' '-')

echo "Checking if ${ADDON_DIR} addon already exists..."
check_addon
request_approve
echo "Building ${ADDON_DIR} addon layout..."
setup_addon
echo "Enabling ${ADDON_DIR} addon in main module..."
add_addon_to_module
echo ""
print_green "${ADDON_DIR} addon layout successfully created!"
PROJECT_DIR=$(cd ./../ && basename "`pwd`")
echo ""
print_green "Modified project files:"
print_green "- $PROJECT_DIR/main.tf"
print_green "- $PROJECT_DIR/outputs.tf"
print_green "- $PROJECT_DIR/variables.tf"
echo ""
print_green "New folder with addon's editable files:"
print_green "- $PROJECT_DIR/modules/$ADDON_DIR/"
