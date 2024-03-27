variable "filename" {
  default     = "/home/brayanmarin/home4.txt"
  type        = string
  description = "default path the filename"
}

variable "content" {
  default     = "I have an animal, a big savage animal 😨😱"
  type        = string
  description = "default content of the file"
}

variable "prefix" {
  description = "default prefix"
  default     = "Mr"
  type        = string
}

variable "separator" {
  default     = "."
  type        = string
  description = "default separator"
}

variable "length" {
  default     = 2
  type        = number
  description = "default length"
}
variable "file_permission" {
  default     = "0712"
  type        = string
  description = "default file permission"
}

variable "file_content" {
  default = {
    cat = "I have a cat 🐈"
    dog = "I have a dog 🐶"
  }
  type = map(string)
}

variable "bella" {
  type = object({
    name         = string
    color        = string
    age          = number
    food         = list(string)
    favorite_pet = bool
  })
  default = {
    name         = "Bella"
    color        = "black"
    age          = 3
    food         = ["fish", "chicken", "turkey"]
    favorite_pet = true
  }
}

variable "kitty" {
  type    = tuple([string, number, bool])
  default = ["cat", 3, true]
}
