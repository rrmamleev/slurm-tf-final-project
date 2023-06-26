instance_group_name = "nginx-slurm"
image_name = "nginx"
image_tag = "1-0-0"

labels = {
	"team" = "slurm-team"
	"app" = "project-terraform"
}

cide_block = [
  ["10.10.0.0/24"],
  ["10.20.0.0/24"],
  ["10.30.0.0/24"],
]

resources = {
    disk = 10,
    cpu = 2,
    memory = 4
  }

nlb_healthcheck = {
    name   = "test",
    port   = 80,
    path   = "/"
}

vm_count = 3

public_ssh_key_path = ""
private_ssh_key_path = ""

target_group_name = "nginx-slurm"
backend_group_name = "backend-slurm"
loadbalancer_name = "loadbalancer-slurm"
http_router_name = "router-slurm"
virtual_host_name = "virtual-host-slurm"
platform_id = "standard-v1"

lb_frontend_port = 443
http_backend_port = 80
vpc_network_name = "backend-net"
