#!/bin/bash

echo "Initializing LocalStack S3 buckets..."

# Wait for LocalStack to be ready
sleep 10

# Create S3 buckets
awslocal s3api create-bucket --bucket temp-bucket --region us-east-1
awslocal s3api create-bucket --bucket avatar-bucket --region us-east-1
awslocal s3api create-bucket --bucket driver-license-bucket --region us-east-1
awslocal s3api create-bucket --bucket visa-documents-bucket --region us-east-1
awslocal s3api create-bucket --bucket personal-documents-bucket --region us-east-1

# Set bucket policies for public read access (optional - for testing)
awslocal s3api put-bucket-cors --bucket temp-bucket --cors-configuration '{
  "CORSRules": [
    {
      "AllowedHeaders": ["*"],
      "AllowedMethods": ["GET", "PUT", "POST", "DELETE"],
      "AllowedOrigins": ["*"],
      "ExposeHeaders": ["ETag"]
    }
  ]
}'

awslocal s3api put-bucket-cors --bucket avatar-bucket --cors-configuration '{
  "CORSRules": [
    {
      "AllowedHeaders": ["*"],
      "AllowedMethods": ["GET", "PUT", "POST", "DELETE"],
      "AllowedOrigins": ["*"],
      "ExposeHeaders": ["ETag"]
    }
  ]
}'

awslocal s3api put-bucket-cors --bucket driver-license-bucket --cors-configuration '{
  "CORSRules": [
    {
      "AllowedHeaders": ["*"],
      "AllowedMethods": ["GET", "PUT", "POST", "DELETE"],
      "AllowedOrigins": ["*"],
      "ExposeHeaders": ["ETag"]
    }
  ]
}'

awslocal s3api put-bucket-cors --bucket visa-documents-bucket --cors-configuration '{
  "CORSRules": [
    {
      "AllowedHeaders": ["*"],
      "AllowedMethods": ["GET", "PUT", "POST", "DELETE"],
      "AllowedOrigins": ["*"],
      "ExposeHeaders": ["ETag"]
    }
  ]
}'

awslocal s3api put-bucket-cors --bucket personal-documents-bucket --cors-configuration '{
  "CORSRules": [
    {
      "AllowedHeaders": ["*"],
      "AllowedMethods": ["GET", "PUT", "POST", "DELETE"],
      "AllowedOrigins": ["*"],
      "ExposeHeaders": ["ETag"]
    }
  ]
}'

# Verify buckets were created
echo "Created buckets:"
awslocal s3api list-buckets --query 'Buckets[].Name' --output table

echo "LocalStack S3 initialization complete!"