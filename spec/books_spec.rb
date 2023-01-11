require_relative '../src/book'
require 'date'

describe Book do
    let (:book) { Book.new('Mc Milan', 'good') }

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
end