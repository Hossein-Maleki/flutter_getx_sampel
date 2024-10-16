//descreption:
//we have 3 consebt in the project:

//1.Dependency Injection -> in the line 16-18;

//2.State manegment -> ractive(RX)+obserable(abs) variable ->obx object for a ractive widget;

//3.MVC ararchitectural-> contoroler for conction modele <Layer>( data and Business Logiclogic) and view<Layer> )

import 'package:flutter/material.dart';
import 'package:flutter_getx_sampel/controller/product_controller.dart';
import 'package:flutter_getx_sampel/models/product_model.dart';
import 'package:flutter_getx_sampel/view/product_screen%20copy.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //طزریق مستقیم وابستگی
    // Rx<ProductMpdel> product = ProductMpdel(name: "apple", off: "50%", prise: "20000").obs;
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
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "prise:  " +
                            _productcontroller.productModel!.value.prise!,
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "off:  " + _productcontroller.productModel!.value.off!,
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
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
                  _productcontroller.productModel!.update((vle) {
                    _productcontroller.productModel!.value.name = "ali";
                    _productcontroller.productModel!.value.prise = "536800";
                    _productcontroller.productModel!.value.off = "20";
                  });
                },
                child: Text("press to change ")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(
                        const Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor: WidgetStatePropertyAll(
                        const Color.fromARGB(255, 86, 87, 87))),
                onPressed: () {
                  Get.to(ProductScreen());
                },
                child: Text("next page")),
            SizedBox(
              height: 35,
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
