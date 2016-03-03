
# coding: utf-8

# In[1]:

import thread
import time


# In[2]:

def print_time(threadName,delay):
    count=0
    while( count < 5 ):
        time.sleep(delay)
        count += 1
        print "%s: %s" %(threadName,time.ctime(time.time()))


# In[ ]:

try:
    thread.start_new_thread(print_time,("Thread-1",2))
    thread.start_new_thread(print_time,("Thread-2",4))
except:
   print "Error: unable to start thread"

while 1:
   pass
# In[ ]:



