
import 'package:flutter/material.dart';
import 'package:sos/src/bloc/bloc_login.dart';
export 'package:sos/src/bloc/bloc_login.dart';
//exporte un package
class Provider extends InheritedWidget {

  final loginBlock = BlocLogin();

  Provider({Key key, Widget child})
  : super (key: key,child : child);
  

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BlocLogin of (BuildContext context){

    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBlock;
  }
  
}