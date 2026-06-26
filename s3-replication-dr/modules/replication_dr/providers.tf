provider "aws" {
  alias  = "current"
  region = var.current_region
}

provider "aws" {
  alias  = "dr"
  region = var.dr_region
}