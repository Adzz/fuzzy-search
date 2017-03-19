require 'csv'

class FuzzyFinder
  attr_reader :output, :data

  # probably quicker to lazily evaluate data, rather than load on initialization?

  def initialize(output = $stdout, data)
    @output = output
    @data = CSV.read(data)
  end

  def find(search_terms)
    results = all_matches(search_terms.split(' '))
    output.puts formatted_results(results) + "\n\n"
  end

  def mass_search(file_path)
    CSV.foreach(file_path) do |search_term|
      find(search_term.join)
    end
  end

  private

  def all_matches(search_terms)
    data.each_with_object([]) do |row, results|
      search_field = row.flatten.join(' ').split(' ')
      results << row if all_terms_match?(search_terms, search_field)
      return results if results.length == 10
    end
  end

  def all_terms_match?(terms, search_field)
    terms.map do |term|
      # if there's no match on any single search term, dont continue with the rest
      break unless term_match?(term, search_field).any?
    end
  end

  def term_match?(term, search_field)
    search_field.map do |word|
      # select only the section of the word we are concerned with
      word[0..term.length-1].downcase == term.downcase
    end
  end

  def formatted_results(results)
    results.map { |x| x.join(",") }.join("\n")
  end
end

