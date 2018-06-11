
myTask= {'task date':'03-10-1996', 'task start time ':12, 'task duration':'12 hours', 'people for task' :['Stephen','David','Paul']}
myEvent= {'Event date':'14-11-2017', 'Event start time ':8, 'Event location':'dublin'}
myTask2= {'task2 date':'12-10-2016', 'task2 start time ':10, 'task2 duration':'11 hour', 'people for task2' :['Stephen','John']}

myQ = []

def isEmpty(lst):
	return lst == [] 
def enqueue(new,item):
	new += [item]
	return new
def dequeue(new):
	global myQ 
	myQ = myQ[1:]
	return myQ


enqueue(myQ,myTask)
print(myQ)
print("")
enqueue(myQ,myEvent)
print(myQ)
print("")
dequeue(myQ)
print(myQ)
enqueue(myQ,myTask2)
print(myQ)
print("")
dequeue(myQ)
print(myQ)
print("")
dequeue(myQ)
print(myQ)
