# json-data-generator

Generate JSON data like sensors. Pipe to another application such as mosquitto_pub

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

