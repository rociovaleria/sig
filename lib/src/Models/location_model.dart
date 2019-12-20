// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
    String id;
    double latitud;
    double longitud;
    bool disponible;

    LocationModel({
        this.id,
        this.latitud = -17.77625451635678,
        this.longitud = -63.19510474642641,
        this.disponible=true,
    });

    factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
        disponible: json["disponible"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latitud": latitud,
        "longitud": longitud,
        "disponible": disponible,
    };
}
