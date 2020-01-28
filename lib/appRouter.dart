import 'package:flutter/material.dart';
import 'package:myapp/googleMap.dart';
import 'package:myapp/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args =settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_)=>MyHomePage(title: 'Flutter'));
      case "/map":
        return MaterialPageRoute(builder: (_)=> MapSample());
      default:
      return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
  
}