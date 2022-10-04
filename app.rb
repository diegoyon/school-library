require './student'
require './teacher'
require './book'
require './rental'
require 'json'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person_helper(student_or_teacher, age, name)
    case student_or_teacher
    when 1
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      per = false
      per = true if %w[y Y].include?(permission)
      new_student = Student.new(classroom: 'TBA', age: age, name: name, parent_permission: per)
      @people.push(new_student)
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      new_teacher = Teacher.new(specialization: specialization, age: age, name: name)
      @people.push(new_teacher)
    end
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    student_or_teacher = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    create_person_helper(student_or_teacher, age, name)

    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfully'
  end

  def create_rental
    @books.each_with_index do |book, index|
      puts "#{index} <- Title: \"#{book.title}\", Author: #{book.author}"
    end
    print 'Select a book from the list above by number: '
    book_index = gets.chomp.to_i
    puts ''

    @people.each_with_index do |person, index|
      puts "#{index} <- [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    print 'Select a person from the list above by number (not id): '
    person_index = gets.chomp.to_i
    puts ''

    print 'Date: '
    date = gets.chomp

    new_rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals.push(new_rental)
    puts 'Rental created successfully'
  end

  def list_rentals_of_person
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end

  def options
    puts '-----------------OPTIONS------------------------'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts '------------------------------------------------'
    print 'Please choose an option by entering a number: '
  end

  def cases1(input)
    case input
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    end
  end

  def cases2(input)
    case input
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_of_person
    when 7
      puts 'Thank you for using this app!'
      save_data
    end
  end

  def run
    input = 0
    while input != 7
      options
      input = gets.chomp.to_i
      cases1(input)
      cases2(input)
      puts ''
    end
    puts ''
  end

  def save_data
    File.write("books.json", "")
    @books.each do |book|
      json = JSON.generate({title: book.title, author: book.author})
      File.write('books.json', json +"\n", mode:"a")
    end

    File.write("people.json", "")
    @people.each do |person|
      json = ""
      if person.is_a?(Student)
        json = JSON.generate({type: person.class, id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission})
      else
        json = JSON.generate({type: person.class, id: person.id, name: person.name, age: person.age, specialization: person.specialization})
      end
      File.write('people.json', json +"\n", mode:"a")
    end

    File.write("rentals.json", "")
    @rentals.each do |rental|
      json = JSON.generate({date: rental.date, person: @people.index(rental.person), book: @books.index(rental.book)})
      File.write('rentals.json', json +"\n", mode:"a")
    end
  end

  def load_data
    
    File.foreach("books.json"){
      |line| element = JSON.parse(line)
      new_book = Book.new(element["title"], element["author"])
      @books.push(new_book)
    } if File.exists?("books.json")
    
    File.foreach("people.json"){
      |line| element = JSON.parse(line)
      if element["type"] == 'Student'
        new_student = Student.new(id: element["id"], classroom: "Unknown", age: element["age"], name: element["name"], parent_permission: element["parent_permission"])
        @people.push(new_student)
      else
        new_teacher = Teacher.new(id: element["id"], age: element["age"], specialization: element["specialization"], name: element["name"])
        @people.push(new_teacher)
      end
    } if File.exists?("people.json")

    File.foreach("rentals.json"){
      |line| element = JSON.parse(line)
      new_rental = Rental.new(element["date"], @people[element["person"]], @books[element["book"]])
      @rentals.push(new_rental)
    } if File.exists?("rentals.json")
  end
end
