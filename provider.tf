provider "aws" {
  region  = "us-east-1" # Primary region
}

provider "aws" {
  alias  = "secondary"
  region = "us-west-2" # Secondary region
}
