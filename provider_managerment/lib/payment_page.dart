import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_managerment/home_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.yellowAccent,
                child: Center(
                  child: Consumer<MyModel>(
                    builder: (context, model, child) {
                      return Text(model.text);
                    },
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.redAccent,
                child: Consumer<CounterProvider>(
                  builder: (context, model, child) {
                    return Center(
                      child: Text(
                        model.counter.toString(),
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
              ElevatedButton(
                onPressed: () {
                  Provider.of<CounterProvider>(context, listen: false)
                      .decrement();
                },
                child: const Text('Decrement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
