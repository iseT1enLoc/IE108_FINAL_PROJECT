import 'package:bloc/bloc.dart';
import 'package:bill_repository/bill_repository.dart';
import 'package:equatable/equatable.dart';
part 'order_pizza_event.dart';
part 'order_pizza_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final FirebaseBillRepo? _billRepository;

  OrderBloc(this._billRepository) : super(OrderInitial()) {
    on<OrderRequired>((event, emit) async {
      emit(OrderProcess());
      try {
        await _billRepository?.OrderPizza(
            event.amount, event.phone_number, event.address);
        emit(OrderSuccess());
      } catch (e) {
        emit(OrderFailure());
      }
    });
  }
}
