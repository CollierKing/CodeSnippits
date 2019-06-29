## FS
# If you run out of space, use %fs rm -r /tmp/ to recursively (and permanently) remove all items from a directory.

%python
dbutils.fs.ls("/tmp/" + username + "/ipCount.parquet")

#inspect the head of a file
%fs head /mnt/training/Chicago-Crimes-2018.csv

##S3
#connecting to S3
ACCESS_KEY = ""
# Encode the Secret Key to remove any "/" characters
SECRET_KEY = "Z%2FZ".replace("/", "%2F") #in-practice keep secure
AWS_BUCKET_NAME = "databricks-corp-training/common" #how it will appear in dbfs
MOUNT_NAME = "/mnt/training-{}".format(username)

# n practice, always secure your AWS credentials. 
# Do this by either maintaining a single notebook with 
# restricted permissions that holds AWS keys, or delete the 
# cells or notebooks that expose the keys. After a cell used to 
# mount a bucket is run, access this mount in any notebook, any 
# cluster, and share the mount between colleagues.

#mount the bucket
try:
  MOUNT_TARGET = "s3a://{}:{}@{}".format(ACCESS_KEY, SECRET_KEY, AWS_BUCKET_NAME)
  dbutils.fs.mount(MOUNT_TARGET, MOUNT_NAME)
except:
  print("{} already mounted. Run previous cells to unmount first".format(MOUNT_NAME))

#unmount the bucket
try:
  dbutils.fs.unmount(MOUNT_NAME) # Use this to unmount as needed
except:
  print("{} already unmounted".format(MOUNT_NAME))

#explore the mount in filesystem
%fs ls /mnt/<MOUNT_NAME>

##JDBC
# Connecting to JDBC
# create connection url
jdbcHostname = "server1.databricks.training"
jdbcPort = 5432
jdbcDatabase = "training"

jdbcUrl = "jdbc:postgresql://{0}:{1}/{2}".format(jdbcHostname, jdbcPort, jdbcDatabase)

#define connection properties
connectionProps = {
  "user": "readonly",
  "password": "readonly"
}

#SERIAL read into df from database
accountDF = spark.read.jdbc(url=jdbcUrl, table="Account", properties=connectionProps)
display(accountDF)

#PARALLEL read into df from database
accountDFParallel = spark.read.jdbc(
  url=jdbcUrl, 
  table="Account",
  column='"insertID"', #partition column *use single quotes to avoid bug
  lowerBound=dfMin, #needed if column set
  upperBound=dfMax, #needed if column set
  numPartitions=12,
  properties=connectionProps
)

#print # of partitions
print(accountDF.rdd.getNumPartitions())
print(accountDFParallel.rdd.getNumPartitions())

#gather stats on both
%timeit accountDF.describe()
# loops, best of 3: 4.39 s per loop
%timeit accountDFParallel.describe()
# loops, best of 3: 2.67 s per loop

