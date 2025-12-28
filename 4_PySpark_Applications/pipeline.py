import dlt
from pyspark.sql.functions import *
from pyspark.sql.types import *
from pyspark.sql.window import Window

@dlt.table(
    name = "items_raw"
)

def items_raw():
  df = spark.read.table("pyspark_cata.source.items")
  return df

@dlt.table(
    name = "items_enr" # enriched/transformed
)

def items_enr():
  df = dlt.read("items_raw")
  df = df.withColumn("dedup", row_number().over(Window.partitionBy("item_id").orderBy(desc("updated_at"))))
  return df.where(col("dedup") == 1).drop("dedup")

dlt.create_streaming_table(
    name = "items_dim"
)


dlt.create_auto_cdc_flow(
  target = "items_dim",
  source = "items_enr",
  keys = ["item_id"],
  sequence_by = "updated_at",
  stored_as_scd_type = 2,
)