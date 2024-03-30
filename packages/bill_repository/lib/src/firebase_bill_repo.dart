import 'dart:developer';

import 'package:bill_repository/bill_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';
import 'bill_repo.dart';

class FirebaseBillRepo implements BillRepository {
  final billCollection = FirebaseFirestore.instance.collection('bills');

  @override
  Future<Bill> OrderPizza(Bill _bill) async {
    try {
      final billCollection = FirebaseFirestore.instance.collection('bills');
      var bill_remote = await billCollection.add(_bill.toEntity().toDocument());
      print("add data successfully");
      return Bill.fromEntity(
          BillEntity.fromDocument(bill_remote.get() as Map<String, dynamic>));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
