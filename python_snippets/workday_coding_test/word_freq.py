import json
import requests
from collections import Counter
import re
import string

'''
The class that provides all the methods to WordFrequency calculations
'''


class WordFreq(object):

    base_url = 'https://en.wikipedia.org/w/api.php?action=query&prop=extracts&pageids='
    format_string = '&explaintext&format=json'
    final_url=None
    title=None

    '''
    The __init__ method will create the final url that will provide the
    content in the required format
    
    Parameters:
     page_id:Integer:page_id of the content needed
     top_count:Integer:How many top words needed from the content
    
    '''

    def __init__(self, page_id, top_count):

        self.pid = page_id
        self.topn = top_count
        self.final_url = self.base_url + str(page_id) + self.format_string


    '''
    This method is the main function that do word frequency
    calculations.
    
    Parameters: None
    
    Return:
     Word Frequencies for the top n words in the content provided
     by final_url
    '''
    def calc_freq(self):

        result = {}

        content = self.get_content(self.final_url)

        if ( 'status' in content):
            return 'Failed to fetch content from '+self.final_url+'\n Error:'+content['error_msg'],result

        #replacing dot & newline with space in the content
        chunk = re.sub(r'\.|\n',' ',content['txt'])

        # removing unwanted chars and small words ( length < 4 )
        chunk = re.sub(r'\b\w{1,3}\b|\n{2,}|\-', '', chunk)

        #removing all other punctutations from the content
        transtable = chunk.maketrans("", "", string.punctuation);
        chunk = chunk.translate(transtable)

        word_freq = Counter(chunk.split(' '))

        #removing  '' from Counter object
        del (word_freq[''])

        #reversing Counter object , so that it
        #facilitates the selection of top n words
        freq_to_word_dict={}

        for k,v in word_freq.items():
            if v in freq_to_word_dict:
                freq_to_word_dict[v] += ","+k
            else:
                freq_to_word_dict[v] = k



        #fetching all word counts in the ascending order
        word_counts = sorted(freq_to_word_dict.keys(),reverse=True)

        res_dict = {}
        for cnt in word_counts[:int(self.topn)]:
            res_dict[cnt] =  freq_to_word_dict[cnt]


        return  content['title'], res_dict




    '''
        This method will fetch content specified in the
        param 'url'
        
         Parameters:
            url:String: url which has the content
         
         Return:
            title: title of the content
            content: the actual content in the url
             
    '''

    def get_content(self, url):

        content_dict={}
        try:
            reqObj = requests.get(url)
            cont = json.loads(reqObj.text)
            content_dict['title'] = cont['query']['pages'][str(self.pid)]['title']
            content_dict['txt'] = cont['query']['pages'][str(self.pid)]['extract']
        except Exception as err :
            content_dict['status'] = 'Failed'
            content_dict['error_msg'] = type(err).__name__ + ' has stalled the execution of the script'

        return content_dict



