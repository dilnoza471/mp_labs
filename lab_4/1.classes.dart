class Book {
  String title;
  String author;
  int numberOfPages;
  // Constructor
  Book(this.title, this.author, this.numberOfPages);

  void displayInfo() {
    print('Title: $title');
    print('Author: $author');
    print('Publication Year: $numberOfPages');
  }
}

class Student {
  String name;
  int age;
  List<double> grades;
  // Constructor
  Student(this.name, this.age, this.grades);

  double calculateAverageGrade() {
    if (grades.isEmpty) return 0.0;
    double sum = grades.reduce((a, b) => a + b);
    return sum / grades.length;
  }
}

class BankAccount {
  String accountNumber;
  String accountHolderName;
  double balance;
  // Constructor
  BankAccount(this.accountNumber, this.accountHolderName, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('Deposited: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Deposit amount must be positive.');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print('Withdrew: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds or invalid withdrawal amount.');
    }
  }

  void displayBalance() {
    print('Current Balance: \$${balance.toStringAsFixed(2)}');
  }
}

class Rectangle {
  double width;
  double height;
  // Constructor
  Rectangle(this.width, this.height);

  double getArea() {
    return width * height;
  }

  double getPerimeter() {
    return 2 * (width + height);
  }
}

int main() {
  // Creating an instance of the Book class
  Book myBook = Book('1984', 'George Orwell', 328);
  myBook.displayInfo();

  //creating an instance of the Student class
  Student student = Student('Alice', 20, [85.5, 90.0, 78.5]);
  double averageGrade = student.calculateAverageGrade();
  print("averageGrade = $averageGrade");

  //creating an instance of the BankAccount class
  BankAccount account = BankAccount('123456789', 'John Doe', 1000.0);
  account.displayBalance();
  account.deposit(500.0);
  account.withdraw(200.0);
  account.displayBalance();
  //creating an instance of the Rectangle class
  Rectangle rectangle = Rectangle(5.0, 10.0);
  print("Area = ${rectangle.getArea()}");
  print("Perimeter = ${rectangle.getPerimeter()}");

  return 0;
}
