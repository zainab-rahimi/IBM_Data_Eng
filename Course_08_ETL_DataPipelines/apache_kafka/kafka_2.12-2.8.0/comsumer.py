from kafka import KafkaConsumer

consumer = KafkaConsumer('bank_branch1',
                         group_id= None,
                         bootstrap_servers = ['localhost:9092'],
                         auto_offset_reset = 'earliest')

print("something to show")
print (consumer)

for msg in consumer:
    print (msg.value.decode("utf-8"))