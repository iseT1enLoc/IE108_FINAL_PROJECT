import '../entities/bill_entity.dart';

class Bill {
  String billId;
  String amount;
  String phone_number;
  String address;
  Bill(
      {required this.billId,
      required this.amount,
      required this.phone_number,
      required this.address});
  BillEntity toEntity() {
    return BillEntity(
      billId: billId,
      amount: amount,
      phone_number: phone_number,
      address: address,
    );
  }

  static final empty = Bill(
    billId: 'NaN',
    amount: '',
    phone_number: '',
    address: '',
  );

  static Bill fromEntity(BillEntity entity) {
    return Bill(
      billId: entity.billId,
      amount: entity.amount,
      phone_number: entity.phone_number,
      address: entity.address,
    );
  }
}
