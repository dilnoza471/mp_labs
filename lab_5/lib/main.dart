import 'package:flutter/material.dart';
import 'package:lab_5/account.dart';
import 'package:lab_5/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(), // <-- points to your screen widget
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController password = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Red container with android icon
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(20.0),
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Icon(Icons.home, color: Colors.white, size: 50),
            ),

            // Row of stars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.star, size: 50),
                Icon(Icons.star, size: 50),
                Icon(Icons.star, size: 50),
                Icon(Icons.star, size: 50),
                Icon(Icons.star, size: 50),
              ],
            ),

            const SizedBox(height: 20),

            // Column of stars left-aligned
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.star, size: 50),
                Icon(Icons.star, size: 50),
                Icon(Icons.star, size: 50),
                Icon(Icons.star, size: 50),
                Icon(Icons.star, size: 50),
              ],
            ),

            const SizedBox(height: 20),

            // Password field
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Enter your password',
                icon: const Icon(Icons.person),
              ),
            ),
            //when changed to Column the layout broke, cuz I have Listview. Listview doesn't work well with Column and Expanded
            //I will use it with SizedBox to limit the height
            SizedBox(
              height: 200,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(height: 100, color: Colors.green),
                  ),
                ],
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(width: 100, height: 100, color: Colors.red),
                ),
                Expanded(
                  flex: 2,
                  child: Container(height: 100, color: Colors.green),
                ),
              ],
            ),
            //Spacer example
            Row(
              children: <Widget>[
                Container(width: 100, height: 100, color: Colors.red),
                Spacer(),
                Container(width: 100, height: 100, color: Colors.green),
              ],
            ),

            //account view
            Account(
              name: "Dilnoza Eraliyeva",
              username: "@dilnoza471",
              bio: "Pain demands to be felt.",
            ),
            //product view
            Product(
              productName: "Samsung Galaxy S22 Ultra 5G ",
              desc:
                  "Released 2022, February 25,\n228g / 229g (mmWave), 8.9mm thickness",
              price: 400.00,
            ),
          ],
        ),
      ),
    );
  }
}
