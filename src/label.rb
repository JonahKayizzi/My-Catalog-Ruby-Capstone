class Label
    def initialize(title, color)
        @title = title
        @color = color
        @items = []
    end

    def add_item(item)
        @items << item
    end
end