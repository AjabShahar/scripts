#Taking Database Backup

To take full back up from database “platform-dev”: These commands are based on aws ec2 instance:

######pg_dump "platform-dev" -U "postgres" > /home/ajabshahar/backup/ajabshahar_backup_$(date +"%A").sql

This commandcan be found under /home/ajabshahar/scripts/backup_script.sh on aws.

We don’t need to take images backup, since we are uploading images directly to amazon s3 and syncing amazon s3 images folder to local /var/ww/images:

######s3cmd sync s3://singaporeajabshaharbackup/ajabshahar_images/  /var/www/images  

Since we have decided to copy and store these files to Amazon s3, we have to create a bucket in amazon s3.These buckets are mandatory to store any files in amazon s3.: 

https://console.aws.amazon.com/s3/home?region=ap-southeast-1

This buckets can be created by any user. http://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html

Once we create a bucket we have to chose a tool, through which we can copy these backup files to transfer s3.
There are number of tools through which we can copy these files to s3.

boto_rsync:Disadvantage with this is it cant copy files of larger size for example greater than 1 GB.

s3cmd:Same as above, but it could copy files upto 5GB.

aws cli:After reading some of sources, figure out that it is difficult to use.

Some of the resources, to find more details about these tools:

http://stackoverflow.com/questions/26326408/difference-between-s3cmd-boto-and-aws-cli

https://www.cryptobells.com/boto-rsync-limitations-and-workarounds/

http://docs.aws.amazon.com/cli/latest/userguide/installing.html

So, according to our requirement, chosen to use s3cmd.

Installing s3cmd:

Again there are number of ways to install it, but in order to avoid python dependency version problems, this is the best way to install it.

https://forums.cpanel.net/threads/s3cmd-tools-installation-help.357291/

installation steps:

######cd  /home/centos/

######wget http://sourceforge.net/projects/s3tools/files/s3cmd/1.5.2/s3cmd-1.5.2.tar.gz

######tar xvzf s3cmd-1.5.2.tar.gz

######cd s3cmd-1.5.2.tar.gz

######python ./setup.py install

Once we installed it, to perform the operations related to s3, we have to configure it.

For that enter the following command in terminal: 

######s3cmd --configure

Then it will ask for access key, secret key, encrypted password and whether to use https or not for transferring. All these fields are mandatory. I have already entered all these details(so you will see all these details once u enter the s3cmd --configure command).This configuration can be find under '/root/.s3cfg' this file. And by default  only root user have rights to perform all the operations on s3. In our case root user is shabnamspostbox@gmail.com

Root user access key and secret key details can be found under https://console.aws.amazon.com/iam/home?region=ap-southeast-1#security_credential.

Sources for s3cmd configuration:

http://www.saltycrane.com/blog/2010/02/s3cmd-notes/

http://s3tools.org/s3cmd-howto

The users who have access to amazon s3 to perform the operations copy, edit, get.can be found under properties tab of particular bucket. We could edit these properties to give access to different groups and users. All these guidelines can be found under this link.  http://docs.aws.amazon.com/AmazonS3/latest/UG/EditingBucketPermissions.html

Once we are done with the s3cmd configuration, we could copy the files from terminal:

To find list of available buckets in Amazon s3 using s3cmd:

######s3cmd ls

To find the contents of the particular bucket:

######s3cmd ls s3://singaporeajabshaharbackup(bucket name)

To find the files under particular directory in bucket:

######s3cmd ls s3://singaporeajabshaharbackup/ajabshahar_images/

To copy back up files :

######s3cmd put /home/ajabshahar/ajabshahar_backup_$(date +"%A").sql  s3://singaporeajabshaharbackup/backup_folder/

This command can be found under script /home/ajabshahar/scripts/upload_backup_to_s3.sh on aws.

This back up and uploading to s3 should be automatic. To run backup_script.sh and upload_backup_tos3.sh scripts automatically we are using crontab.

For that we have to edit crontab jobs under edit mode.we can open it by crontab -e and add the jobs.

we have to set the cron tabs under ajabshahar user not as a root user.Because we are running all these jobs under ajabshahar user.

Once we set up the crontab job we have to restart it.

To restart crontab job : 
######service crond restart

Setting up of this crontab job involved some problem in centos, which was fixed by rebooting of system.

Some of the resources to setup crontab jobs:

http://tecadmin.net/crontab-in-linux-with-20-examples-of-cron-schedule/

https://www.centos.org/forums/viewtopic.php?t=6832

http://www.thesitewizard.com/general/set-cron-job.shtml














