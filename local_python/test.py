import boto3
import time

# Set up your S3 bucket and output location
s3_output = 's3://s3-consumer-ksnfkeneeeg78686-data/athena-results/' # Make sure this is correct and accessible

# Athena settings
database = 's3_consumer_akmdkgnj4k34349f_my_data_database'
query = 'SELECT * FROM s3_consumer_ksnfkeneeeg78686_data LIMIT 10;'

# Create a Boto3 client for Athena
client = boto3.client('athena')

# Start the query execution
response = client.start_query_execution(
    QueryString=query,
    QueryExecutionContext={
        'Database': database
    },
    ResultConfiguration={
        'OutputLocation': s3_output
    }
)

# Get the query execution ID
query_execution_id = response['QueryExecutionId']
print(f"Query Execution ID: {query_execution_id}")

# Wait for the query to complete
query_status = None
while query_status not in ['SUCCEEDED', 'FAILED', 'CANCELLED']:
    response = client.get_query_execution(QueryExecutionId=query_execution_id)
    query_status = response['QueryExecution']['Status']['State']
    print(f"Query Status: {query_status}")
    if query_status in ['SUCCEEDED', 'FAILED', 'CANCELLED']:
        break
    time.sleep(5)

# If the query failed, print the reason
if query_status == 'FAILED':
    reason = response['QueryExecution']['Status']['StateChangeReason']
    print(f"Query failed with reason: {reason}")

# If the query succeeded, fetch the results
if query_status == 'SUCCEEDED':
    result_response = client.get_query_results(QueryExecutionId=query_execution_id)
    rows = result_response['ResultSet']['Rows']

    # Print the results
    for row in rows:
        print(row['Data'])
else:
    print(f"Query failed with status: {query_status}")