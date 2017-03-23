require 'csv'
require_relative '../lib/fuzzy_finder'

RSpec.describe FuzzyFinder do
  let(:csv_data) { "spec/fixtures/data.csv" }
  let(:output) { StringIO.new }

  subject { described_class.new(output, csv_data) }

  it 'parses CSV dataset into memory' do
    expect(subject.data.count).to eq 16
  end

  describe '#mass_search' do
    it 'searches for every csv line it is given' do
      csv_length = CSV.read("spec/fixtures/search_terms.csv").count
      expect(subject).to receive(:find).exactly(csv_length).times

      subject.mass_search("spec/fixtures/search_terms.csv")
    end
  end

  context 'results format' do
    context 'one match' do
      let(:search_term) { "green top" }
      before { subject.find(search_term) }

      it 'prints to output the id for the match' do
        expect(output.string.split(',')[0]).to eq "8524"
      end

      it 'prints to output the description' do
        expect(output.string.split(',')[1]).to eq "Green distressed hibiscus print tankini top"
      end

      it 'prints to output the brand' do
        expect(output.string.split(',')[2]).to eq "Mantaray\n\n"
      end
    end

    context 'multiple matches' do
      let(:result) do
        "14824,Mesquite lace-ups,H by Hudson\n46266,Bonded lace bustier,Untold\n\n"
      end

      it 'seperates each match with a new line' do
        subject.find("lace")
        expect(subject.output.string).to eq result
      end
    end
  end

  describe '#find' do
    context 'the whole data set' do
      let!(:csv_data) { "spec/fixtures/full_throttle.csv" }

      it 'is quick' do
      end
    end
    context 'exact match' do
      let(:result) { "8524,Green distressed hibiscus print tankini top,Mantaray\n\n" }

      it 'returns an exact match' do
        subject.find("green top")
        expect(output.string).to eq result
      end

      it 'matches on brand' do
        subject.find("Mantaray")
        expect(output.string).to eq result
      end

      it 'is case insensitive' do
        uppercase = described_class.new(output, csv_data)
        lowercase = described_class.new(output, csv_data)
        uppercase.find("MANTARAY")
        lowercase.find("mantaray")
        expect(uppercase.output.string).to eq lowercase.output.string
      end
    end

    it 'will only match if ALL the search terms are present in the search field' do
      subject.find("lace bustier")
      expect(subject.output.string).to eq "46266,Bonded lace bustier,Untold\n\n"
    end
  end
end
