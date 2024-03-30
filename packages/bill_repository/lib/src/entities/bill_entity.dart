import 'package:pizza_repository/src/entities/macros_entity.dart';

class BillEntity {
  String pizza_name;
  String user_id;
  String number_of_pizzas;
  String phone_number;
  String address;
  bool is_delivered;
  double price;
  BillEntity({
    required this.pizza_name,
    required this.user_id,
    required this.number_of_pizzas,
    required this.phone_number,
    required this.address,
    required this.is_delivered,
    required this.price,
  });
  Map<String, Object?> toDocument() {
    return {
      'pizza_name': pizza_name,
      'user_id': user_id,
      'number_of_pizzas': number_of_pizzas,
      'phone_number': phone_number,
      'address': address,
      'is_dilivered': is_delivered,
      'price': price
    };
  }

  static BillEntity fromDocument(Map<String, dynamic> doc) {
    return BillEntity(
        pizza_name: doc['pizza_name'],
        user_id: doc['user_id'],
        number_of_pizzas: doc['number_of_pizzas'],
        phone_number: doc['phone_number'],
        address: doc['address'],
        is_delivered: doc['is_dilivered'],
        price: doc['price']);
  }
}
