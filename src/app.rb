# rubocop:disable Metrics/CyclomaticComplexity

require_relative './app'
require_relative './Classes/music_album'
require_relative './Classes/genre'
require_relative './modules/preserve_module'
require_relative './modules/game_module'
require_relative 'Classes/book'
require_relative 'Classes/label'

class App
  include GameModule
  def initialize
    @response = 0
    @music_albums = []
    @games = load_games
    @author = load_author
    @genres = []
    @books = []
    @labels = []

    load_games
  end

  def run
    puts 'Welcome to My catalog of things'
    while @response != 13
      puts(
        'Select a number to start an action:
          1 - List all books
          2 - List all music albums
          3 - List all movies
          4 - List of games
          5 - List all genres
          6 - List all labels
          7 - List all authors
          8 - List all sources
          9 - Add a book
          10 - Add a music album
          11 - Add a movie
          12 - Add a game
          13 - Exit'
      )
      start_up
    end
  end

  def start_up
    @response = gets.chomp.to_i
    if @response >= 1 && @response <= 8
      list_items
    else
      add_item
    end
    # store_books(@books)
    # store_labels(@labels)
  end

  def list_items
    case @response
    when 1
      # list_books
    when 2
      # list_music_albums
    when 3
      # list_movies
    when 4
      list_games
    when 5
      # list_genres
    when 6
      # list_labels
    when 7
      list_authors
    when 8
      #list_source
    else
      puts 'Invalid input'
    end
  end

  def add_item
    case @response
    when 9
      add_book
    when 10
      # add_music_album
    when 11
      # add_movie
    when 12
      add_game
    end
  end

  def user_input(message)
    print message
    gets.chomp
  def list_books
    puts 'Listing all books'
    if @books.empty?
      puts 'There are no books in the catalog'
    else
      @books.each do |book|
        puts "Publisher: #{book.publisher}, Publication Date: #{book.publish_date}, Author: #{book.author}, Genre: #{book.genre}, Label: #{book.label}"
      end
    end
  end

  def list_labels
    puts 'Listing all labels and their corresponding items'
    if @labels.empty?
      puts 'There are no labels in the catalog'
    else
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
        puts "Items:"
        @labels.items.each_with_index do |item, index|
          puts "#{index}, #{item.class}, #{item.id}"
        end
      end
    end
  end

  def add_a_book
    puts 'Adding a book'
    puts 'Enter the publication date of the book'
    publication_date = gets.chomp
    puts 'Enter the publisher of the book'
    publisher = gets.chomp
    puts 'Enter the state of the cover for the book'
    cover_state = gets.chomp
    puts 'Enter the author of the book'
    author = gets.chomp
    puts 'Enter the label of the book'
    label = gets.chomp
    puts 'Enter the genre of the book'
    genre = gets.chomp
    @books << Book.new(publication_date, publisher, cover_state)
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
