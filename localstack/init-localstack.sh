#!/bin/bash

echo "Initializing LocalStack S3 bucket..."

# Wait for LocalStack to be ready
sleep 10

# Define the single bucket name
BUCKET_NAME="beaconfire-jul-2025"

# Create the single S3 bucket
awslocal s3api create-bucket --bucket "$BUCKET_NAME" --region us-east-1

# Set bucket policy for public read access (optional - for testing)
awslocal s3api put-bucket-cors --bucket "$BUCKET_NAME" --cors-configuration '{
  "CORSRules": [
    {
      "AllowedHeaders": ["*"],
      "AllowedMethods": ["GET", "PUT", "POST", "DELETE"],
      "AllowedOrigins": ["*"],
      "ExposeHeaders": ["ETag"]
    }
  ]
}'

# Verify the bucket was created
echo "Created bucket:"
awslocal s3api list-buckets --query 'Buckets[].Name' --output table

echo "LocalStack S3 initialization complete!"