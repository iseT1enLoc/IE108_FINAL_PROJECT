import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/home/blocs/order_pizza_bloc/order_pizza_bloc.dart';

class BillScreens extends StatelessWidget {
  BillScreens({super.key});
  final amountController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill in your infomation"),
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
                    onPressed: () {},
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
