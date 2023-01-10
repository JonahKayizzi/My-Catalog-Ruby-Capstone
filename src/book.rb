require './item'

class Book < Item
    attr_accessor :author, :genre
    
    def initialize(publisher, cover_state)
        super()
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
        @cover_state == 'bad'
    end
end