variable "enable_metallb" {
  description = "Enable Metallb add-on"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
  type        = map(string)
  default     = {}
}

variable "project" {
  description = "Equinix project"
  type        = string
}

variable "metro" {
  description = "Equinix metro code"
  type        = string
  default     = "DA"
}