initial thought myers diff algorithm, calculat the smallest diff between the two
second thought bitwise - for speed perhaps?


We can instantly reject if we ever dont have one of the words match any of the beginings of the descriptions

group together our search field into an array of words
search each word for a match against each search term. Break unless we get a match.


if you break - need to skip to the next


score can be percentage of correct words?

only a match if the word 



### bonus

include id search - exact match in algorithm


Read in CSV data - story in memory
Read in a file of search terms - for each term, perform the fuzzy search
10 Maximium results
results should look like:

result_number
score,id,name,brand

And should be outputted to STDOUT

SPEED IS IMPORTANT... < 50ms (/ query ?)

A Match means:

 - EACH token in the query must be found in ANY field of the product as a CASE-INSENSITIVE PREFIX 

You can choose your own relevance scoring function


We will submit a series of queries to your program and then evaluate the results. We will judge two things:

Performance: Does it take less than 50ms? Note that we won't consider initialisation time (i.e parsing CSV into memory etc.) as part of this requirement.

Correctness: Are the results correct?
Relevance: Are the results ordered in a way that puts the most relevant products at the top of the list?



emphasise fun challenge
potentially talk about myers diff algorithm, or simple string percentage calculation
I wondered if you could get some kind of bitwise operation going, and compare the strings on a binary level


Didnt get a chance to rank things, some ideas on that front are would be to compute some kind of diff when you have a match. Performance becomes a concern.
You could take a match and see as a percentage how correct it was - 100% being the whole word match and red in reddish being a 42% match.

You could try and do pairwise matches using lookaheads with regexes maybe? comput



