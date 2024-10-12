import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt active = 0.obs;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12)),
                child: Obx(
                  () => Text("$active"),
                )),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(
                        const Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor: WidgetStatePropertyAll(
                        const Color.fromARGB(255, 86, 87, 87))),
                onPressed: () {
                  active++;
                },
                child: Text("press")),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 35,
              width: 110,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " page <1>",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
