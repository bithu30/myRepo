#The script has two lists,the purpose of the script
#is to check for the presence of a sequence or pattern
#in one list against the other

#passCriteria
#The sequence or pattern that need to be checked
#it must be a non-emtpy list with any type of data in it
#mainSeq :
#mainSeq holds the seq that will be verified with passCriteria
#it could be even a empty list
import sys

def dataEntryAndValidate():
    input_passCriteria = input("Please enter passCriteria ( enter comma separated values like 1,2,3) : ")


    if (len(input_passCriteria) > 0):
        # carving out the mainSeq from the user input
        passCriteria = input_passCriteria.split(",")
        #print(passCriteria)
    else:
        print("passCriteria must have at least one element")
        sys.exit()

    input_mainSeq = input("Please enter mainSeq ( enter comma separated values like 1,2,3) : ")

    if (len(input_mainSeq) > 0):
        # carving out the mainSeq from the user input
        mainSeq = input_mainSeq.split(",")
        #print(mainSeq)
    else:
        return False
    return passCriteria,mainSeq

def startCheking(seqToCheck,lstToCheck):
    seqToCheck_len = len(seqToCheck)
    lstToCheck_len = len(lstToCheck)
    #if the length of lstToCheck is lesser than
    #seqToCheck then we can straight away return false
    if lstToCheck_len < seqToCheck_len:
        return False
    stat=False #intialization of status flag to be returned
    start=0
    end = start+seqToCheck_len
    print
    while( end <= lstToCheck_len ):
        chekSeq = lstToCheck[start:end]
        #print(chekSeq)
        #this loop will excute only when the subset extracted has
        #The same length
        if (chekSeq == seqToCheck) and (len(chekSeq) == seqToCheck_len) :
            stat= True
        start += 1
        end = start+seqToCheck_len
        print(end)
    return stat

def runAutomatedTests():


if __name__ == '__main__':

    #Function collects the data and validates it
    (passCondition,checkList) = dataEntryAndValidate()
    #Start checking for passCondition in checkList
    status=startCheking(passCondition,checkList)
    print(status)





