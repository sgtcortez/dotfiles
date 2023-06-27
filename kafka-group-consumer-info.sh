#!/bin/bash

# export KAFKA_CONSUMER_GROUP=your consumer group  
# export KAFKA_ENVIRONMENTS=your kafka environemnts

str="./kafka-consumer-groups.sh --group ${KAFKA_CONSUMER_GROUP} --bootstrap-server ${KAFKA_ENVIRONMENTS} --describe | awk ' { if(NR>2) printf(\"Lag: %10s, Producer Offset: %10s, Topic: %s\n\", \$6, \$5, \$2) }'"
eval $str
