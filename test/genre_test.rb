require_relative '../src/item'
require_relative '../src/genre'

describe 'Genre class' do
    before :each do
        @genre = Genre.new(1, 'ali')
    end
    
    it 'this should validate genre id' do
        expect(@genre.id).to eq 1
    end
    it 'this should validate genre name' do
        expect(@genre.name).to eq 'ali'
    end
    it 'this should validate genre to be an instent from Genre' do
        expect(@genre).to be_an_instance_of(Genre)
    end
    it 'this should validate add_item method' do
        @item = Item.new('2000-01-01', false)
        @genre.add_item(@item)
        expect(@genre.items.length).to eq 1
    end
end