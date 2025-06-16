################################################
# CREATE PROJECT INFRASTRUCTURE USING AWS CLI  #
################################################
aws configure set region us-east-1
export AWS_SHARED_CREDENTIALS_FILE=/home/ec2-user/.aws/credentials

# Use existing or create new S3 bucket
S3_BUCKET_NAME=`aws s3api list-buckets --query "Buckets[0].Name"t --output text`

if [ "${S3_BUCKET_NAME}" == None ]; 
then
    S3_BUCKET_NAME="s3-dle-`uuidgen`"
    aws s3api create-bucket --bucket ${S3_BUCKET_NAME} --no-cli-pager
fi

BUCKET_NAME="s3-dle-930613e9-20bb-49c5-a6ae-0c9aab0ecba3" # replace bucket name

# open access on bucket. MAKE SURE TO DELETE BUCKET AFTER DATASETS ARE LOADED TO DATABRICKS
aws s3api put-public-access-block --bucket ${BUCKET_NAME} --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false

# make bucket public readable MAKE SURE TO REPLACE THE BUCKET NAME IN THE RESOURCE LINE
aws s3api put-bucket-policy --bucket ${BUCKET_NAME} --policy '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::s3-dle-930613e9-20bb-49c5-a6ae-0c9aab0ecba3/*"
    }
  ]
}'

##################
# COPY FILES     #
##################

aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240101/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240101.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240102/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240102.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240103/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240103.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240104/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240104.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240105/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240105.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240106/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240106.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240107/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240107.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240108/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240108.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240109/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240109.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240110/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240110.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240111/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240111.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240112/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240112.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240113/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240113.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240114/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240114.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240115/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240115.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240116/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240116.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240117/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240117.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240118/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240118.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240119/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240119.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240120/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240120.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240121/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240121.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240122/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240122.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240123/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240123.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240124/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240124.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240125/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240125.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240126/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240126.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240127/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240127.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240128/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240128.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240129/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240129.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240130/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240130.gfs.t12z.sfcf001.nc
aws s3 cp s3://noaa-oar-arl-nacc-pds/inputs/20240131/gfs.t12z.sfcf001.nc s3://${BUCKET_NAME}/20240131.gfs.t12z.sfcf001.nc

############################################
# DELETE S3 Bucket                         #
############################################
aws s3 rb s3://${BUCKET_NAME} --force
