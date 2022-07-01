// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    ProductoModel({
         this.id         = "",
         this.title      = '',
         this.valor      = 0.0,
         this.disponible = true,
         this.fotoUrl    = "",
    });

    String id;
    String title;
    double valor;
    bool disponible;
    String fotoUrl;

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id         : json["id"],
        title      : json["title"],
        valor      : json["valor"],
        disponible : json["disponible"],
        fotoUrl    : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id"         : id,
        "title"      : title,
        "valor"      : valor,
        "disponible" : disponible,
        "fotoUrl"    : fotoUrl,
    };
}
