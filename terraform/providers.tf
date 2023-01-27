provider "aws" {
     profile = "my_own_aws_account"
     alias = "destination"
}

provider "aws" {
     profile = "my_own_aws_account_oleksii"
     alias = "source"
}