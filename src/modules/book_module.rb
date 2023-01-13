require_relative '../classes/book'
require_relative './label_module'
require_relative './authors_module'
require_relative './genre_module'
require_relative './valid_date'

module BookModule
  # include LabelModule
  include AuthorModule
  include GenreModule

  def list_all_books
    if @books.empty?
      puts "No Books to Show 🚫 Please add some books \n"
    else
      @books.each_with_index do |book, index|
        print "[#{index + 1}]: Title: #{book.title} ╏ Author: #{book.author.first_name} #{book.author.last_name} | "
        print "Label: #{book.label.title} | Archived: #{book.archived} ╏ Publisher: #{book.publisher} ╏ "
        print "Publication_date: #{book.publish_date} ╏ Cover State: #{book.cover_state} ╏ Genre: #{book.genre.name}"
      end
    end
  end

  def create_book
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter the publisher of the book: '
    publisher = gets.chomp
    print 'Enter the publish date of the book e.g (2023-01-11): '
    date = set_valid_date
    print 'Enter the cover state of the book e.g (new, good, acceptable, bad): '
    cover = gets.chomp

    book = Book.new(title, date, publisher, cover)
    archive_book(book)

    author = add_author
    author.add_item(book)
    puts "\nAuthor added for book #{book.title} successfully 👤✅".green

    label = add_label
    label.add_item(book)
    puts "\nLabel added for book #{book.title} successfully 📘✅ ".green

    genre = add_genre
    genre.add_item(book)
    puts "\nGenre added for label #{book.title} successfully 🤹‍♂️✅ ".green
  end

  # def archive_book(book)
  #   while true
  #     print 'Do you want to archive this book? (y/n): '
  #     archive_choice = gets.chomp
  #     break if %w[y n].include?(archive_choice)

  #     puts "\n🛑 ❌ Invalid input. Please enter y or n \n".red

  #   end

  #   archived = (archive_choice == 'y')
  #   book.archived = archived
  #   if archived
  #     if book.move_to_archive
  #       while true
  #         print 'Do you want to confirm archiving this book (y/n): '
  #         confirm = gets.chomp
  #         break if %w[y n].include?(confirm)

  #         puts "\n🛑 ❌ Invalid input Please enter y or n \n".red

  #       end
  #       @books << book
  #       if confirm == 'y'
  #         puts "\nBook created and archived successfully 📕✅ ".green
  #       else
  #         book.archived = false
  #         puts "\nBook not archived but created successfully 📕✅ ".green
  #       end
  #     else
  #       @books << book
  #       puts "\nThe book is not old enough to be archived. Book created successfully 📕✅".green
  #     end
  #   else
  #     @books << book
  #     puts "\nBook created successfully 📕✅".green
  #   end
  # end

  def get_user_input(prompt, valid_responses)
    while true
      print prompt
      input = gets.chomp
      break if valid_responses.include?(input)

      puts "\n🛑 ❌ Invalid input. Please enter one of the following: #{valid_responses.join(', ')} \n".red
    end
    input
  end

  def archive_book(book)
    archived = (get_user_input('Do you want to archive this book? (y/n): ', %w[y n]) == 'y')
    book.archived = archived
    if archived
      if book.move_to_archive
        if get_user_input('Do you want to confirm archiving this book (y/n): ', %w[y n]) == 'y'
          puts "\nBook created and archived successfully 📕✅ ".green
        else
          book.archived = false
          puts "\nBook not archived but created successfully 📕✅ ".green
        end
      else
        book.archived = false
        puts "\nThe book is not old enough to be archived. Book created successfully 📕✅".green
      end
    else
      puts "\nBook created successfully 📕✅".green
    end
    @books << book
  end
end
