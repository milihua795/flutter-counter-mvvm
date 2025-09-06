
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/counter_viewmodel.dart';
import 'view/counter_view.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create:(context)=> CounterViewmodel(),
      child:const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: CounterView(),
    );
  }
}
