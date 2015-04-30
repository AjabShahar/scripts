mkdir $(date +"%A")
s3cmd put /home/centos/ajabshahar_backup_$(date +"%A").sql s3://singaporeajabshaharbackup/backup_folder/$(date + "%A")
s3cmd put /home/centos/ajabshahar_images_$(date +"%A").zip s3://singaporeajabshaharbackup/backup_folder/$(date + "%A")