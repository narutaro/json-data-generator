mosquitto_pub --cafile AmazonRootCA1.pem \
  --cert device.pem.crt \
  --key private.pem.key \
  -h <end-point-id>-ats.iot.<region>.amazonaws.com \
  -p 8883 \
  -t telemetry \
  -i pub_926b2528 \
  -l \
  -d
