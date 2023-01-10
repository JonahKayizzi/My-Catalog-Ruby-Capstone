require_relative '../src/music_album'
require 'date'

describe 'Music Album Class' do

    before :each do
        @album1 = Music_album.new('2000-01-01', false, true)
        @album2 = Music_album.new('2000-01-01', false, false)
    end
    
    it 'should validate music album publish date' do
        expect(Date.parse(@album1.publish_date).year).to eq 2000
    end
    it 'should validate music album on spotify' do
        expect(@album1.on_spotify).to eq true
    end
    it 'should validate that album is an instant of the Music_album class' do
        expect(@album1).to be_an_instance_of(Music_album)
    end
    it 'should validate can_be_archived? method' do
        expect(@album1.can_be_archived?).to eq true
    end
        

end