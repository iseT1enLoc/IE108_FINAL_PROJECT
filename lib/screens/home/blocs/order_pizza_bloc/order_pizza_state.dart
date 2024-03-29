part of 'order_pizza_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderSuccess extends OrderState {}

class OrderFailure extends OrderState {}

class OrderProcess extends OrderState {}
