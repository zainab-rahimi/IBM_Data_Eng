#!/bin/bash

## Set the database name into a varaibale

DATABASE= 'sakila' 

## this will be printed on to the screen in case of the cron job
# it will be printed to the logs 
echo "Pulling the database, it may take a few seconds..."

## Set the backup folder
backup_folder=mnt/f/repos/'Data Eng'/Course_07_DBA/Week4/backup

## set number of the days to keep the backup
keep_days= 30

## Set the name of the database and back up with timestamps

sql_file=$backup_folder/all-database-$(data +%d-%m-%Y_%H-%M-%S).sql
zip_file=$backup_folder/all-database-$(date +%d-%m-%Y_%H-%M-%S).gz

#### Create the backup; we use if conditions to track the progress

if mysqldump $DATABASE > $sql_file ; then 
    echo 'sqldump was created' 

    if gzip -c $sql_file > $zip_file ; then
    echo "backup has been compressed"

    else 
    echo "Error compression failed"
    exit 
    fi 

    rm $sql_file
else
    echo 'pg_dump return non-zero code, back up failed'
    exit 
fi 

find $backup_folder -mtime +$keep_days -delete

