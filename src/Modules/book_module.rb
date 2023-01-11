require_relative '../Classes/game'
require_relative './utils'

module BookModule
  include Utils

  def add_book
    puts 'Adding a book'
    puts 'Enter the publication date of the book'
    publication_date = gets.chomp
    puts 'Enter the publisher of the book'
    publisher = gets.chomp
    puts 'Enter the state of the cover for the book'
    cover_state = gets.chomp

    new_book = Book.new(publication_date, publisher, cover_state)
    @books << new_book

    add_list('labels')
    select_options('label')

    label_option = gets.chomp.to_i
    if label_option == 1
    # do nothing for now
    else
      puts 'Enter the title of the label'
      label_title = gets.chomp
      puts 'Enter the color of the label'
      label_color = gets.chomp

      new_label = Label.new(label_title, label_color)
      @labels << new_label
      new_book.add_label(new_label)
    end
  end

  def list_books
    puts 'Listing all books'
    if @books.empty?
      puts 'There are no books in the catalog'
    else
      @books.each do |book|
        puts "Publisher: #{book.publisher}, Publication Date: #{book.publish_date}, Label: #{book.label.title}"
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
        puts 'Items:'
        if label.items.empty?
          puts 'There are no items with this label'
        else
          label.items.each_with_index do |item, index|
            puts "#{index}, Type: #{item.class}, ID: #{item.id}"
          end
        end
      end
    end
  end
end
