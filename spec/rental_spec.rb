require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe '#date' do
  it 'returns the correct date' do
    book = Book.new('Lord of the rings', 'Tolkien')
    person = Person.new(name: 'Diego', age: 31)
    rental = Rental.new('05/10/2022', person, book)
    expect(rental.date).to eql '05/10/2022'
  end
end

describe '#book' do
  it 'checks if book is added to the book object' do
    book = Book.new('Lord of the rings', 'Tolkien')
    person = Person.new(name: 'Diego', age: 31)
    rental = Rental.new('05/10/2022', person, book)
    expect(rental.book).to eql book
    expect(book.rentals).to include rental
  end
end

describe '#person' do
  it 'checks if person is added to the person object' do
    book = Book.new('Lord of the rings', 'Tolkien')
    person = Person.new(name: 'Diego', age: 31)
    rental = Rental.new('05/10/2022', person, book)
    expect(rental.person).to eql person
    expect(person.rentals).to include rental
  end
end
