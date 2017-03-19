#!/usr/local/bin/ruby

require_relative '../lib/fuzzy_finder.rb'

puts "Let the search begin!"
puts "We will be searching the data found in lib/data.csv"
puts "tell us what you want:"
search_terms = gets

FuzzyFinder.new("lib/data.csv").find(search_terms.to_s)
