#!/bin/bash

# export KAFKA_CONSUMER_GROUP=your consumer group  
# export KAFKA_ENVIRONMENTS=your kafka environemnts

echo "Consumer: ${KAFKA_CONSUMER_GROUP}"   
echo "Servers: ${KAFKA_ENVIRONMENTS}"

echo "--------------------------------------"

str="./kafka-consumer-groups.sh --group ${KAFKA_CONSUMER_GROUP} --bootstrap-server ${KAFKA_ENVIRONMENTS} --describe | awk ' { if(NR>2) printf(\"Active: %4s, Lag: %5s, Producer Offset: %10s, Consumer Offset: %10s, Partition: %2s, Topic: %s\n\", (\$7 != \"-\" ? \"yes\" : \"no\"), \$6, \$5, \$4, \$3, \$2) }'"
eval $str
