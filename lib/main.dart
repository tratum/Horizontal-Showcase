import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:horizontal_showcase/horizontal_showcase.dart';
import '../mouse_transforms/hover_extensions.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () async{
                await HorizontalShowcase.build(
                  context: context,
                  backgroundColor: const Color(0XFF000000),
                  width: 140,
                  height: 40,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  menuItems: [
                    GestureDetector(
                      onTap: (){
                        print("------------------Heart Button tapped");
                      },
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 26,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        print("------------------Open Button tapped");
                      },
                      child: Icon(
                        Icons.open_in_new,
                        color: Colors.red,
                        size: 26,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        print("------------------Clock Button tapped");
                      },
                      child: Icon(
                        Icons.access_time,
                        color: Colors.red,
                        size: 26,
                      ),
                    ),
                  ],
                );
              },
              child: const Text(
                'Hello World',
                style: TextStyle(fontSize: 64),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
