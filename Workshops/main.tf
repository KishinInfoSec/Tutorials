variable "os_environments" {
  type        = list(string)
  description = "List of OS environments to deploy"
  default     = ["alpine", "debian", "ubuntu"]
}

variable "compose_file_path" {
  type        = string
  description = "Base path for compose files"
  default     = "${path.module}/OS"
}

# Load Alpine compose file as template
locals {
  alpine_compose = file("${var.compose_file_path}/alpine/compose.yaml")
  debian_compose = file("${var.compose_file_path}/debian/compose.yaml")
  ubuntu_compose = file("${var.compose_file_path}/ubuntu/compose.yaml")
}

# Alpine environment
resource "docker_image" "alpine" {
  name          = "alpine:latest"
  keep_locally  = true
}

resource "docker_container" "alpine" {
  name    = "alpine_workshop"
  image   = docker_image.alpine.image_id
  restart = "unless-stopped"

  cpu_shares = 1024
  memory     = 512

  ports {
    internal = 8282
    external = 8282
  }
  ports {
    internal = 22
    external = 2222
  }

  volumes {
    host_path      = "/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }
  volumes {
    host_path      = "alpine-data"
    container_path = "/data"
  }

  env = ["TZ=UTC"]
}

# Debian environment
resource "docker_image" "debian" {
  name          = "debian:latest"
  keep_locally  = true
}

resource "docker_container" "debian" {
  name    = "debian_workshop"
  image   = docker_image.debian.image_id
  restart = "unless-stopped"

  cpu_shares = 1024
  memory     = 512

  ports {
    internal = 8282
    external = 8282
  }
  ports {
    internal = 22
    external = 2222
  }

  volumes {
    host_path      = "/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }
  volumes {
    host_path      = "debian-data"
    container_path = "/data"
  }

  env = ["TZ=UTC"]
}

# Ubuntu environment
resource "docker_image" "ubuntu" {
  name          = "ubuntu:latest"
  keep_locally  = true
}

resource "docker_container" "ubuntu" {
  name    = "ubuntu_workshop"
  image   = docker_image.ubuntu.image_id
  restart = "unless-stopped"

  cpu_shares = 1024
  memory     = 512

  ports {
    internal = 8282
    external = 8282
  }
  ports {
    internal = 22
    external = 2222
  }

  volumes {
    host_path      = "/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }
  volumes {
    host_path      = "ubuntu-data"
    container_path = "/data"
  }

  env = ["TZ=UTC"]
}