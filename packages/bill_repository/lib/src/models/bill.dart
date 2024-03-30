import '../entities/bill_entity.dart';

class Bill {
  String pizza_name;
  String user_id;
  String number_of_pizzas;
  String phone_number;
  String address;
  bool is_dilivered;
  double price;
  Bill({
    required this.pizza_name,
    required this.user_id,
    required this.number_of_pizzas,
    required this.phone_number,
    required this.address,
    required this.is_dilivered,
    required this.price,
  });
  BillEntity toEntity() {
    return BillEntity(
      pizza_name: pizza_name,
      user_id: user_id,
      number_of_pizzas: number_of_pizzas,
      phone_number: phone_number,
      address: address,
      is_delivered: is_dilivered,
      price: price,
    );
  }

  static final empty = Bill(
      pizza_name: "",
      user_id: '',
      number_of_pizzas: '',
      phone_number: '',
      address: '',
      is_dilivered: false,
      price: 0);

  static Bill fromEntity(BillEntity entity) {
    return Bill(
        pizza_name: "",
        user_id: entity.user_id,
        number_of_pizzas: entity.number_of_pizzas,
        phone_number: entity.phone_number,
        address: entity.address,
        is_dilivered: entity.is_delivered,
        price: entity.price);
  }
}
