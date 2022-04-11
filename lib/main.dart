import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> animalList = ['dog', 'cat', 'elephant', 'rabbit'];
  List<String> displayList = [];
  int lastIndex = 0;

  @override
  void initState() {
    displayList.add(animalList[lastIndex]);
    lastIndex++;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            final before = scrollNotification.metrics.extentBefore;
            final max = scrollNotification.metrics.maxScrollExtent;
            if (before == max) {
              if (animalList.length == lastIndex) return false;
              setState(() {
                displayList.add(animalList[lastIndex]);
                lastIndex++;
              });
              return true;
            }
          }
          return false;
        },
        child: ListView.builder(
          itemCount: displayList.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(displayList[index]);
          },
        ),
      ),
    );
  }
}
