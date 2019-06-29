## PYSPARK
#reading a csv to spark df
path = "/mnt/training/EDGAR-Log-20170329/EDGAR-Log-20170329.csv"

logDF = (spark
  .read
  .option("header", True)
  .csv(path)
  .sample(withReplacement=False, fraction=0.3, seed=3) # using a sample to reduce data size
)

#example with options (tuples)
crimeDF = (spark.read
  .option("delimiter", "\t") #what type of file?
  .option("header", True) #spark does not auto infer header
  .option("timestampFormat", "mm/dd/yyyy hh:mm:ss a") #convert timestamp
  .option("inferSchema", True) #Set "inferSchema" to True, which triggers Spark to make an extra pass over the data to infer the schema.
  .csv("/mnt/training/Chicago-Crimes-2018.csv")
)

#example reading in multiple files
path = "mnt/training/UbiqLog4UCI/14_F/log*"
smartphoneDF = spark.read.json("/mnt/training/UbiqLog4UCI/14_F/log*")

# smartphoneDF = (spark
#   .read
#   .option("header", True)
#   .csv(path)
# #   .sample(withReplacement=False, fraction=0.3, seed=3) # using a sample to reduce data size
# )

#display
display(logDF)

#filter & select
from pyspark.sql.functions import col

serverErrorDF = (logDF
  .filter((col("code") >= 500) & (col("code") < 600))
  .select("date", "time", "extention", "code")
)

display(serverErrorDF)

#group by & agg
from pyspark.sql.functions import from_utc_timestamp, hour, col

countsDF = (serverErrorDF
  .select(hour(from_utc_timestamp(col("time"), "GMT")).alias("hour"))
  .groupBy("hour")
  .count()
  .orderBy("hour")
)

display(countsDF)

#write df to parquet
(serverErrorDF
  .write
  .mode("overwrite") # overwrites a file if it already exists
  .parquet("/tmp/" + username + "/log20170329/serverErrorDF.parquet")
)

# group by ip and count times
ipCountDF = (logDF
  .select(from_utc_timestamp(col("time"), "GMT").alias("time"),col("ip"))
  .groupBy("ip")
  .count().alias("count")
  .orderBy("count",ascending=False)
  )
  ## or...
  from pyspark.sql.functions import desc

ipCountDF = (logDF
  .select(from_utc_timestamp(col("time"), "GMT").alias("time"),col("ip"))
  .groupBy("ip")
  .count().alias("count")
  .orderBy(desc("count"))
  )

#simple aggregation (min/max)
from pyspark.sql.functions import min,max

# TODO
dfMin = accountDF.select(min('insertID')).first()[0]
dfMax = accountDF.select(max('insertID')).first()[0]


##SCHEMAS
# Providing a schema increases performance two to three times
# Schema Inference
zipsDF = spark.read.json("/mnt/training/zips.json")
zipsDF.printSchema()
# root
#  |-- _id: string (nullable = true)
#  |-- city: string (nullable = true)
#  |-- loc: array (nullable = true)
#  |    |-- element: double (containsNull = true)
#  |-- pop: long (nullable = true)
#  |-- state: string (nullable = true)

zipsSchema = zipsDF.schema
print(type(zipsSchema))

[field for field in zipsSchema]

# tore the schema as an object by calling .schema on a DataFrame. 
# Schemas consist of a StructType, which is a collection of StructFields. 
# Each StructField gives a name and a type for a given field in the data.

#User Defined Schemas
from pyspark.sql.types import StructType, StructField, IntegerType, StringType

#create the schema
zipsSchema2 = StructType([
  StructField("city", StringType(), True), 
  StructField("pop", IntegerType(), True) 
])

zipsDF2 = (spark.read
  .schema(zipsSchema2)
  .json("/mnt/training/zips.json")
)

display(zipsDF2)

# A primitive type contains the data itself.  The most common primitive types include:

# | Numeric | General | Time |
# |-----|-----|
# | `FloatType` | `StringType` | `TimestampType` | 
# | `IntegerType` | `BooleanType` | `DateType` | 
# | `DoubleType` | `NullType` | |
# | `LongType` | | |
# | `ShortType` |  | |

from pyspark.sql.types import StructType, StructField, IntegerType, StringType, ArrayType, FloatType

#create the schema
zipsSchema3 = StructType([
  StructField("city", StringType(), True), 
  StructField("loc", 
    ArrayType(FloatType(), True), True),
  StructField("pop", IntegerType(), True)
])

#apply the schema when reading in file
zipsDF3 = (spark.read
  .schema(zipsSchema3)
  .json("/mnt/training/zips.json")
)
display(zipsDF3)


#apply UD Schema to files
from pyspark.sql.types import StructType, StructField, StringType
from pyspark.sql.functions import col

schema2 = StructType([
  StructField("SMS", StructType([
    StructField("Address",StringType(),True),
    StructField("date",StringType(),True),
    StructField("metadata", StructType([
      StructField("name",StringType(), True)
    ]), True),
  ]), True)
])

SMSDF2 = (spark.read
  .schema(schema2)
  .json("/mnt/training/UbiqLog4UCI/14_F/log*")
  .filter(col("SMS").isNotNull()))

display(SMSDF2)

#


