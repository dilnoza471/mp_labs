import 'dart:async';

// Future<String> generateReport() {
//   return Future.delayed(Duration(seconds: 1), () => 'Report generated!');
// }

// void main() async {
//   generateReport().then((result) {
//     print(result);
//   });

// }

Future<String> generateReport() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Report generated!';
}

// void main() async {
//   String result = await generateReport();
//   print(result);

// }
Future<int> fetchUserId() {
  return Future.delayed(Duration(seconds: 1), () => 123);
}

Future<String> fetchUserDetails(int userId) async {
  await Future.delayed(Duration(seconds: 1));
  return 'Alice';
}
// void main() async {
//   int userId = await fetchUserId();
//   String userDetails = await fetchUserDetails(userId);
//   print('User ID: $userId, User name: $userDetails');
// }

Future<void> fetchConfiguration() async {
  await Future.delayed(Duration(seconds: 1));
  print('Configuration fetched');
}

Future<void> loadResources() async {
  await Future.delayed(Duration(seconds: 2));
  print('Resources loaded');
}

void main() async {
  await Future.wait([fetchConfiguration(), loadResources()]);
  print('System Ready');
}
