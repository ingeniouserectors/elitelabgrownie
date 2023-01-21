import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/CommonFunction.dart';
import 'checkout_controller.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  Widget _titleValue(String title, String value, {TextDecoration? decoration, int fontSize = 13}){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonFunction.shared.setCommonText(title, fontSize: 15, color: Colors.grey[650], fontWeight: FontWeight.w500),
          CommonFunction.shared.setCommonText(value, fontSize: fontSize, color: Colors.grey[650], fontWeight: FontWeight.w500, decoration: decoration)

        ],
      ),
    );
  }

  Widget _allColumnWidget(CheckoutController controller) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          CommonFunction.shared.setCommonText('Payment Methods', fontSize: 20, fontWeight: FontWeight.bold),
          SizedBox(height: 20,),
          _titleValue('Subtotal', controller.getCartPrice()),
          SizedBox(height: 20,),
          _titleValue(controller.selectedShipping().name, controller.selectedShipping().value),
          SizedBox(height: 20,),
          _titleValue('Total', '\$${controller.getTotal()}', decoration: TextDecoration.underline, fontSize: 20),
          SizedBox(height: 30,),
          CommonFunction.shared.shadowThemeButton('PLACE MY ORDER', 50, () {

          }, BGColor: Colors.cyan, textColor: Colors.white),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              controller.selectedView = 2;
              controller.titles[2].isSelected = true;
              controller.titles[3].isSelected = false;
              controller.update();
            },
            child: Container(
              width: double.infinity,
              child: Text(
                'Go back to review',
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
      return SingleChildScrollView(child: _allColumnWidget(controller));
    });
  }
}
