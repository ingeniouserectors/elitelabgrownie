import 'package:ecom/Utils/CommonFunction.dart';
import 'package:ecom/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Main_Page/HomePage.dart';

class CheckoutComplete extends StatelessWidget {
  const CheckoutComplete({Key? key}) : super(key: key);


  Widget _orderNo(){
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      color: kLightGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonFunction.shared.setCommonText("It's ordered!", fontSize: 18, fontWeight: FontWeight.w500),
          SizedBox(height: 10,),
          CommonFunction.shared.setCommonText("Order No. #32888", fontSize: 15, fontWeight: FontWeight.w500),
        ],
      ),
    );
  }

  Widget _titleSubtitle(String title, String subtitle){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonFunction.shared.setCommonText(title, fontSize: 18, fontWeight: FontWeight.w500),
          SizedBox(height: 10,),
          CommonFunction.shared.setCommonText(subtitle, fontSize: 15, fontWeight: FontWeight.w500, noOfLine: 5),
        ],
      ),
    );
  }

  Widget _allColumnWidget(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 10,),
          _orderNo(),
          SizedBox(height: 30,),
          _titleSubtitle("You've successfully placed the order", "You can check status of your order by using our delivery status feature. You will receive an order confirmation e-mail with details of your order and a link to track its progress."),
          SizedBox(height: 30,),
          _titleSubtitle("Your account", "You can log to your account using e-mail and password defined earlier. On your account you can edit your profile data, check history of transactions, edit subscription to newsletter."),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Get.off(HomePage());
            },
            child: Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kLightGrey)
              ),
              child: Text('BACK TO SHOP', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
            ),
          ),
        ],
      ),
    );
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
      body: _allColumnWidget(),
    );
  }
}
