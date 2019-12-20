import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sos/src/Models/formularioModel.dart';
import 'package:sos/src/providers/formulario_provider.dart';
import 'package:sos/src/providers/notificaciones_provider.dart';

double latitud;
double longitud;
class FormularioTrabajador extends StatefulWidget {
  @override
  _FormularioTrabajadorState createState() => new _FormularioTrabajadorState();
}

final formkey = GlobalKey<FormState>();
Formulario formularioTrabajador = new Formulario();
final formularioProvider = new FormularioProvider();
class _FormularioTrabajadorState extends State<FormularioTrabajador> {
  String dateini = '';
  String datefin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondo(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                      ),
                      Text('Inicio de Jornada',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                              color: Colors.white70)),
                      SizedBox(
                        height: 30.0,
                      ),
                      _tipoVehiculo(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _turno(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _rolTrabajador(),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(child: Image(
                            image: AssetImage('assets/img/ajustes.png'),
                          
                          ),
                          onTap: _enviarUbicacion,
                          ),
                          SizedBox(
                            width: 30.0,
                            
                          ),
                          tokenButton(context),
                            SizedBox(
                            height: 70.0,
                            
                          ),
                        _boton()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
    Widget _rolTrabajador() {
    return TextFormField(
      initialValue: formularioTrabajador.turno,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          labelText: 'Rol',
          labelStyle: new TextStyle(color: Colors.white70)),
      onSaved: (value) => formularioTrabajador.rol = value,
      validator: (value) {
        return (value.length < 3) ? 'ingrese el rol' : null;
      },
    );
  }

  Widget _boton() {
    return RaisedButton.icon(
        label: Text('Enviar'),
        icon: Icon(Icons.send),
        shape: StadiumBorder(),
        color: Colors.blueAccent,elevation:20.0 ,
      
        textColor: Colors.white,
        onPressed: () {
          _submit();
          mostarAlert(context);
        });
  }

  Widget _fondo() {
    return Container(
      color: Colors.black,
    );
  }



  Widget _turno() {
    return TextFormField(
      //padding: EdgeInsets.symmetric(horizontal: 20.0),

      //  keyboardType: TextInputType.text,
      initialValue: formularioTrabajador.turno,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          labelText: 'Turno',
          labelStyle: new TextStyle(color: Colors.white70)),
      onSaved: (value) => formularioTrabajador.turno = value,
      validator: (value) {
        return (value.length < 3) ? 'ingrese el turno' : null;
      },
    );
  }

   Widget tokenButton(BuildContext context) {
    return RaisedButton(
        child: Text('generar Token'),
        color: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)),
        onPressed: () {
          final pushProvidertoken = new NotificacionesProvider();
             pushProvidertoken.initNotifications();
                    final res = pushProvidertoken.getToken().then((res) {
            if (res != null) {
              formularioTrabajador.token = res.toString();
            } else {
              _showDialogNull(context);
            }
          });

          print(res);
          print(formularioTrabajador.token.toString());
          //_submit(context);
          //sPrincipal();
        });
  }
  void _showDialogNull(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('vuelva a intentarlo'),
            content: Text('presione nuevamente el boton'),
            actions: <Widget>[
              FlatButton(
                child: Text('ok'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  Widget _tipoVehiculo() {
    return TextFormField(
      initialValue: formularioTrabajador.movilidad,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          //  focusedBorder:UnderlineInputBorder(borderSide:BorderSide(color: Colors.cyan)1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.green)),
          labelText: 'Tipo de Vehiculo',
          labelStyle: new TextStyle(color: Colors.white70)),
      onSaved: (value) => formularioTrabajador.movilidad = value,
      validator: (value) {
        return (value.length < 3) ? 'ingrese el vehiculo' : null;
      },
    );
    //padding: EdgeInsets.symmetric(horizontal: 20.0),
  }

  void mostarAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Envio de Formulario'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    'Se envio el formulario exitosamente, a la espera de una emergencia '),
                Icon(
                  Icons.check_circle,
                  size: 60.0,
                  color: Colors.blueAccent,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  final route = MaterialPageRoute(builder: (context) {
                    
                    //FormularioTrabajador();
                  });
                  Navigator.push(context, route);
                },
              )
            ],
          );
        });

    // return object of type Dialog
  }
  
  void _enviarUbicacion() {
    
  Geolocator().getCurrentPosition().then((location) {
      if (location != null) {
        latitud = location.latitude;
        longitud = location.longitude;
        print("****************************Ubicacion actual=> longitud: " +
            longitud.toString() +
            ", latitud: " +
            latitud.toString());
    formularioTrabajador.latitud = latitud;
    formularioTrabajador.longitud = longitud;
    //cambiar el el form registro 
  
      } else {
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }

  void _submit() {
    if (!formkey.currentState.validate()) return;
    formkey.currentState.save();
    //si es valido hace todo lo que sigue
    print('todo ok');
    print(formularioTrabajador.movilidad);
    print(formularioTrabajador.turno);
    print(formularioTrabajador.token);
    print('este es el id del formulario');
    print(formularioTrabajador.idFormRegistro);
    


    formularioProvider.crearFormulario(formularioTrabajador);
  }
}
