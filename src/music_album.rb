require_relative 'item'

class Music_album < Item
  attr_accessor :on_spotify

  def initialize(_publish_date, _archived, on_spotify)
    # super(id, genre, author, source, label, publish_date)
    # here I am sending this unnecessary agruments
    super(_publish_date, _archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    super && on_spotify
  end
end
