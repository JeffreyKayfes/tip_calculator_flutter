import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final billAmountTextField = TextEditingController();
  double _billAmount = 0;
  double _tipPercent = 0;
  double _totalTip = 0;
  bool outstandingService = false;

  // Method for calculating tip
  void _calculateTip() {
    setState(() {
      _billAmount = double.parse(billAmountTextField.text);
      _tipPercent = outstandingService ? 0.20 : 0.15; // use 20% if switch is on
      _totalTip = _billAmount * _tipPercent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('CIS 3334 Tip Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Tip Calculator",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32,),
            Text("Bill Amount"),
            TextField(controller: billAmountTextField),
            SizedBox(height: 16), // Add some vertical space
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Switch(
                  value: outstandingService,
                  onChanged: (value) {
                    setState(() {
                      outstandingService = value;
                    });
                  },
                ),
                Text("Outstanding Service?"),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _calculateTip();
                print("Calculate Tip Button Pressed");
              },
              child: Text("Calculate Tip"),
            ),
            SizedBox(height: 32), // Add some vertical space
            Text("Total Tip: " + _totalTip.toStringAsFixed(2)), // Displays the tip
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
