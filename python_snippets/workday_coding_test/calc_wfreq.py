from word_freq import WordFreq
import argparse
import sys
'''
The method is the main area where we fetch wikipedia content
and get the Word Frequencies claculated through methods in 
the 'WordFreq' class in word_freq module

'''
def main():

    parser = argparse.ArgumentParser()
    parser.add_argument("-pid", required=True, help="PageID of the Wikipedia content")
    parser.add_argument("-n",   required=True, help="No:of Top Words Required")
    args = parser.parse_args()

    wfObj = WordFreq(args.pid,args.n)
    title_or_msg,topn_words = wfObj.calc_freq()

    #if the topn_words is empty there is either an error or
    #no top words both cases the script must not proceed further
    if ( len(topn_words) == 0 ):
        print (title_or_msg)
        sys.exit()


    print("Title:" + title_or_msg + '\n')
    print("Top ", args.n, " Words\n")
    for cnt in topn_words:
        print(" - ", cnt, " ", topn_words[cnt])


if __name__ == '__main__':

    main()