import 'package:flutter/material.dart';
import 'helper/reouter.dart';


//main
void main() {
  runApp( MyApp(approuter: Approuter()));
}
class MyApp extends StatelessWidget {

 final Approuter approuter ;
 const MyApp({Key? key, required this.approuter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     onGenerateRoute: approuter.generatedRoute,

    );
  }
}
