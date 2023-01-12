require 'date'

class Item
  attr_accessor :publish_date, :archived, :label, :author, :genre, :source
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_source(source)
    @source = source
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def can_be_archived?
    Date.today - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
