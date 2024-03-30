part of 'order_pizza_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
  @override
  List<Object> get props => [];
}

class OrderRequired extends OrderEvent {
  Bill _bill;

  OrderRequired(this._bill);
}
