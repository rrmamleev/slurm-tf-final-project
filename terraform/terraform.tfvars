vm_name = "test"

labels = {
	"team" = "slurm-team"
	"app" = "project-terraform"
}

cide_block = [
  ["10.10.0.0/24"],
  ["10.20.0.0/24"],
  ["10.30.0.0/24"],
]

resources = [
  {
    disk = 10,
    cpu = 2,
    memory = 2
  },
  {
    disk = 10,
    cpu = 2,
    memory = 4
  },
  {
    disk = 10,
    cpu = 2,
    memory = 4
  }
]

nlb_healthcheck = {
    name   = "test",
    port   = 80,
    path   = "/"
}

vm_count = 3

image_family = "centos-7"
