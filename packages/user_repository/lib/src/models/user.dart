import '../entities/entities.dart';

class MyUser {
  String userId;
  String email;
  String name;
  String address;
  bool hasActiveCart;

  MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.address,
    required this.hasActiveCart,
  });

  static final empty = MyUser(
    userId: '',
    email: '',
    name: '',
    address: '',
    hasActiveCart: false,
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      address: address,
      hasActiveCart: hasActiveCart,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userId: entity.userId,
        email: entity.email,
        name: entity.name,
        address: entity.address,
        hasActiveCart: entity.hasActiveCart);
  }

  @override
  String toString() {
    return 'MyUser: $userId, $email, $name, $hasActiveCart,';
  }
}
