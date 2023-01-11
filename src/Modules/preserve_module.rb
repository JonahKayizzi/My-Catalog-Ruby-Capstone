require_relative '../Classes/author'
require 'json'

module Preserve
  attr_accessor :games, :movies, :author, :source, :books, :labels

  def fetch_file(file)
    file_path = "./JSON/#{file}.json"
    File.new(file_path, 'w+') unless File.exist?(file_path)
    File.write(file_path, '[]') if File.empty?(file_path)
    contents = File.read(file_path)
    JSON.parse(contents)
  end

  def update_data(file, data)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    json_data = JSON.generate(data, opts)
    File.write("./JSON/#{file}.json", json_data)
  end

  def load_games
    fetch_file('games').map { |album| Game.new(album['publish_date'], album['multiplayer'], album['last_played']) }
  end

  def load_author
    fetch_file('authors').map { |author| Author.new(author['first_name'], author['last_name']) }
  end

  def load_books
    fetch_file('books').map { |book| Book.new(book['publish_date'], book['publisher'], book['cover_state']) }
  end
  def load_music_albums
    fetch_file('music_albums').map { |album| MusicAlbum.new(album['on_spotify'], album['publish_date'])}
  end
  def load_genre
    fetch_file('genre').map { |genre| Genre.new(genre['name']) }
  end

  def load_labels
    fetch_file('labels').map { |label| Label.new(label['title'], label['color']) }
  end
end
