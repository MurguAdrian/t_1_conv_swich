import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  int input = 0;
  String? nr;
  bool x = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Switch(
            activeColor: Colors.black87,
              value: x,
              onChanged: (bool y) {
                setState(() {
                  this.x=!x;
                });
              }),
          backgroundColor: x? Colors.black87 : Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controller,
                onChanged: (String value) {
                  setState(() {
                    final int? x = int.tryParse(value);
                    if (x == null) {
                      nr = 'Doar Numere';
                    } else {
                      input = x;
                      nr = null;
                    }
                  });
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Scrie',
                  hintText: 'Doar nr',
                  errorText: nr,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(
                        () {
                          controller.clear();
                          input = 0;
                        },
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                ),child: Text('${input*4}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
