variable "current_region" {
  default = "ap-south-1"
}

variable "dr_region" {
  default = "ap-southeast-1"
}

variable "source_bucket" {
  default = "my-prod-data-current"
}

variable "destination_bucket" {
  default = "my-prod-data-dr"
}
variable "env_type" { type = string } # "dev", "qa", "uat", or "prod"