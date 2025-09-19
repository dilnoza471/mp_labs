int getElement(List<int> list, int index) {
  try {
    return list[index];
  } on RangeError {
    print('Index out of range');
    return -1;
  } catch (e) {
    print('Error: $e');
    return -1;
  }
}

int getAge(String ageStr) {
  try {
    int age = int.parse(ageStr);
    return age;
  } on FormatException {
    print('Invalid age format');
    return -1;
  } catch (e) {
    print('Error: $e');
    return -1;
  }
}

class InvalidInputException implements Exception {
  String message;
  InvalidInputException(this.message);
}

void text(String input) {
  if (input.isEmpty) {
    throw InvalidInputException('Input cannot be empty');
  }
  print('Input is valid: $input');
}

void simulateDatabaseRead({bool throwError = false}) {
  try {
    print('Opening database connection...');

    // Simulate reading data
    if (throwError) {
      throw Exception('Failed to read data from database!');
    }

    print('Data read successfully.');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Database connection closed.');
  }
}

void main() {
  List<int> numbers = [10, 20, 30];
  print(getElement(numbers, 1)); // Valid index
  print(getElement(numbers, 5)); // Invalid index

  //example of getAge function
  print(getAge('20')); //valid format
  print(getAge('2s5')); // Invalid format
  //example of custom exception
  try {
    text('');
  } on InvalidInputException catch (e) {
    print('Custom Exception: ${e.message}');
  }
  try {
    text('Hello, Dart!');
  } on InvalidInputException catch (e) {
    print('Custom Exception: ${e.message}');
  }

  //example of simulateDatabaseRead function
  print('--- Successful read ---');
  simulateDatabaseRead();

  print('\n--- Failed read ---');
  simulateDatabaseRead(throwError: true);
}
