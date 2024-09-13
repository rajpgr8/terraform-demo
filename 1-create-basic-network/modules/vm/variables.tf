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
variable "network" {
  type = string
}
variable "subnetwork" {
  type = string
}