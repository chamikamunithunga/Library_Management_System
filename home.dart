import 'dart:io';

class Book {
  String title;
  String author;
  int yearPublished;

  Book(this.title, this.author, this.yearPublished);

  void displayDetails() {
    print('Title: $title');
    print('Author: $author');
    print('Published Year: $yearPublished\n');
  }
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
    print('Book "${book.title}" added to the library.\n');
  }

  void viewBooks() {
    if (books.isEmpty) {
      print('No books in the library.');
    } else {
      for (int i = 0; i < books.length; i++) {
        print('Book ${i + 1}:');
        books[i].displayDetails();
      }
    }
  }

  void searchBookByTitle(String title) {
    bool found = false;
    for (var book in books) {
      if (book.title.toLowerCase() == title.toLowerCase()) {
        print('Book found:');
        book.displayDetails();
        found = true;
        break;
      }
    }
    if (!found) {
      print('Book with title "$title" not found.');
    }
  }
}

void main() {
  Library library = Library();
  bool exit = false;

  while (!exit) {
    print('Library Management System:');
    print('1. Add a book');
    print('2. View all books');
    print('3. Search for a book by title');
    print('4. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter book title: ');
        String? title = stdin.readLineSync();
        stdout.write('Enter book author: ');
        String? author = stdin.readLineSync();
        stdout.write('Enter year published: ');
        String? year = stdin.readLineSync();

        if (title != null && author != null && year != null && int.tryParse(year) != null) {
          Book newBook = Book(title, author, int.parse(year));
          library.addBook(newBook);
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case '2':
        library.viewBooks();
        break;

      case '3':
        stdout.write('Enter the book title to search: ');
        String? searchTitle = stdin.readLineSync();
        if (searchTitle != null) {
          library.searchBookByTitle(searchTitle);
        }
        break;

      case '4':
        exit = true;
        print('Exiting the program.');
        break;

      default:
        print('Invalid choice. Please enter 1, 2, 3, or 4.');
    }
    print(''); // For better formatting
  }
}
