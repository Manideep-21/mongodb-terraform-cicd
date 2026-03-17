terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "mongo" {
  name = "mongo:latest"
}

resource "docker_container" "mongodb" {
  name  = "mongodb_container"
  image = docker_image.mongo.image_id

  ports {
    internal = 27017
    external = 27017
  }

  env = [
    "MONGO_INITDB_ROOT_USERNAME=admin",
    "MONGO_INITDB_ROOT_PASSWORD=password"
  ]
}