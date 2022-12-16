#!/bin/bash -e

unset -v EQUINIX_PROVIDER_VERSION
unset -v ADDON_NAME
unset -v ADDON_WEBSITE_URL

usage()
{
    echo ""
    echo "Usage:"
    echo "Run './generate_addon_structure.sh [ -n NAME ] [ -w DOCS_WEBSITE ]'."
    echo ""
    echo "(-h)       Show usage and brief help"
    echo "(-n)       (Required) Name of the addon"
    echo "(-w)       (Required) Home page for documentation of the addon"
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

function check_addon(){
    if [ -d "../modules/$ADDON_NAME" ]; then
        echo "Error: $ADDON_NAME folder already exists!"
        exit 1
    fi
}

function clone_template() {
    git clone "https://github.com/equinix-labs/terraform-equinix-template.git" $ADDON_NAME
}

function override_template(){
    ## remove not required files
    files_rm=(".github/" ".gitignore" ".terraform.lock.hcl" "CODEOWNERS" "LICENSE")
    for f in ${files_rm[@]}; do
        rm -rf ./$ADDON_NAME/$f
    done
    ## add templates header
    find ./$ADDON_NAME -type f -name "*.tf" -exec perl -pi -e 'print "# TEMPLATE: This file was automatically generated with \`generate_addon_structure.sh\`\n# TEMPLATE: and should be modified as necessary\n" if $. == 1' {} \;
    find ./$ADDON_NAME -type f -iname "*.md" -exec perl -pi -e 'print "<!-- TEMPLATE: This file was automatically generated with `generate_addon_structure.sh` and should be modified as necessary -->\n" if $. == 1' {} \;
    ## add/replace addon_specific_templates files
    rsync -avP ./addon_specific_templates/ ./$ADDON_NAME/
    ## get latest equinix provider version
    get_equinix_provider_latest_release
    ## replace variables
    grep -rl "{EQUINIX_PROVIDER_VERSION}" ./$ADDON_NAME/ | xargs sed -i "" "s/{EQUINIX_PROVIDER_VERSION}/${EQUINIX_PROVIDER_VERSION}/g"
    grep -rl "{ADDON_NAME}" ./$ADDON_NAME/ | xargs sed -i "" "s/{ADDON_NAME}/${ADDON_NAME}/g"
    grep -rl "{ADDON_NAME^}" ./$ADDON_NAME/ | xargs sed -i "" "s/{ADDON_NAME^}/${CAPITALIZED_ADDON_NAME}/g"
    grep -rl "{ADDON_WEBSITE_URL}" ./$ADDON_NAME/ | xargs sed -i "" "s/{ADDON_WEBSITE_URL}/${ADDON_WEBSITE_URL}/g"
    ## remove templates extension
    find ./$ADDON_NAME -depth -name "*.tpl" -exec sh -c 'mv "$1" "${1%.*}"' _ {} \;
}

function move_template(){
    mv ./$ADDON_NAME/ ../modules/$ADDON_NAME
}

function get_equinix_provider_latest_release() {
    EQUINIX_PROVIDER_REPO="equinix/terraform-provider-equinix"
    EQUINIX_PROVIDER_VERSION=$(curl --silent "https://api.github.com/repos/$EQUINIX_PROVIDER_REPO/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    echo "using latest Equinix terraform provider version is ${EQUINIX_PROVIDER_VERSION}"
}

#Adds addon specific structures to the repo
function setup_addon() {
    clone_template
    override_template
    move_template
}

#Link addon to main module
function add_addon_to_module() {
    cat <<EOT >> ./../variables.tf
variable "enable_${ADDON_NAME}" {
    type        = bool
    description = "Enable ${ADDON_NAME} add-on"
    default     = false
}

variable "${ADDON_NAME}_config" {
    type        = any
    description = "Configuration for ${ADDON_NAME} add-on"
    default     = {}
}

EOT

    cat <<EOT >> ./../main.tf
module "${ADDON_NAME}" {
    count  = var.enable_${ADDON_NAME} ? 1 : 0
    source = "./modules/${ADDON_NAME}"

    ssh_config    = local.ssh_config
    addon_config  = var.${ADDON_NAME}_config
    addon_context = local.addon_context
}

EOT

    cat <<EOT >> ./../outputs.tf
output "${ADDON_NAME}" {
    value = module.${ADDON_NAME}
}

EOT
}


#sanitize name
CAPITALIZED_ADDON_NAME=`echo ${ADDON_NAME:0:1} | tr  '[a-z]' '[A-Z]'`${ADDON_NAME:1}
ADDON_NAME=$(echo $ADDON_NAME | tr " " "-" | tr -dc '[:alnum:]-' | tr '[:upper:]' '[:lower:]')

echo "Checking if ${ADDON_NAME} addon already exists..."
check_addon
echo "Building ${ADDON_NAME} addon layout..."
setup_addon
echo "Enabling ${ADDON_NAME} addon in main module..."
add_addon_to_module
echo "${ADDON_NAME} addon layout successfully created!"
PROJECT_DIR=$(cd ./../ && basename "`pwd`")
echo ""
echo "Modified project files:"
echo " - $PROJECT_DIR/main.tf"
echo " - $PROJECT_DIR/outputs.tf"
echo " - $PROJECT_DIR/variables.tf"
echo "New addon's editable files included in:"
echo " - $PROJECT_DIR/modules/$ADDON_NAME/"

