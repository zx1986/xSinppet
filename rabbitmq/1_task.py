#!/usr/bin/env python

import sys
import pika

queue_server = "localhost"
queue_name = "task_store"
message = ' '.join(sys.argv[1:]) or "This is default message."

try:
    connection = pika.BlockingConnection(pika.ConnectionParameters(queue_server))

    channel = connection.channel()
    channel.queue_declare(queue = queue_name, durable = True)

    channel.basic_publish(exchange = '',
                          routing_key = queue_name,
                          body = message,
                          properties = pika.BasicProperties(delivery_mode = 2))

    print "  server: %r\n   queue: %r\n message: %r\n" % (queue_server, queue_name, message)

    connection.close()

except Exception:
    print "something wrong!"
    pass
