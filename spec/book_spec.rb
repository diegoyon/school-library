require_relative '../book'

describe '#title' do
  it 'returns the correct title' do
    book = Book.new('Lord of the Rings', 'Tolkien')
    expect(book.title).to eql 'Lord of the Rings'
  end
end

describe '#author' do
  it 'returns the correct author' do
    book = Book.new('Lord of the Rings', 'Tolkien')
    expect(book.author).to eql 'Tolkien'
  end
end
