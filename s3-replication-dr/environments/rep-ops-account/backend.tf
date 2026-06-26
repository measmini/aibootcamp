terraform {
  backend "s3" {
    bucket         = "project-aibootcamp-2026-infra"
    key            = "replication_dr/envs/platform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    
    # Enable new native locking
    use_lockfile   = true 

  }
}
