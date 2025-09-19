abstract class Weapon {
  void action();
}

class Sword implements Weapon {
  @override
  void action() {
    print("Swinging the sword!");
  }
}

class Bow implements Weapon {
  @override
  void action() {
    print("Shooting an arrow!");
  }
}

abstract class Animal {
  void eat();
}

class Lion implements Animal {
  @override
  void eat() {
    print("Eating meat.");
  }
}

class Goat implements Animal {
  @override
  void eat() {
    print("Eating grass.");
  }
}

abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCard implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paying \$${amount.toStringAsFixed(2)} with Credit Card.");
  }
}

class PayPal implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paying \$${amount.toStringAsFixed(2)} with PayPal.");
  }
}

abstract class DataFormatter {
  String format(Map<String, dynamic> data);
}

class JSONFormatter implements DataFormatter {
  @override
  String format(Map<String, dynamic> data) {
    return data.toString(); // Simplified for demonstration
  }
}

class KeyValueFormatter implements DataFormatter {
  @override
  String format(Map<String, dynamic> data) {
    return data.entries.map((e) => '${e.key}: ${e.value}').join(', ');
  }
}

int main() {
  List<Weapon> weapons = [Sword(), Bow()];

  for (var weapon in weapons) {
    weapon.action();
  }

  // Demonstrate Animal polymorphism
  List<Animal> animals = [Lion(), Goat()];
  for (var animal in animals) {
    animal.eat();
  }

  // Demonstrate PaymentMethod polymorphism
  List<PaymentMethod> paymentMethods = [CreditCard(), PayPal()];
  for (var method in paymentMethods) {
    method.pay(100.0);
  }

  // Demonstrate DataFormatter polymorphism
  List<DataFormatter> formatters = [JSONFormatter(), KeyValueFormatter()];
  Map<String, dynamic> sampleData = {
    'name': 'Alice',
    'age': 30,
    'city': 'Wonderland',
  };
  for (var formatter in formatters) {
    print(formatter.format(sampleData));
  }

  return 0;
}
