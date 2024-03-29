part of 'order_pizza_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
  @override
  List<Object> get props => [];
}

class OrderRequired extends OrderEvent {
  final String amount;
  final String phone_number;
  final String address;

  OrderRequired(this.amount, this.phone_number, this.address);
  @override
  List<String> get props => [amount, phone_number, address];
}
