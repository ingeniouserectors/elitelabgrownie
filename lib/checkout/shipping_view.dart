import 'package:ecom/Utils/CommonFunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'checkout_controller.dart';

class ShippingView extends StatelessWidget {
  ShippingView({Key? key}) : super(key: key);

  final checkoutController = Get.put(CheckoutController());

  Widget _shippingCell(int index, NameIdSelected method, CheckoutController controller){
    return GestureDetector(
      onTap: (){
        controller.shippingMethods.forEach((element) {element.isSelected = false;});
        controller.shippingMethods[index].isSelected = true;
        controller.update();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: 100,
        color: method.isSelected ? Color(0xffEBEBEB) : Colors.transparent,
        child: Row(
          children: [
            method.isSelected
                ? Icon(Icons.radio_button_checked, color: Colors.blue,)
                : Icon(Icons.radio_button_off),
            SizedBox(width: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonFunction.shared.setCommonText(method.name, fontSize: 20, fontWeight: FontWeight.bold),
                SizedBox(height: 10,),
                CommonFunction.shared.setCommonText(method.value, fontSize: 18, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _shippingListView(CheckoutController controller) {
      return Container(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: controller.shippingMethods.length,
          itemBuilder: (context, index) {
            return _shippingCell(index, controller.shippingMethods[index], controller);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 0,
              color: Colors.grey,
            );
          },
        ),
      );
  }

  Widget _allColumnWidget(CheckoutController controller){
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          CommonFunction.shared.setCommonText('Shipping Method', fontSize: 20, fontWeight: FontWeight.bold),
          SizedBox(height: 10,),
          _shippingListView(controller),
          SizedBox(height: 30,),
          CommonFunction.shared.shadowThemeButton('CONTINUE TO REVIEW', 50, () {
            controller.selectedView = 2;
            controller.titles[2].isSelected = true;
            controller.update();
          }, BGColor: Colors.cyan, textColor: Colors.white),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              controller.selectedView = 0;
              controller.titles[0].isSelected = true;
              controller.titles[1].isSelected = false;
              controller.update();
            },
            child: Container(
              width: double.infinity,
              child: Text(
                'Go back to address',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) {
      return _allColumnWidget(controller);
    });
  }
}
