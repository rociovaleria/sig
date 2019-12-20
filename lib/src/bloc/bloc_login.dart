

import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sos/src/bloc/validators.dart';

class BlocLogin with Validators{


  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  final _nombreController   = BehaviorSubject<String>();
  final _telefonoController = BehaviorSubject<String>(); 

  //recuperar los datos de string

 Stream<String> get emailStream    => _emailController.stream.transform(validarEmail);
 Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);


Stream<String>  get nombreStream   => _nombreController.stream.transform(varlidarNombre);
Stream<String>  get telefonoStream   => _telefonoController.stream.transform(varlidarTelefono);


Stream<bool> get formValidStream => //estoy modificando aqui!!!
 Observable.combineLatest4(emailStream, passwordStream, nombreStream, telefonoStream, (e,p,n,t)=>true);

  // insetar values al string

  Function (String) get changeEmail    => _emailController.sink.add;
  Function (String) get changePassword => _passwordController.sink.add;
  Function(String)  get changeNombre  =>  _nombreController.sink.add;
  Function(String)  get changeTelefono  =>  _telefonoController.sink.add;

  
  dispose(){

      _emailController?.close();
      _passwordController?.close();
      _nombreController?.close();
      _telefonoController?.close();
  }

}

