import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_managerment/rating_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChangeText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Managerment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: ElevatedButton(
                    child: const Text('Do something'),
                    onPressed: () {
                      isChangeText = !isChangeText;
                      // myModel.doSomething(isChangeText);
                      Provider.of<MyModel>(context, listen: false)
                          .doSomething(isChangeText);
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(35),
                  color: Colors.blue[200],
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Consumer<MyModel>(
                          builder: (context, myModel, child) {
                            return Text(myModel.text);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            Provider.of<CounterProvider>(context, listen: false)
                                .increment();
                          },
                          child: const Text('Increment'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: RatingBox(),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}

class MyModel extends ChangeNotifier {
  String text = 'Hello';
  void doSomething(bool isChangeText) {
    if (isChangeText) {
      text = 'Hello';
    } else {
      text = 'world';
    }
    notifyListeners();
  }
}

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }
}
