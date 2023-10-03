## to create s3 bucket on aws using aws-cli
 ##aws s3api create-bucket --bucket divin-buckets --region us-east-1

# backend.tf 
 terraform { 
 backend "s3" { 
 bucket         = "divin-bucket" 
 key            = "terraform-week7/terraform.tfstate" # Optional: Use a unique key path 
 region         = "us-east-1" 
 encrypt        = true 

} 
} 
resource "aws_dynamodb_table" "terraform_state_lock" { 

  name           = "terraform-state-lock" 

  billing_mode   = "PAY_PER_REQUEST"  # You can choose either PROVISIONED or PAY_PER_REQUEST 

  hash_key       = "LockID" 

   

  attribute { 
 name = "LockID" 
 type = "S" 

  } 

  ttl { 

    attribute_name = "LockExpire" 
} 

tags = { 
 Name = "TerraformStateLock" 
} 
} 