require_relative '../src/label'
require_relative '../src/book'

describe Book do
    let (:book) { Book.new('Mc Milan', 'good') }

    context '#new' do
        it 'creates a new book' do
            expect(book).to be_an_instance_of Book
        end

        it 'has a title' do
            expect(book.title).to eq('The Hobbit')
        end

        it 'has an author' do
            expect(book.author).to eq('J.R.R. Tolkien')
        end
    end
end