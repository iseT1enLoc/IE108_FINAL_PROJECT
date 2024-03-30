part of 'order_pizza_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderSuccess extends OrderState {
  Bill _bill;
  OrderSuccess(this._bill);
  @override
  List<Object> get props => [_bill];
}

class OrderFailure extends OrderState {}

class OrderProcess extends OrderState {}
