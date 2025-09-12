void greetByName(String name) {
  print("Hello, $name!.\n");
}

int multiply(int a, int b) {
  return a * b;
}

bool isPositive(int number) {
  return number > 0 ? true : false;
}

double calculateAverage(double num1, double num2) {
  return (num1 + num2) / 2;
}

var multiply2 = (int a, int b) => a * b;
/*
Dilnoza Eraliyeva
12.09.2025
This is so not my first Dart function
 */
void sayHello() {
  print("Hello from a function!");
}

void main() {
  /*
  //The main function
  print("Dilnoza Eraliyeva\n");
  print("Welcome to Dart Programming.\nLet’s start coding!\n");
  print("""
1 Amir Temur Avenue
Tashkent, Uzbekistan
100000
  """);
  var year = DateTime.now().year;

  print(" The current year is $year \n");
  print(" Welcome, students of New Uzbekistan University!\n");

  //variables
  String favoriteCity = "Los Angeles";
  print(" My favorite city is $favoriteCity \n");

  double bookPrice = 15.99;
  print(" The price of the book is $bookPrice USD.\n");

  bool isLearningDart = true;
  print("Am I learning Dart? The answer is $isLearningDart \n.");

  String weather = "Sunny";
  int temperature = 32;
  print(
    " Today’s weather is $weather and the temperature is $temperature degrees Celsius.\n",
  );

  var numberOfApples = 10;
  print("numberOfApples = $numberOfApples");
  numberOfApples = 12;
  print("numberOfApples = $numberOfApples\n");

  //Control flow
  int studentScore = 75;
  if (studentScore >= 60) {
    print("Pass\n");
  }
  int hour = 14;
  if (hour < 12) {
    print("Good morning\n");
  } else if ((hour <= 18) & (hour >= 12)) {
    print("Good afternoon\n");
  } else {
    print("Good evening\n");
  }

  for (int i = 1; i <= 10; i++) {
    print(i);
  }
  for (var i = 5; i < 0; i--) {
    print(i);
  }
  print("Liftoff!");

  for (var i = 0; i < 20; i++) {
    if (i % 3 == 0) {
      print(i);
    }
  }
*/
  //functions
  greetByName("Dilnoza");
  print(multiply(6, 7));
  print(isPositive(5));
  print(isPositive(-4));
  print(calculateAverage(10.5, 20.5));
  print(multiply2(6, 7));

  //comments
  //var planet stores the planet name.
  String planet = "Earth";
  print("We live on planet $planet.");
  sayHello();

  //print("This message should not appear.");
  print("This message should appear.");

  /* This variable stores a very important universal constant.*/
  //speedOfLight saves the speed of light
  int speedOfLight = 299792458; // in meters per second
  print(speedOfLight);
}
