# athena-api-tutorial

## Deployment

1. Create an S3 bucket named `vehicle-athena-db` and copy upload the content from `resources` folder.

2. Create a file named `terraform.tfvars` and add your AWS credentials to it.

```
AWS_ACCESS_KEY = "your aws access key"
AWS_SECRET_KEY = "your aws secret key"
```

3. Run `terraform apply`

4. Don't forget to run `terraform destroy` in the end.
