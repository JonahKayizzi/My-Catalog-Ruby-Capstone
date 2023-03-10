require_relative '../Classes/music_album'
require_relative '../Classes/genre'

describe 'Genre class' do
  before :each do
    @genre = Genre.new('soft_pop')
  end

  it 'this should validate genre id is an integer' do
    expect(@genre.id).to be_kind_of(Integer)
  end
  it 'this should validate genre name' do
    expect(@genre.name).to eq 'soft_pop'
  end
  it 'this should validate genre to be an instent from Genre' do
    expect(@genre).to be_an_instance_of(Genre)
  end
end
