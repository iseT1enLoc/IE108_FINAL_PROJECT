part of 'order_pizza_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();
  @override
  List<Object> get props => [];
}

class OrderRequired extends OrderEvent {
  final String amount;
  final String phone_number;
  final String address;

  OrderRequired(
      {required this.amount,
      required this.phone_number,
      required this.address});
  @override
  List<Object> get props => [amount, phone_number, address];
}
