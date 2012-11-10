#!/usr/bin/env python

import pika

queue_server = "localhost"
queue_name = "test"
message = "Hello, Z!"

try:
    connection = pika.BlockingConnection(pika.ConnectionParameters(queue_server))

    channel = connection.channel()
    channel.queue_declare(queue = queue_name)

    channel.basic_publish(exchange = '', routing_key = queue_name, body = message)

    print "  server: %r\n   queue: %r\n message: %r\n" % (queue_server, queue_name, message)

    connection.close()

except Exception:
    print "something wrong!"
    pass
