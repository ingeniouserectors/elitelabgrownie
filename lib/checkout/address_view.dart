import 'package:ecom/Utils/CommonFunction.dart';
import 'package:ecom/Utils/CommonTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import 'checkout_controller.dart';

class AddressView extends StatelessWidget {
  AddressView({Key? key}) : super(key: key);

  final checkoutController = Get.put(CheckoutController());
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtPhoneNumber = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtApartment = TextEditingController();
  TextEditingController txtBlock = TextEditingController();
  TextEditingController txtStreetName = TextEditingController();
  TextEditingController txtZipCode = TextEditingController();


  Widget _buttonWithImage(String title, GestureTapCallback onTap, {double width = double.infinity}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: kLightGrey,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions),
            SizedBox(width: 10,),
            CommonFunction.shared.setCommonText(title)
          ],
        ),
      ),
    );
  }

  Widget _allWidgets(){
    return GetBuilder<CheckoutController>(builder: (controller) {
      return Container(
        // height: 2000,
        // width: 500,
        // color: Colors.red,
        child: Column(
          children: [
            CommonTextField(
                controller: txtFirstName,
                placeholder: "First Name",
                keyboardType: TextInputType.name,
                onChanged: (str) {
                  controller.firstName = str;
                }
            ),
            SizedBox(height: 10,),
            CommonTextField(
                controller: txtLastName,
                placeholder: "Last Name",
                keyboardType: TextInputType.name,
                onChanged: (str) {
                  controller.lastName = str;
                }
            ),
            SizedBox(height: 10,),
            CommonTextField(
                controller: txtPhoneNumber,
                placeholder: "Phone number",
                keyboardType: TextInputType.phone,
                onChanged: (str) {
                  controller.phoneNumber = str;
                }
            ),
            SizedBox(height: 10,),
            CommonTextField(
                controller: txtEmail,
                placeholder: "Email",
                keyboardType: TextInputType.emailAddress,
                onChanged: (str) {
                  controller.email = str;
                }
            ),
            SizedBox(height: 20,),
            _buttonWithImage('SEARCHING ADDRESS', (){

            }),
            SizedBox(height: 20,),
            _buttonWithImage('SELECT ADDRESS', (){

            }),
            SizedBox(height: 10,),
            CommonTextField(
                controller: txtCity,
                placeholder: "City",
                keyboardType: TextInputType.text,
                onChanged: (str) {
                  controller.city = str;
                }
            ),
            SizedBox(height: 10,),
            CommonTextField(
                controller: txtApartment,
                placeholder: "Apartment",
                keyboardType: TextInputType.text,
                onChanged: (str) {
                  controller.apartment = str;
                }
            ),
            SizedBox(height: 10,),
            CommonTextField(
                controller: txtBlock,
                placeholder: "Block",
                keyboardType: TextInputType.text,
                onChanged: (str) {
                  controller.block = str;
                }
            ),
            SizedBox(height: 10,),
            CommonTextField(
                controller: txtStreetName,
                placeholder: "Street Name",
                keyboardType: TextInputType.streetAddress,
                onChanged: (str) {
                  controller.streetName = str;
                }
            ),
            SizedBox(height: 10,),
            CommonTextField(
                controller: txtZipCode,
                placeholder: "Zip-Code",
                keyboardType: TextInputType.number,
                isLastTextField: true,
                onChanged: (str) {
                  controller.zipcode = str;
                }
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                CommonFunction.shared.shadowThemeButton('SAVE ADDRESS', 50, () {},
                    width: 200),
                SizedBox(width: 20,),
                Expanded(
                  child: CommonFunction.shared.shadowThemeButton('CONTINUE TO SHIPPING', 50, () {
                    controller.selectedView = 1;
                    controller.titles[1].isSelected = true;
                    controller.update();
                  }, BGColor: Colors.cyan, textColor: Colors.white),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _allWidgets();
  }
}
