import 'package:bloc_flutter/color_bloc.dart';
import 'package:flutter/material.dart';
 import 'dart:core';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorBloc _bloc = ColorBloc();


  @override
  void dipose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc with Stream'),
        centerTitle: true,
      ),

      body: Center(
        child:
        StreamBuilder<Color>(
          stream: _bloc.outputStateStream,
          initialData: Colors.red,
          builder: (context, snapshot){
            return AnimatedContainer(
              height: 100,
              width: 100,
              color: snapshot.data,
              duration: Duration(milliseconds: 500),
            );
          }
        ),


      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.red,

              onPressed: (){

              _bloc.inputEventSink.add(ColorEvent.event_red);
              }
          ),

          SizedBox(width: 10,),
          FloatingActionButton(
            backgroundColor: Colors.green,
              onPressed: (){
                _bloc.inputEventSink.add(ColorEvent.event_green);
              })
        ],
      ),
    );
  }
}
