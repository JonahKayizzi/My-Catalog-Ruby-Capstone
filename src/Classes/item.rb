require_relative 'genre'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  # I believe there is alot of unnecessary arguments
  # I believe that the arguments required are (publish_date, archived, id: nil)

  # I believe that the archived var should be in the init arguments
  def initialize(publish_date, archived)
    @id = rand(1000...1)
    @genre = []
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    # (Date.today - publish_date) > 10
    current_year = Time.now.year
    publish_year = Date.parse(@publish_date).year
    current_year - publish_year > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
