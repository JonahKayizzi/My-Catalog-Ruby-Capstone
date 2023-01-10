class App
  # Define collections
  books = {}
  music_albums = {}
  movies = {}
  games = {}
  genres = {}
  labels = {}
  authors = {}
  sources = {}

  def show_interactive_console
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all movies'
    puts '4. List all games'
    puts '5. List all genres'
    puts '6. List all labels'
    puts '7. List all authors'
    puts '8. List all sources'
    puts '9. Add a book'
    puts '10. Add a music album'
    puts '11. Add a movie'
    puts '12. Add a game'
    puts '0 - Exit'
  end

  def run
    while true do
      show_interactive_console
      option = gets.chomp.to_i
      case option
      when 1
        list_items(books, "books")
      when 2
        list_items(music_albums, "music albums")
      when 3
        list_items(movies, "movies")
      when 4
        list_items(games, "games")
      when 5
        list_items(genres, "genres")
      when 6
        list_items(labels, "labels")
      when 7
        list_items(authors, "authors")
      when 8
        list_items(sources, "sources")
      when 9
        add_item(books, "book")
      when 10
        add_item(music_albums, "music album")
      when 11
        add_item(movies, "movie")
      when 12
        add_item(games, "game")
      when 13
        puts "Quitting the app..."
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end
end
