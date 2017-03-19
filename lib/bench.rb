require 'benchmark'
require_relative 'fuzzy_finder'

Benchmark.bm do |x|
  x.report("one word:") { FuzzyFinder.new('spec/fixtures/full_throttle.csv').find('lace') }
  x.report("one word:") { FuzzyFinder.new('spec/fixtures/full_throttle.csv').find('green t-shirt') }
  x.report("two word:") { FuzzyFinder.new('spec/fixtures/full_throttle.csv').find('lace up napkin') }
  x.report("three:") { FuzzyFinder.new('spec/fixtures/full_throttle.csv').find('red shorts ralph lauren') }
  x.report("four: ") { FuzzyFinder.new('spec/fixtures/full_throttle.csv').find('red shorts ralph lauren') }
  x.report("six and a half: ") { FuzzyFinder.new('spec/fixtures/full_throttle.csv').find('Van Dal Slip-On Shoe EEE Fit') }
  x.report("over 7 ") { FuzzyFinder.new('spec/fixtures/full_throttle.csv').find("John Lewis Women Cotton Rich Heel/Toe Ankle Socks") }
end

Benchmark.bm do |x|
  x.report("mass search, 100 lines") { FuzzyFinder.new('lib/data.csv').mass_search('spec/fixtures/search_terms.csv')  }
end
