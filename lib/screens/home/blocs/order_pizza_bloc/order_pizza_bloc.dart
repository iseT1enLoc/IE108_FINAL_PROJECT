import 'package:bloc/bloc.dart';
import 'package:bill_repository/bill_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
part 'order_pizza_event.dart';
part 'order_pizza_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderRequired>(
      (event, emit) async {
        emit(OrderProcess());
        try {
          final billCollection = FirebaseFirestore.instance.collection('bills');
          var bill_remote =
              await billCollection.add(event._bill.toEntity().toDocument());

          emit(OrderSuccess(Bill.fromEntity(BillEntity.fromDocument(
              bill_remote.get() as Map<String, dynamic>))));
          print("add data successfully");
        } catch (e) {
          emit(OrderFailure());
        }
      },
    );
  }
}
