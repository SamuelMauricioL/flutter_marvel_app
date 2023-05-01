import 'dart:convert';

List<PriceModel> pricesModelFromJson(dynamic str) => List<PriceModel>.from(
      (str as List<dynamic>).map(
        (dynamic x) {
          return PriceModel.fromJson(x);
        },
      ).toList(),
    );

String pricesModelToJson(List<PriceModel> data) => json.encode(
      List<dynamic>.from(
        data.map<Map<String, dynamic>>((x) => x.toJson()),
      ),
    );

class PriceModel {
  final String type;
  final double price;

  PriceModel({
    required this.type,
    required this.price,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      type: json['type'],
      price: double.parse(json['price'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'price': price,
    };
  }
}
