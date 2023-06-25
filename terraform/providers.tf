terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.92.0"
    }
  }
}

provider "yandex" {
  zone = "ru-central1-a"
}

provider "tls" {
  proxy {
    from_env = true
  }
}