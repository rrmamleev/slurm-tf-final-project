variable "vm_name" {
	type = string
	description = "This is name VM"
	default = "test"
}

variable "image_family" {
  type = string
  description = "Image to create vm from"
}

variable "labels" {
	type = map(string)
	description = "Labels to add to resources"
}

variable "cide_block" {
	type = list(list(string))
	description = "List IPv4 for subnet"
}

variable "resources" {
	type = list(object({
	  disk = number,
	  cpu = number,
	  memory = number
	}))
	description = "This is resources for VM"
}

variable "port_lb" {
	type = number
	description = "Port to Load Balancer"
	default = "80"
}

variable "nlb_healthcheck" {
	type = object({
	  name = string,
	  port = number,
	  path = string
	})
	description = "Values for healthcheck load balancer"
}

variable "public_ssh_key_path" {
	type = string
	description = "Values for enter ssh key. Please copy text public ssh key or press ENTER to skip and generate keys automatically"
}

variable "az" {
  type = list(string)
  default = [
    "ru-central1-a",
    "ru-central1-b",
    "ru-central1-c"
  ]
}

variable "vm_count" {
  type = number
  description = "Number of vm to create"
}

variable "vpc_id" {
  type = string
  default = ""
  description = "VPC ID"
}
