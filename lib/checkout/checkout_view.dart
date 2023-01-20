import 'package:ecom/checkout/address_view.dart';
import 'package:ecom/checkout/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {

  final checkoutController = Get.put(CheckoutController());


  Widget _selectedView(){
    return GetBuilder<CheckoutController>(builder: (controller) {
      if (controller.selectedView == 0){
        return AddressView();
      }else if (controller.selectedView == 1){
        return Container(
          height: 500,
          width: double.infinity,
          color: Colors.grey,
        );
      }else if (controller.selectedView == 2){
        return Container(
          height: 500,
          width: double.infinity,
          color: Colors.pink,
        );
      }else if (controller.selectedView == 3){
        return Container(
          height: 500,
          width: double.infinity,
          color: Colors.blue,
        );
      }else{
        return Container();
      }
    });
  }


  Widget _allWidgets() {
    return GetBuilder<CheckoutController>(builder: (controller) {
      return Container(
        // color: Colors.blue,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // children: checkoutController.titles.forEach((element) {Text(element);}),
                children: List<Widget>.generate(checkoutController.titles.length,
                        (index) {
                      return Container(
                        height: 35,
                        width: (Get.width - 20) / checkoutController.titles.length,
                        // color: Colors.pink,
                        decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: checkoutController.titles[index].isSelected
                                      ? Colors.cyan
                                      : Colors.black,
                                  width:
                                  checkoutController.titles[index].isSelected ? 4 : 1),
                            )),
                        child: Text(
                          '${checkoutController.titles[index].name}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: checkoutController.titles[index].isSelected
                                  ? Colors.cyan
                                  : Colors.black),
                        ),
                      );
                    })),
            SizedBox(
              height: 8,
            ),
            _selectedView(),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        title: Text('Checkout'),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(child: _allWidgets())
      ),
    );
  }
}
