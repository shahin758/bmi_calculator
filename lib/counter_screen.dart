import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$counter", style: const  TextStyle(fontSize: 50)),
           const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child:  const Icon(Icons.add),
                ),
                const SizedBox(height: 20, width: 10),
                FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                 child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
