// To parse this JSON data, do
//
//     final ubicacion = ubicacionFromJson(jsonString);

import 'dart:convert';

Ubicacion ubicacionFromJson(String str) => Ubicacion.fromJson(json.decode(str));

String ubicacionToJson(Ubicacion data) => json.encode(data.toJson());

class Ubicacion {
    String id;
    double latitud;
    double longitud;
    String emergencia;
    String usuario;

    Ubicacion({
        this.id,
        this.latitud=0,
        this.longitud=0,
        this.emergencia="",
        this.usuario="",
    });

    factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
        id: json["id"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        emergencia: json["emergencia"],
        usuario: json["usuario"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latitud": latitud,
        "longitud": longitud,
        "emergencia": emergencia,
        "usuario": usuario,
    };
}
