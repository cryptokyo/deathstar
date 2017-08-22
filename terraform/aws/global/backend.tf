terraform {
  backend "s3" {
    bucket = "cryptokyo-deathstar"
    key    = "global/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
