terraform {
  backend "s3" {
    bucket         = "project-aibootcamp-2026-infra"
    key            = "product-name/envs/platform_iam.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    
    # Enable new native locking
    use_lockfile   = true 

  }
}
