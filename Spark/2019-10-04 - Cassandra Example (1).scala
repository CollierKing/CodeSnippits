// Databricks notebook source
// MAGIC %md ## Cassandra Setup. 
// MAGIC 1. Make sure the security group allows Databricks to read the port 9042
// MAGIC 1. Add spark-cassandra-connector_2.10-2.0.0-M3 ONLY library,

// COMMAND ----------

// MAGIC %sh
// MAGIC // try to ping the cassandra node to make sure connectivity is working
// MAGIC ping -c 2 ec2-54-205-226-21.compute-1.amazonaws.com

// COMMAND ----------

// define the cluster name and cassandra host name
val sparkClusterName = "test1"
val cassandraHostIP = "ec2-54-205-226-21.compute-1.amazonaws.com"

// COMMAND ----------

dbutils.fs.rm("/databricks/init/$sparkClusterName/cassandra.sh")

// COMMAND ----------

//adding the hostname to all worker nodes via init script
dbutils.fs.put(s"/databricks/init/$sparkClusterName/cassandra.sh",
  s"""
     #!/usr/bin/bash
     echo '[driver]."spark.cassandra.connection.host" = "$cassandraHostIP"' >> /home/ubuntu/databricks/common/conf/cassandra.conf
   """.trim, true)

// COMMAND ----------

//verify sparkconf is set properly
spark.getConf.get("spark.cassandra.connection.host")

// COMMAND ----------

//Create a table in Cassandra in any keyspace by running cqlsh command
// CREATE table words_new (
//     user  TEXT, 
//     word  TEXT, 
//     count INT, 
//     PRIMARY KEY (user, word));


// INSERT INTO words_new (user, word, count ) VALUES ( 'Russ', 'dino', 10 );
// INSERT INTO words_new (user, word, count ) VALUES ( 'Russ', 'fad', 5 );
// INSERT INTO words_new (user, word, count ) VALUES ( 'Sam', 'alpha', 3 );
// INSERT INTO words_new (user, word, count ) VALUES ( 'Zebra', 'zed', 100 );

// COMMAND ----------

// MAGIC %md ### Read Cassandra

// COMMAND ----------

// MAGIC %md ##### Option1 (Dataframe Read the cassandra table `words_new`)

// COMMAND ----------

val df = sqlContext
  .read
  .format("org.apache.spark.sql.cassandra")
  .options(Map( "table" -> "words_new", "keyspace" -> "test_keyspace"))
  .load
df.explain

// COMMAND ----------

display(df)

// COMMAND ----------

// MAGIC %md ##### Option 2(Dataframe Read table Using Helper Function)

// COMMAND ----------

val df2 = spark
  .read
  .cassandraFormat("words_new", "test_keyspace", "Test Cluster")
  .load()

// COMMAND ----------

display(df2)

// COMMAND ----------

// MAGIC %md ### Write to Cassandra

// COMMAND ----------

//Create a table in Cassandra before writing to it
// CREATE table employee_new (
//     id  TEXT, 
//     dep_id  TEXT, 
//     age INT, 
//     PRIMARY KEY (id));

// COMMAND ----------

//Create a sample dataframe that is going to be written in Cassandra table
import org.apache.spark.sql.functions._
val employee1 = spark.range(0, 3).select($"id".as("id"), (rand() * 3).cast("int").as("dep_id"), (rand() * 40 + 20).cast("int").as("age"))

// COMMAND ----------

//Writing the dataframe directly to cassandra
import org.apache.spark.sql.cassandra._


employee1.write
  .format("org.apache.spark.sql.cassandra")
  .mode("overwrite")
  .options(Map( "table" -> "employee_new", "keyspace" -> "test_keyspace"))
  .save()
