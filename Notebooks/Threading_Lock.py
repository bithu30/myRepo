import threading
import time


exitFlg = 0

class myThread(threading.Thread):

	def __init__(self,thrID,name,counter):
		threading.Thread.__init__(self)
		self.thrID = thrID
		self.name=name
		self.counter = counter

	def run(self):
		print "Starting --"+self.name+"\n"
		threadLock.acquire()
		print_time(self.name,self.counter,5)
		threadLock.release()
	

def print_time(threadName,counter,delay):
    	
    	while( counter ):
        	
		time.sleep(delay)
        	print "%s: %s" %(threadName,time.ctime(time.time()))
		counter -= 1

threadLock = threading.Lock()
threads = []


thr1 = myThread(1,"Thread-1",4)
thr2 = myThread(2,"THread-2",3)

thr1.start()
thr2.start()

threads.append(thr1)
threads.append(thr2)

for t in threads:
	t.join()

print "Exiting main Threads"


