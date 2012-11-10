#!/usr/bin/env python

import sys
import time
import pika

queue_server = "localhost"
queue_name = "task_store"

def callback_function(channel, method, properties, body):
    print "Got: %r %d" % (body, body.count('.'))
    channel.basic_ack(delivery_tag = method.delivery_tag)

try:
    connection = pika.BlockingConnection(pika.ConnectionParameters(queue_server))

    channel = connection.channel()
    channel.queue_declare(queue = queue_name, durable = True)
    
    channel.basic_qos(prefetch_count = 1)
    channel.basic_consume(callback_function, queue = queue_name)
    channel.start_consuming()

except Exception as error:
    print "oOps! receiver got wrong!"
    print error
    pass
