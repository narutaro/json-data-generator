ENDPOINT=$(aws iot describe-endpoint --endpoint-type iot:Data-ATS --output text --query 'endpointAddress')
mosquitto_pub --cafile AmazonRootCA1.pem \
  --cert device.pem.crt \
  --key private.pem.key \
  -h $ENDPOINT \
  -p 8883 \
  -t telemetry \
  -i pub_926b2528 \
  -l \
  -d
