# JSON data generator

Generate JSON data pretending multiple sensors. It can pass the data to another application(eg. mosquitto_pub) by UNIX pipe. 

```mermaid
graph LR
    A(json-generator.rb)
    B(publish.sh)
    C(IoT Core)
    A--pipe-->B--MQTT-->C  
```

JSON:

```json
{
  "device_id": "device_8",
  "device_time": "1675499216153",
  "temperature": 101.71,
  "humidity": 100.14
}
```

# Usage

```
Usage: message_generator [options]
    -c, --count integer              message count
    -i, --interval float             message interval
    -d, --destination string         pipe destination (eg. mosquitto_pub)
```

Example:

```
ruby message_generator.rb -c 100 -i 0.5 -d ./publish.sh
```

