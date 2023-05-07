import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.sort),
        actions:  [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage:  AssetImage('images/pizza09.jpg')),
          ),
        ],
      ),

      body: Column(
        children: [
          TextField(
            decoration:InputDecoration(
              filled: true,
              fillColor: Color(0xff3a3e3e),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          )
        ],
      ),
    );

  }
}
