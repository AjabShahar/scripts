file1="$1"
sh sync_amazon_s3_bucket_with_ec2.sh
sh backup_restore_script.sh "$file1"
