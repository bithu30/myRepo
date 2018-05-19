import pandas as pd

class VlanAllocate(object):

    vlan_file= None
    requests_file = None
    out_file = None
    vlan_df = None

    '''
       The __init__ method will create the vlan tables using pandas library
       and initate the class variales vlan_file and requests_file

       Parameters:
        vlan_file:string:location of the vlan file
        requests_file:string:location of the requests file

    '''

    def __init__(self, vFile, reqFile, outFile):

        self.vlan_file = vFile
        self.requests_file = reqFile
        self.out_file = outFile
        vlan_df = pd.read_csv(self.vlan_file, header=0)
        vlan_df['taken'] = 0 #flag to indicate whether the vlan is already allocated or not

    '''
      The allocate_vlan() method will start allocating vlans as per the
      entries in the requests file

      Parameters:
      No Parameters , will make use of the class variables 

    '''

    def allocate_vlan(self):

        with open(self.requests_file,'r') as requests:

            for line in requests:

                (request_id, is_redundant) = line.split(',')

                print ( request_id, is_redundant)


