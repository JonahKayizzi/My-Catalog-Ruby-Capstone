require_relative '../Classes/game'
require_relative './preserve_module'
require_relative './utils'

module GameModule
  include Preserve
  include Utils
  def add_game
    puts 'Published Date: '
    published_date = gets.chomp

    print 'Is it a multiplayer game? [Y/N]: '
    multiplayer = gets.chomp.to_s.downcase == 'y'

    print 'When was it last played at? '
    last_played_at = gets.chomp

    game = Game.new(published_date, multiplayer, last_played_at)
    game_data = { publish_date: published_date, multiplayer: multiplayer, last_played: last_played_at }
    stored_data = fetch_file('games')
    stored_data.push(game_data)
    update_data('games', stored_data)
    @games << game

    add_list('author')
    list_authors

    select_options('authors')
    author_option = gets.chomp.to_i
    if author_option == 1
      print 'ID of the source: '
      id_author = gets.chomp.to_i
      @author.each do |author|
        game.add_author(author) if author.id == id_author
      end
    else
      puts 'First Name: '
      first_name = gets.chomp
      puts 'Last Name: '
      last_name = gets.chomp

      author = Author.new(first_name, last_name)
      author_data = { first_name: first_name, last_name: last_name }
      stored_data = fetch_file('authors')
      stored_data.push(author_data)
      update_data('authors', stored_data)
      @author << author
      author.add_item(game)
    end
  end

  def list_games
    puts 'No available games' if @games.empty?

    @games.each_with_index do |game, index|
      puts "#{index + 1}) Publish date: #{game.publish_date}, Last played: #{game.last_played_at},
      Multiplayer: #{game.multiplayer}"
    end
  end

  def list_authors
    return puts 'No authors found' if @author.empty?

    @author.each_with_index do |author, index|
      puts "#{index + 1}) ID: #{author.id}, First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end
end
