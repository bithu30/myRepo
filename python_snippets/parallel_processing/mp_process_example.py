import multiprocessing as mp
import random
import string

def rand_string(length,output):
    """Generates a random string of numbers, lower- and uppercase chars."""
    rand_str = ''.join(random.choice(
                    string.ascii_lowercase+
                    string.ascii_uppercase+
                    string.digits
                ) for i in range(length) )
    output.put(rand_str)

if __name__ == '__main__':

    random.seed(123)

    #Define Output queue
    output = mp.Queue()

    # Setup a list of processes that we want to run
    procs = [mp.Process(target=rand_string,args=(5,output)) for x in range(4)]


    #Run process
    for p in procs:
        p.start()

    #collecting the results
    for p in procs:
        p.join()

    #getting the results
    results=[output.get() for p in procs]

    print(results)

