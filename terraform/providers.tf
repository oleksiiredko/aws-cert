provider "aws" {
     profile                 = "my_own_aws_account"
     region                  = "us-east-2"
}

provider "aws" {
     alias                   = "destination"
     profile                 = "denis_aws_account"
     region                  = "us-east-2"
}