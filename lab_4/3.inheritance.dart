class Animal {
  void makeSound() {
    print("Animal makes sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Meow!");
  }
}

class Shape {
  String color;
  // Constructor
  Shape(this.color);
}

class Circle extends Shape {
  double radius;
  // Constructor
  Circle(String color, this.radius) : super(color);
}

class Square extends Shape {
  double sideLength;
  // Constructor
  Square(String color, this.sideLength) : super(color);
}

class Employee {
  String name;
  double baseSalary;
  // Constructor
  Employee(this.name, this.baseSalary);

  double calculateSalary() {
    return baseSalary;
  }
}

class Manager extends Employee {
  double bonus;
  // Constructor
  Manager(String name, double baseSalary, this.bonus) : super(name, baseSalary);

  @override
  double calculateSalary() {
    return baseSalary + bonus;
  }
}

class LibraryItem {
  String title;
  String id;
  // Constructor
  LibraryItem(this.title, this.id);

  void getDetails() {
    print('Title: $title, Author: $id');
  }
}

class Book extends LibraryItem {
  String author;
  // Constructor
  Book(String title, String id, this.author) : super(title, id);

  @override
  void getDetails() {
    print('Title: $title, ID: $id Author: $author');
  }
}

class DVD extends LibraryItem {
  String director;
  // Constructor
  DVD(String title, String id, this.director) : super(title, id);

  @override
  void getDetails() {
    print('Title: $title, ID: $id Director: $director');
  }
}

int main() {
  Animal myDog = Dog();
  Animal myCat = Cat();

  myDog.makeSound(); // Output: Woof!
  myCat.makeSound(); // Output: Meow!

  // Example usage of Shape, Circle, and Square classes
  Circle myCircle = Circle("Red", 5.0);
  Square mySquare = Square("Blue", 4.0);
  print('Circle color: ${myCircle.color}, radius: ${myCircle.radius}');
  print('Square color: ${mySquare.color}, side length: ${mySquare.sideLength}');
  // Example usage of Employee and Manager classes
  Employee emp = Employee("Alice", 50000);
  Manager mgr = Manager("Bob", 70000, 15000);
  print('${emp.name}\'s Salary: \$${emp.calculateSalary()}');
  print('${mgr.name}\'s Salary: \$${mgr.calculateSalary()}');

  // Example usage of LibraryItem, Book, and DVD classes
  LibraryItem item1 = Book("1984", "B001", "George Orwell");
  LibraryItem item2 = DVD("Inception", "D001", "Christopher Nolan");
  item1.getDetails();
  item2.getDetails();
  return 0;
}
