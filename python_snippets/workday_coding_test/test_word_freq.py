from word_freq import WordFreq
import pytest
import re

page_id = 21721040

topn = 5

test_wq = WordFreq(page_id, topn)
title,res = test_wq.calc_freq()

#testing error handling
page_id_exception = 217

topn_exception = 5

test_wq_exception = WordFreq(page_id_exception, topn_exception)
title_exception,res_exception = test_wq_exception.calc_freq()

def test_title():

    #testing if the title is correct
    assert title == 'Stack Overflow'

def test_wrong_title():

    #is test failing when checked aginst the wrong title
    assert title == 'StackOverflow'

def test_topn():

    #testing if the no:of elements returned is equal to the top n words
    assert len(res.keys()) == topn

def test_wrong_topn():

    # is test failing for wrong count other than topn
    assert len(res.keys()) == topn-1

def test_word_freq():

    #test if the result has the right word frequency
    assert 19 in res.keys()

def test_word_freq():

    #test if the result has the right word frequency
    assert 19 in res.keys()

def test_wrong_word_freq():

    #test if the test fails when you check it gainst a frequency that is not there
    assert 1 in res.keys()

def test_words():

    #test if the topn words are clubed together when they have the same frequency
    #also testing if we have got the right words with the frequency
    assert res[19] == 'Stack,questions'


def test_wrong_words():

    #testing if the test fails for wrong inputs
    assert res[19] == 'questions'

#testing the error handling mechanism in the script

def test_no_exception():

    #testing if the test fails if there was no exceptions or empty
    #topn words returned
    assert len(res.keys()) == 0



def test_exception():

    #testing for exception in running the script
    assert title_exception.find('Failed') != -1




