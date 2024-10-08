variable "access_token" {
  type = string
}

variable "project_id" {
  type = string
}

# For VM
variable "instance_name" {
  type = string
}
variable "instance_zone" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "instance_tags" {
  type = list
  default = [""]
}