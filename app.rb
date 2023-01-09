class App
  ACTIONS = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_movies,
    4 => :list_games,
    5 => :list_genres,
    6 => :list_labels,
    7 => :list_authors,
    8 => :add_a_book,
    9 => :add_a_music_album,
    10 => :add_a_game,
    0 => :exit
  }.freeze

  def show_interactive_console
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - Add a book'
    puts '9 - Add a music album'
    puts '10 - Add a game'
    puts '0 - Exit'
  end

  def run
    loop do
      show_interactive_console
      option = gets.chomp.to_i
      option = ACTIONS[option]
      if option == :exit
        break
      elsif option
        send(option)
      else
        puts 'That is not a valid input'
      end
    end
  end
end
