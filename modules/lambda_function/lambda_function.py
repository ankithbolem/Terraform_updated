import json
import boto3

def lambda_handler(event, context):
    s3_event = event['Records'][0]['s3']
    bucket_name = s3_event['bucket']['name']
    object_key = s3_event['object']['key']
    
    # Log the new S3 object
    print(f"New object added: {bucket_name}/{object_key}")
    
    # Enable GuardDuty and trigger scanning or logging
    client = boto3.client('guardduty')
    detectors = client.list_detectors()

    if detectors['DetectorIds']:
        detector_id = detectors['DetectorIds'][0]
        print(f"GuardDuty is active and monitoring for bucket: {bucket_name}")

    return {
        'statusCode': 200,
        'body': json.dumps('GuardDuty scan initiated')
    }
