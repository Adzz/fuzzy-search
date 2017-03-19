## Fuzzy Searcher

To run the programme in the command line use the command `ruby bin/start.rb` and enter your search term.

## The challenge:

1. Read in CSV data
2. Read in a file of search terms
3. Return a Maximium of 10 correct, ranked results, quickly

Results should look like:

result_number
score,id,name,brand

And should be outputted to STDOUT

A Match means:

- EACH token in the query must be found in ANY field of the product as a CASE-INSENSITIVE PREFIX 

You can choose your own relevance scoring function

Judged on two things:

Performance:
  - Does it take less than 50ms? Note that we won't consider initialisation time (i.e parsing CSV into memory etc.) as part of this requirement.
Correctness:
  - Are the results correct?
Relevance:
  - Are the results ordered in a way that puts the most relevant products at the top of the list?
