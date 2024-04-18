#!/usr.bin/env python
import sys

def reducer_mapped():
    """Reduces the mapped valeus"""

    current_word = None
    current_count = 0

    #loop through the lines passed in from mapper.py program
    for line in sys.stdin:
        line=line.strip()
        word, count = line.split("\t1",1)

        count = int(count)

        if current_word == word:
            current_count +=count

        else:
            #if there is a current word and it isnt none
            if current_word:
                print(current_word + "\t" + str(current_count))
            current_count = count
            current_word = word

    if current_word == word:
        print(current_word+"\t"+str(current_count))

if __name__ == "__name__":
    reduce_mapped()