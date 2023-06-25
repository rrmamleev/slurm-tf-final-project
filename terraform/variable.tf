variable "instance_group_name" {
	type = string
	description = "This is name of the compute instance group"
	default = "test"
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
	type = object({
	  disk = number,
	  cpu = number,
	  memory = number
	})
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

variable "private_ssh_key_path" {
  type = string
  default = ""
  description = "Values for enter ssh key. Please copy text private ssh key or press ENTER to skip and generate keys automatically"
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

variable "folder_id" {
  type = string
  description = "Yandex Cloud Folder ID (exported from environment variables)"
}

variable "image_name" {
  type = string
  description = "Image name"
}

variable "image_tag" {
  type = number
  description = "Image tag"
}

variable "target_group_name" {
  type = string
  description = "Application load balancer target group name"
}

variable "loadbalancer_name" {
  type = string
  description = "Application load balancer name"
}

variable "http_router_name" {
  type = string
  description = "Applictaion load balancer HTTP router name"
}

variable "backend_group_name" {
  type = string
  description = "Application load balancer backend group name"
}

variable "virtual_host_name" {
  type = string 
  description = "Application load balancer virtual host name"
}

variable "lb_frontend_port" {
  type = number
  description = "Application load balancer frontend port"
}

variable "http_backend_port" {
  type = number
  description = "Application load balancer backend port"
}

variable "vpc_network_name" {
  type = string
  description = "Virtual Private Cloud Network name"
}
