#######################################
# EC2 OUTPUTS
#######################################

output "instance_public_ip" {
  value = aws_instance.wordpress_server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.wordpress_server.public_dns
}

#######################################
# RDS OUTPUTS
#######################################

output "rds_endpoint" {
  value = aws_db_instance.wordpress_db.endpoint
}

output "rds_db_name" {
  value = aws_db_instance.wordpress_db.db_name
}

#######################################
# S3 OUTPUTS
#######################################

output "s3_bucket_name" {
  value = aws_s3_bucket.migration_bucket.bucket
}