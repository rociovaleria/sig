import 'dart:convert';

Formulario formularioFromJson(String str) =>
    Formulario.fromJson(json.decode(str));

String formularioToJson(Formulario data) => json.encode(data.toJson());

class Formulario {
  String id;
  String turno;
  String movilidad;
  String horaEntrada;
  String horaSalida;
  double latitud;
  double longitud;
  String rol;
  String idFormRegistro;
   String token;
  Formulario(
      {
      this.id,
      this.turno = "",
      this.movilidad = "",
      this.horaEntrada = "",
      this.horaSalida = "",
      this.latitud = 0,
      this.longitud = 0,
      this.rol="",
      this.idFormRegistro ="",
      this.token=""
      });

  factory Formulario.fromJson(Map<String, dynamic> json) => Formulario(
      id: json["id"],
      turno: json["turno"],
      movilidad: json["movilidad"],
      horaEntrada: json["hora_entrada"],
      horaSalida: json["hora_salida"],
      latitud: json["latitud"],
      longitud: json["longitud"],
      rol: json["rol"],
      idFormRegistro: json["id_form_registro"],
      token: json["token"]
      
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "turno": turno,
        "movilidad": movilidad,
        "hora_entrada": horaEntrada,
        "hora_salida": horaSalida,
        "latitud": latitud,
        "longitud": longitud,
        "rol": rol,
        "id_form_registro" : idFormRegistro,
        "token": token
      };
}
