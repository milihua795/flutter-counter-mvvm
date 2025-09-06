import 'package:contador_mvvm/viewmodel/counter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterViewModel = context.watch<CounterViewmodel>();

    // Cambio de color de fondo en función del valor del contador
    Color backgroundColor;
    if (counterViewModel.count < 0) {
      backgroundColor = const Color.fromARGB(255, 247, 187, 193);
    } else if (counterViewModel.count == 0) {
      backgroundColor = const Color.fromARGB(255, 255, 255, 255);
    } else if (counterViewModel.count % 2 == 0) {
      backgroundColor = const Color.fromARGB(255, 184, 223, 255);
    } else {
      backgroundColor = const Color.fromARGB(255, 208, 255, 210);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Contador MVVM')),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Contador: ${counterViewModel.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      counterViewModel.decrement();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      counterViewModel.increment();
                    },
                    child: const Icon(Icons.add),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      counterViewModel.reset();
                    },
                    child: const Text("Resetear"),
                   ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
