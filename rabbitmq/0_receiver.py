#!/usr/bin/env python

import pika

queue_server = "localhost"
queue_name = "test"

def callback_function(channel, method, properties, body):
    print "Got: %r" % (body)

try:
    connection = pika.BlockingConnection(pika.ConnectionParameters(queue_server))

    channel = connection.channel()
    channel.queue_declare(queue = queue_name)
    
    channel.basic_consume(callback_function, queue = queue_name, no_ack = True)
    channel.start_consuming()

except Exception:
    print "oOps! receiver got wrong!"
    pass
