import 'package:contador_pessoas/my_home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "App Contador de pessoas",
          style: TextStyle(),
        ),
      ),
      drawer: const Drawer(),
      body: GetBuilder<MyHomePageController>(
        init: MyHomePageController(), // Inicialize o controlador
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  controller.peapleCounter < 20
                      ? "Pode entrar"
                      : "Espaço lotado",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Obx(
                () => Text(
                  controller.peapleCounter.toString(),
                  style: TextStyle(
                    fontSize: 40,
                    color: controller.peapleCounter < 20
                        ? Colors.blue
                        : Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: FloatingActionButton(
                      splashColor: Colors.green,
                      onPressed: () {
                        if (controller.peapleCounter < 20) {
                          controller.peapleCounter =
                              controller.peapleCounter + 1;
                        }
                      },
                      child: const Text("Adicionar"),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: 100,
                    child: FloatingActionButton(
                      splashColor: Colors.red,
                      onPressed: () {
                        controller.peapleCounter = controller.peapleCounter - 1;
                      },
                      child: const Text("Remover"),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
