import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pesu I/O',
                style: TextStyle(
                    fontSize: 40,
                    backgroundColor: Colors.orange,
                    color: Colors.white,
                    fontFamily: 'Lato'),
              ),
              Image.asset('assets/images/apple-intro.jpg',
                  height: 300, width: 200),
              Text(
                'Name:tharun\nSrn:pes2ug21cs5xx\nPhone no.:9008xxxx34',
                style: TextStyle(
                    fontSize: 40,
                    backgroundColor: Colors.orange,
                    color: Colors.white,
                    fontFamily: 'Lato'),
              ),
              ElevatedButton(
                onPressed: () {
                  print('present');
                },
                child: Text('Present'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
