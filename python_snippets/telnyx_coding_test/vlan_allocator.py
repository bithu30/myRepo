import argparse
from vlan_allocate import  VlanAllocate

'''
The method is the main area where the process for vlan allocation 
is triggered through methods in 
the 'VlanAllocate' class in word_freq module
'''
def main():

    parser = argparse.ArgumentParser()
    parser.add_argument("-vfile", required=True, help="location of the vlan file")
    parser.add_argument("-reqfile",   required=True, help="location of the requests file")
    parser.add_argument("-outfile", required=True, help="location of the output file")
    args = parser.parse_args()

    vAllocateObj =VlanAllocate(args.vfile,args.reqfile,args.outfile)
    vAllocateObj.allocate_vlan()


if __name__ == '__main__':

    main()