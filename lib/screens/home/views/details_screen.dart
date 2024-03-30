import 'package:bill_repository/bill_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_app/screens/home/blocs/order_pizza_bloc/order_pizza_bloc.dart';
import 'package:pizza_app/screens/home/views/bill_screen.dart';
import 'package:pizza_repository/pizza_repository.dart';
import 'package:user_repository/user_repository.dart';
import '../../../components/macro.dart';

class DetailsScreen extends StatelessWidget {
  final Pizza pizza;
  const DetailsScreen(this.pizza, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - (40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(3, 3), blurRadius: 5)
                  ],
                  image: DecorationImage(image: NetworkImage(pizza.picture))),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(3, 3), blurRadius: 5)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            pizza.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$${pizza.price - (pizza.price * (pizza.discount) / 100)}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                Text(
                                  "\$${pizza.price}.00",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        MyMacroWidget(
                          title: "Calories",
                          value: pizza.macros.calories,
                          icon: FontAwesomeIcons.fire,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MyMacroWidget(
                          title: "Protein",
                          value: pizza.macros.proteins,
                          icon: FontAwesomeIcons.dumbbell,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MyMacroWidget(
                          title: "Fat",
                          value: pizza.macros.fat,
                          icon: FontAwesomeIcons.oilWell,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MyMacroWidget(
                          title: "Carbs",
                          value: pizza.macros.carbs,
                          icon: FontAwesomeIcons.breadSlice,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          BillRepository? _billrepo;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) =>
                                            OrderBloc(_billrepo),
                                        child: BillScreens(
                                          pizza: pizza,
                                        ),
                                      )));
                        },
                        style: TextButton.styleFrom(
                            elevation: 3.0,
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
