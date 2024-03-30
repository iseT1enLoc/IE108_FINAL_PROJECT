// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bill_repository/bill_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_repository/pizza_repository.dart';

import 'package:pizza_app/screens/home/blocs/order_pizza_bloc/order_pizza_bloc.dart';
import 'package:user_repository/user_repository.dart';

// ignore: must_be_immutable
class BillScreens extends StatefulWidget {
  Pizza pizza;
  BillScreens({
    Key? key,
    required this.pizza,
  }) : super(key: key);
  @override
  State<BillScreens> createState() => _BillScreensState();
}

final billCollection = FirebaseFirestore.instance.collection("bills");

class _BillScreensState extends State<BillScreens> {
  TextEditingController amountController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  User? current_user = FirebaseAuth.instance.currentUser;
  String? my_user_id;
  Bill my_bill = Bill.empty;
  @override
  void initState() {
    if (current_user != null) {
      setState(() {
        my_user_id = current_user?.uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pizza.name + " pizza"),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.network(widget.pizza.picture),
              ),
              TextField(
                controller: amountController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "Enter number of pizzas",
                  icon: Icon(Icons.food_bank),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: phoneController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "Enter phone number",
                  icon: Icon(CupertinoIcons.phone),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: addressController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "Enter address",
                  icon: Icon(CupertinoIcons.placemark),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return CupertinoButton(
                    child: Text("Order"),
                    onPressed: () {
                      setState(() {
                        my_bill.is_dilivered = false;
                        my_bill.pizza_name = widget.pizza.name;
                        my_bill.address = addressController.text;
                        my_bill.phone_number = phoneController.text;
                        my_bill.number_of_pizzas = amountController.text;
                        my_bill.user_id = my_user_id!;
                        my_bill.price = int.parse(amountController.text) *
                            widget.pizza.price *
                            widget.pizza.discount *
                            1.0; //calculate the total bill price
                      });
                      context.read<OrderBloc>().add(
                            OrderRequired(my_bill),
                          );
                      Navigator.of(context).pop();
                    },
                    color: Colors.green,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
