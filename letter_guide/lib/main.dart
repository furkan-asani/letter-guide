import 'package:flutter/material.dart';
import 'package:letter_guide/pages/document_summary_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LetterGuide',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'LetterGuide'),
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return LetterGuideScaffold(
      title: 'LetterGuide',
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              MainMenuButton(
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  buttonTitle: "Scan"),
              MainMenuButton(
                icon: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                buttonTitle: "Historie",
              ),
              MainMenuButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                buttonTitle: "Einstellungen",
              )
            ],
          ),
        ),
    );
  }
}

class LetterGuideScaffold extends StatelessWidget{
  final Widget body;
  final String title;

  const LetterGuideScaffold({super.key, required this.body, required this.title});


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title),),body: body);
  }
}

class MainMenuButton extends StatelessWidget {
  final Icon icon;
  final String buttonTitle;

  const MainMenuButton({super.key, required this.icon, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ElevatedButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const LetterGuideScaffold(body: DocumentSummaryPage(), title: 'Document Summary'))); // Do something when button is pressed

          },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            child: SizedBox(
              width: 50,
              height: 70,
              child: icon,
            ),
          ),
        ),
        Text(
          buttonTitle,
          style: const TextStyle(color: Colors.blueGrey, fontSize: 14),
        )
      ],
    );
  }
}