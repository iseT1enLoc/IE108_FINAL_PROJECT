import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'bill_repo.dart';

class FirebaseBillRepo implements BillRepository {
  final billCollection = FirebaseFirestore.instance.collection('bills');

  @override
  Future<void> OrderPizza(
      String amount, String phone_number, String address) async {
    try {
      await billCollection
          .add({amount: amount, phone_number: phone_number, address: address});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
