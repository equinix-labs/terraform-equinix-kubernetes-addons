variable project {
  description = "Equinix project"
  type        = string
}

variable host {
    type = string
    description = "The address of the resource from where to perform kubectl installations and changes"
}

variable private_key {
    type = string
    description = "The contents of an SSH key to use for the connection. These can be loaded from a file on disk using the file function"
}
