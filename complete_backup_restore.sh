file1="$1"
file2="$2"
sh sync_amazon_s3_bucket_with_ec2.sh
sh backup_restore_script.sh "$file1"
sh images_restore.sh "$file2"