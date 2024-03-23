import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_autofill_demo/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class AutofillDemo extends StatefulWidget {
  const AutofillDemo({super.key});

  @override
  _AutofillDemoState createState() => _AutofillDemoState();
}

class _AutofillDemoState extends State<AutofillDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Flutter Autofill Username & Password Demo",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: AutofillGroup(
            child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              const TextField(
                autofillHints: [AutofillHints.username],
                decoration: InputDecoration(hintText: "Username"),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                obscureText: true,
                autofillHints: [AutofillHints.password],
                decoration: InputDecoration(hintText: "Password"),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    TextInput.finishAutofillContext();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  },
                  child: const Text("Log In"))
            ],
          ),
        )),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home Page"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 100,
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const AutofillDemo();
                  }));
                },
                child: const Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
