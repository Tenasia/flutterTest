import 'package:flutter/material.dart';


// I added this comment to see if this will take effect!
void main() {
  runApp(const MyApp());
}

void chapter5NullAwareAssignmentOperator(String? firstName, String? middleName, String? lastName){
  //This says that if firstName is null, then it assigns the middleName instead
  String? name = firstName;
  name ??= middleName;
  print(name);
}

enum AnimalType {
  cat, dog, bunny
}

void chapter6(AnimalType animalType){

  switch (animalType) {
    case AnimalType.bunny:
      print("Bunny");
      break;
    case AnimalType.cat:
      print("Cat");
      break;
    case AnimalType.dog:
      print("Dog");
      break;
  }

  print('Function is finished');
}

void makeSureThisIsACat(AnimalType animalType){
  if(animalType != AnimalType.cat){
    return;
  }

}

class Person {

  final String name;

  Person(this.name);

  void run(){
    print('$name is Running!');
  }

  void breathe(){
    print('$name is breathing...');
  }

}

abstract class LivingThing{
  void breathe(){
    print('Living Thing is breathing');
  }

  void move(){
    print('I am moving');
  }
}

class Cat extends Object{
  final String name;

  Cat(this.name);

  factory Cat.fluffBall(){
    return Cat('FluffBall');
  }

  void breathe(){
    print('$name is breathing.');
  }



  @override
  bool operator == (covariant Cat other) => other.name == name;

  @override
  int get hashCode => name.hashCode;


}

void test(){
  final fluffers = Cat.fluffBall();
  final person = Person('John');


  final cat1 = Cat('Foo');
  final cat2 = Cat('Foo');

  if (cat1 == cat2){
    print('They\' both foo!');
  } else {
    print(cat1.name + 'has different name to' + cat2.name);
  }
  print(fluffers.name);
  fluffers.breathe();
  person.run();
  person.breathe();
}

const firstName = '';
const LastName = '';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    chapter5NullAwareAssignmentOperator(null, 'Pedere', 'Viojan');
    chapter6(AnimalType.bunny);
    Person('Alvic').run();
    Person('Alvic').breathe();
    test();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
