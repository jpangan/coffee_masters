import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Coffee Masters',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home2());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

String pickRandomImage(List<String> strings) {
  if (strings.isEmpty) {
    throw ArgumentError("The list of strings cannot be empty.");
  }
  final random = Random();
  final index = random.nextInt(strings.length);
  return strings[index];
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            left: true,
            right: true,
            top: true,
            bottom: true,
            minimum: EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: HelloWorldList(title: 'Hello world', occurrence: 100000)));
  }
}

class HelloWorldList extends StatelessWidget {
  //Properties
  final String title;
  final int occurrence;

  // Constructor

  const HelloWorldList(
      {super.key, required this.title, required this.occurrence});

  @override
  Widget build(BuildContext context) {
    final strings = [
      "assets/images/svg/bag.svg",
      "assets/images/svg/beans.svg",
      "assets/images/svg/coffee.svg",
      "assets/images/svg/cup.svg",
      "assets/images/svg/cup2.svg"
    ];

    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(occurrence, (index) {
          return Card(
            color: Colors.amber[50],
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgImage(
                imgSrc: pickRandomImage(strings),
              ),
            ),
          );
        }));
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.title,
    required this.index,
  });

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return StyledText(title: title, index: index);
  }
}

class SvgImage extends StatelessWidget {
  const SvgImage({
    super.key,
    required this.imgSrc,
  });

  final String imgSrc;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(imgSrc, width: 100, height: 100);
  }
}

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.title,
    required this.index,
  });

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title $index',
      style: const TextStyle(
          color: Colors.blueGrey, fontSize: 12, fontWeight: FontWeight.normal),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
