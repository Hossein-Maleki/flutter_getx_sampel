import 'package:flutter/material.dart';
import 'package:flutter_getx_sampel/controller/product_controller.dart';
import 'package:flutter_getx_sampel/models/product_model.dart';
import 'package:flutter_getx_sampel/view/main_screen.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //طزریق مستقیم وابستگی
    // Rx<ProductMpdel> product = ProductMpdel(name: "apple", off: "50%", prise: "20000").obs;

    //dependency injection
    ProductController _productcontroller = Get.put(ProductController(
        productModel:
            ProductMpdel(name: "laptop", prise: "200000", off: "20").obs));
                  
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
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "name:  " +
                            _productcontroller.productModel!.value.name!,
                        style: const TextStyle(fontSize: 25),
                      ),
                      Text(
                        "prise:  " +
                            _productcontroller.productModel!.value.prise!,
                        style: const TextStyle(fontSize: 25),
                      ),
                      Text(
                        "off:  " + _productcontroller.productModel!.value.off!,
                        style: const TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 86, 87, 87))),
                onPressed: () {
                  _productcontroller.productModel!.update((vle) {
                    _productcontroller.productModel!.value.name = "orange";
                  });
                },
                child: const Text("press")),
            ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 86, 87, 87))),
                onPressed: () {
                  Get.to(    MainScreen());
                },
                child: const Text("backt page")),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 35,
              width: 110,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " page <2>",
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
