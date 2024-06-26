terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 1.2.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

resource "local_file" "pet" {
  filename = var.filename
  #content         = var.content
  # content         = "My favorite pet is ${random_pet.randomize-pets.id}"
  content         = data.local_file.dog.content
  file_permission = var.file_permission
  lifecycle {
    prevent_destroy = false
  }
}

resource "local_file" "my-pet" {
  filename        = "/home/brayanmarin/animals.txt"
  content         = var.content
  file_permission = "0700"
}

resource "local_file" "dog" {
  filename        = "/home/brayanmarin/dog.txt"
  content         = var.file_content["dog"]
  file_permission = "0700"
}

data "local_file" "dog" {
  filename = "/home/brayanmarin/dog.txt"
}

resource "local_file" "cat" {
  filename        = "/home/brayanmarin/cat.txt"
  content         = var.file_content["cat"]
  file_permission = "0700"
}
resource "random_pet" "randomize-pets" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}

resource "random_pet" "cat" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}

resource "random_pet" "dog" {
  prefix    = var.prefix
  separator = var.separator
  length    = 5
}

output "pet-name" {
  value       = random_pet.randomize-pets.id
  description = "record the value of the pet ID generated by the random_pet resource"
}

output "cat-name" {
  value       = random_pet.cat.id
  description = "record the value of the pet ID generated by the random_pet resource"
}

output "dog-name" {
  value       = random_pet.dog.id
  description = "record the value of the pet ID generated by the random_pet resource"
}

# resource "aws_instance" "webserver" {
#   ami           = "ami-0edab43b6fa892279"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "ProjectA-WebServer"
#   }
#   lifecycle {
#     ignore_changes = all
#   }
# }
