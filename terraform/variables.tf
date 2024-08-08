# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  sensitive = true
}

variable "main_user" {
    description = "Main user of the server"
    type        = string
    default     = "pachovit"
}

variable "ssh_public_key" {
  description = "Public SSH key"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINiF8osWC1TC2Kpce/LxkOc0TyjwjGxjnzBSmMXXLqv2"
}

variable "server_location" {
    description = "Location of the server"
    type        = string
    default     = "nbg1" # nbg1, fsn1, hel1, ash or hil
}
