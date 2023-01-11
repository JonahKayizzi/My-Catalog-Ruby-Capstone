require_relative '../Classes/music_album'
require_relative '../Classes/genre'
require_relative './utils'
require 'json'

module Musicalbum
    include Utils
    def add_music_album
        puts 'Is it on spotify? [y/n]'
        on_spotify = gets.chomp.to_s.downcase == 'y'
        puts 'Please Enter the date'
        date = gets.chomp
        music_album = MusicAlbum.new(on_spotify, date)
        @music_albums << music_album

        # list the genre

        select_options('genre')
        genre_option = gets.chomp.to_i
        if genre_option == 1
            # print the genres
    else
        puts 'The Name'
        genre_name = gets.chomp
        genre = Genre.new(genre_name)
        # create a genre object
        # save the genre
        @genres << genre
        genre.add_item(music_album)
    end
end
def list_music_albums
    puts 'No album here' if @music_albums.empty?
    @music_albums.each_with_index do |album, index|
        message = 'it is not on spotify'
        message = 'it is on spotify' if album.on_spotify
        puts "#{index + 1}), Publish date: #{album.publish_date}, #{message}"
    end
end
end
    def list_genres
        return puts 'No authors found' if @genres.empty?
        @genres.each_with_index do |genre, index|
            puts "#{index + 1}) Name: #{genre.name}, ID: #{genre.id}"
        end
    end
