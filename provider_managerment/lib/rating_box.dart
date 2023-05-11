import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_managerment/home_page.dart';
import 'package:provider_managerment/payment_page.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      width: 200,
      height: 200,
      color: Colors.deepPurpleAccent[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Consumer<MyModel>(
              builder: (context, model, child) {
                return Center(
                  child: Text(
                    model.text,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentPage(),
                    ),
                  );
                },
                child: const Text('Go to Payment'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
