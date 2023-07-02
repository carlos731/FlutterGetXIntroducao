import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getxintro/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final textController = TextEditingController();

  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    print('Criou arvore'); // Teste para ver se todos os widgets recarregam.

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Valor
            /* // GetBuilder: precisa de updates nos metodos do ValueController.
             GetBuilder<ValueController>(
              init: valueController,
              //initState: (_) {}, // Não precisa nesse exemplo ainda. Só com injeção de dependência.
              builder: (ctrl) {
                print('Criou GetX');
                return Text('Valor definido: ${ctrl.definedValue}');
              },
            ),
            */

            // GetX: Não precisa de uso dos updates no metodo da classe ValueController
            /*
            GetX<ValueController>(
              init: valueController,
              //initState: (_) {}, // Não precisa nesse exemplo ainda. Só com injeção de dependência.
              builder: (ctrl) {
                print('Criou GetX');
                return Text('Valor definido: ${ctrl.definedValue}');
              },
            ),
            */

            // Obx: Não precisa do tipo do controller. Não precisa passar um objeto no seu init
            Obx(() {
              print('Criou GetX');
              return Text('Valor definido: ${valueController.definedValue}');
            }),

            // Campo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                controller: textController,
              ),
            ),

            // Botão
            // GetX
            /*
              GetX<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return ctrl.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String value = textController.text;

                          valueController.setValue(value);
                        },
                        child: const Text('Confirmar'),
                      );
              },
            ),
            */

            Obx(() {
              return valueController.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        String value = textController.text;

                        valueController.setValue(value);
                      },
                      child: const Text(
                        'Confirmar',
                      ));
            }),

          ],
        ),
      ),
    );
  }
}
