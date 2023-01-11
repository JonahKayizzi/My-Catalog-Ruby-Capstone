require_relative '../Classes/book'
require 'date'

describe Book do
  book = Book.new('2000-01-01', 'Mc Milan', 'good')

  context '#new' do
    it 'creates a new book' do
      expect(book).to be_an_instance_of Book
    end

    it 'has a title' do
      expect(book.publisher).to eq('Mc Milan')
    end

    it 'has a cover state' do
      expect(book.cover_state).to eq('good')
    end
  end

  context '#can_be_archived?' do
    it 'returns true if the book is older than 10 years' do
      expect(book.can_be_archived?).to be true
    end
  end
end
