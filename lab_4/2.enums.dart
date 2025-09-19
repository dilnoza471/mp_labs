enum OrderStatus { pending, processing, shipped, delivered, cancelled }

enum TrafficLight {
  red(30),
  yellow(5),
  green(45);

  final int _duration;
  const TrafficLight(this._duration);

  int get durationInSeconds => _duration;
}

String getTrafficLightAction(TrafficLight light) {
  switch (light) {
    case TrafficLight.red:
      return 'Stop';
    case TrafficLight.yellow:
      return 'Caution';
    case TrafficLight.green:
      return 'Go';
  }
}

enum UserRole { admin, editor, guest }

class User {
  String username;
  UserRole role;
  // Constructor
  User(this.username, this.role);

  bool hasEditPermission() {
    return role == UserRole.admin || role == UserRole.editor;
  }
}

int main() {
  // Example usage of the OrderStatus enum
  OrderStatus status = OrderStatus.pending;
  print('Current order status: $status');

  // Print name and duration for each TrafficLight
  for (var light in TrafficLight.values) {
    print(
      'Traffic light: ${light.name}, duration: ${light.durationInSeconds} seconds',
    );
  }

  // Example usage of the UserRole enum and User class
  User user1 = User('Alice', UserRole.admin);
  User user2 = User('Bob', UserRole.guest);
  User user3 = User('Charlie', UserRole.editor);
  print('${user1.username} has edit permission: ${user1.hasEditPermission()}');
  print('${user2.username} has edit permission: ${user2.hasEditPermission()}');
  print('${user3.username} has edit permission: ${user3.hasEditPermission()}');

  return 0;
}
