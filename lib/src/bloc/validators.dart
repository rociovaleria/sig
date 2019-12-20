
import 'dart:async';

class Validators{


  
  final validarEmail =StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){

      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp  regExp = new RegExp(pattern);

      if(regExp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError('correo no valido');
      }
    }
  );

  final validarPassword =StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){

      if(password.length>=6){
        sink.add(password);
      }else{
        sink.addError('contraseña menor a 6 caracteres');
      }
    }
  );


/////////////////////////////////no me los toma en cuenta
  
  final varlidarNombre =StreamTransformer<String,String>.fromHandlers( //falta
    handleData: (nombre,sink){
 
   if(nombre.isEmpty){
       sink.addError('ingrese su nombre por favor');
      }else{
         sink.add(nombre);
      }
    }
  );

  final varlidarTelefono =StreamTransformer<String,String>.fromHandlers( //falta
    handleData: (telefono,sink){
 
   if(telefono.length>=8){
        sink.add(telefono);
      }else{
        sink.addError('ingrese su telefono por favor');
      }
    }
  );

}
