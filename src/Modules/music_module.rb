require_relative '../Classes/music_album'
require_relative '../Classes/genre'
require_relative './utils'
require_relative './preserve_module'
require 'json'

module Musicalbum
  include Utils
  include Preserve
  def add_music_album
    puts 'Is it on spotify? [y/n]'
    on_spotify = gets.chomp.to_s.downcase == 'y'
    puts 'Please Enter the date'
    date = gets.chomp
    music_album = MusicAlbum.new(on_spotify, date)
    music_data = {publish_date: date, on_spotify: on_spotify}
    stored_data = fetch_file('music_albums')
    stored_data.push(music_data)
    update_data('music_albums', stored_data)
    @music_albums << music_album

    add_list('genre')
    list_genres

    select_options('genre')
    genre_option = gets.chomp.to_i
    if genre_option == 1
      puts 'ID of the source: '
      id_genre = gets.chomp.to_i
      @genres.each do |genre|
        music_album.add_genre(genre) if genre.id == id_genre
      end
    else
      puts 'The Name'
      genre_name = gets.chomp
      # create a genre object
      genre = Genre.new(genre_name)
      # save the genre
      genre_data = {name: genre_name, id: genre.id}
      stored_data = fetch_file('genre')
      stored_data.push(genre_data)
      update_data('genre', stored_data)
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
