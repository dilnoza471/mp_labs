mixin Flyer {
  void fly() {
    print("Taking off!");
  }
}

class Bird with Flyer {
  String name;
  // Constructor
  Bird(this.name);
}

class Plane with Flyer {
  String model;
  // Constructor
  Plane(this.model);
}

mixin Logger {
  void log(String message) {
    print("Log: $message");
  }
}

class DataService with Logger {
  void fetchData() {
    log("Fetching data from the server...");
    // Simulate data fetching
    print("Data fetched successfully.");
  }
}

mixin Validator {
  bool isValidEmail(String email) {
    // Simple regex for email validation
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    // Password must be at least 8 characters long
    return password.length >= 8;
  }
}

class UserSignup with Validator {
  String email;
  String password;
  // Constructor
  UserSignup(this.email, this.password);

  bool validate() {
    return isValidEmail(email) && isValidPassword(password);
  }
}

mixin Performer {
  void perform() {
    print("Performing...");
  }
}
mixin Musician {
  void playInstrument() {
    print("Playing instrument...");
  }
}

class Artist {
  String name;
  // Constructor
  Artist(this.name);
}

class Dancer extends Artist with Performer {
  Dancer(String name) : super(name);
}

class Guitarist extends Artist with Musician, Performer {
  Guitarist(String name) : super(name);
}

int main() {
  // Example usage of the Flyer mixin
  Bird bird = Bird("Sparrow");
  Plane plane = Plane("Boeing 747");

  bird.fly(); // Output: Taking off!
  plane.fly(); // Output: Taking off!

  // Example usage of the Logger mixin
  DataService dataService = DataService();
  dataService.fetchData();

  // Example usage of the Validator mixin
  UserSignup user = UserSignup("example@bam.com", "password123");
  print("Is user valid? ${user.validate()}"); // Output: Is user valid? true

  // Example usage of the Performer and Musician mixins
  Dancer dancer = Dancer("Alice");
  Guitarist guitarist = Guitarist("Bob");
  print("Dancer: ${dancer.name}");
  dancer.perform(); // Output: Performing...
  print("Guitarist: ${guitarist.name}");
  guitarist.perform(); // Output: Performing...
  guitarist.playInstrument(); // Output: Playing instrument...

  return 0;
}
