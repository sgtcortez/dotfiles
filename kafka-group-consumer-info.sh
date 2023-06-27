#!/bin/bash

# export KAFKA_CONSUMER_GROUP=your consumer group  
# export KAFKA_ENVIRONMENTS=your kafka environemnts

echo "Consumer: ${KAFKA_CONSUMER_GROUP}"   
echo "Servers: ${KAFKA_ENVIRONMENTS}"

echo "--------------------------------------"

str="./kafka-consumer-groups.sh --group ${KAFKA_CONSUMER_GROUP} --bootstrap-server ${KAFKA_ENVIRONMENTS} --describe | awk ' { if(NR>2) printf(\"Lag: %10s, Producer Offset: %10s, Partition: %2s Topic: %s\n\", \$6, \$5, \$3, \$2) }'"
eval $str
