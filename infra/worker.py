import json
import uuid
import datetime
import boto3
import os

dynamodb = boto3.resource('dynamodb', region_name='sa-east-1')
table = dynamodb.Table('wizard_leads')

def handler(event, context):
    records = event.get('Records', [])
    print(f"Processing batch of {len(records)} records from SQS.")
    
    for record in records:
        body = json.loads(record['body'])
        
        item = {
            'lead_id': body.get('lead_id', str(uuid.uuid4())),
            'created_at': datetime.datetime.now(datetime.timezone.utc).isoformat(),
            'name': body.get('name', 'N/A'),
            'email': body.get('email', 'N/A'),
            'phone': body.get('phone', 'N/A'),
            'origin_mode': body.get('origin_mode', 'standard_ingress'),
            'sqs_message_id': record.get('messageId')
        }
        
        table.put_item(Item=item)
        print(f"Successfully persisted lead_id: {item['lead_id']}")

    return {'statusCode': 200, 'body': 'Batch processed'}
