variable "source_image_family" {
  type = string
  default = "centos-7"
  description = "Source image family name for create custom image"
}

variable "ssh_username" {
  type = string
  default = "centos"
  description = "SSH User"
}

variable "use_ipv4_nat" {
  type = string
  default = "true"
  description = "NAT to get external IP (true or false value)"
}

variable "image_description" {
  type = string
  default = "Centos7 nginx image"
  description = "Description of Packer Image"
}

variable "image_family" {
  type = string
  default = "my-images"
  description = "Packer image family"
}

variable "image_tag" {
  type = string
  default = "1-0-0"
  description = "Packer image tag"
}

variable "disk_type" {
  type = string
  default = "network-hdd"
  description = "Disk using template"
}
