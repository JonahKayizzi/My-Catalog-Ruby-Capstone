require_relative '../Classes/label'

describe Label do
  label = Label.new('Label 1', 'red')

  context '#new' do
    it 'creates a new label' do
      expect(label).to be_an_instance_of Label
    end

    it 'has a title' do
      expect(label.title).to eq('Label 1')
    end

    it 'has a color' do
      expect(label.color).to eq('red')
    end
  end

  context '#add_item' do
    it 'adds an item to the list of items' do
      book = Book.new('2000-01-01', 'The Hobbit', 'good')
      label.add_item(book)
      expect(label.items).to eq([book])
    end

    it 'adds the label to the label property of the item' do
      book = Book.new('2000-01-01', 'The Hobbit', 'good')
      label.add_item(book)
      expect(book.label).to eq(label)
    end
  end
end
