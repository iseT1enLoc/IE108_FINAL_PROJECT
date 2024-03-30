import 'package:bill_repository/bill_repository.dart';

abstract class BillRepository {
  Future<Bill> OrderPizza(Bill _bill);
}
