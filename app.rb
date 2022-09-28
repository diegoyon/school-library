require './student'
require './teacher'
require './book'
require './rental'

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

  def create_person
    print "Do you want to create a student(1) or a teacher(2)? [Input the number]: "
    student_or_teacher = gets.chomp.to_i
    
    print "Age: "
    age = gets.chomp.to_i
    print "Name: "
    name = gets.chomp
    
    if student_or_teacher == 1
      print "Has parent permission? [Y/N]: "
      permission = gets.chomp
      if (permission == 'y' || permission == 'Y')
        per = true;
      else
        per = false;
      end
      newStudent = Student.new(classroom: 'TBA', age: age, name: name, parent_permission: per)
      @people.push(newStudent);
    
    elsif student_or_teacher == 2
      print "Specialization: "
      specialization = gets.chomp
      newTeacher = Teacher.new(specialization: specialization, age: age, name: name)
      @people.push(newTeacher)
    end

    puts "Person created successfully"
  end

  def create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    newBook = Book.new(title, author)
    @books.push(newBook)
    puts "Book created successfully"
  end

  def create_rental
    @books.each_with_index do |book, index|
      puts "#{index} <- Title: \"#{book.title}\", Author: #{book.author}"
    end
    print "Select a book from the list above by number: "
    bookIndex = gets.chomp.to_i
    puts ""

    @people.each_with_index do |person, index|
      puts "#{index} <- [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    print "Select a person from the list above by number (not id): "
    personIndex = gets.chomp.to_i
    puts ""

    print "Date: "
    date = gets.chomp

    newRental = Rental.new(date, @people[personIndex], @books[bookIndex])
    @rentals.push(newRental)
    puts "Rental created successfully"
  end

  def list_rentals_of_person
    print "ID of person: "
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def run()
    input = 0
    while input.to_i != 7
      puts "-----------------OPTIONS------------------------"
      puts "1 - List all books"
      puts "2 - List all people"
      puts "3 - Create a person"
      puts "4 - Create a book"
      puts "5 - Create a rental"
      puts "6 - List all rentals for a given person id"
      puts "7 - Exit"
      puts "------------------------------------------------"
      print "Please choose an option by entering a number: "
      
      input = gets.chomp

      case input.to_i
        when 1
          list_books
          
        when 2
          list_people
          
        when 3
          create_person
          
        when 4
          create_book
          
        when 5
          create_rental
          
        when 6
          list_rentals_of_person

        when 7
        else
          puts "Wrong Input"
      end
      puts ''
    end

    puts "Thank you for using this app!"
    puts ''
  end
end

