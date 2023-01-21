

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/model/model_cart_products.dart';
import '../core/view/db_provider.dart';

class NameIdSelected{
  String name;
  String value;
  bool isSelected;
  double price;

  NameIdSelected(this.name, {this.value = '', this.isSelected = false, this.price = 0.0});
}

class CheckoutController extends GetxController{
  int selectedView = 0;
  // List<String> titles = ['ADDRESS', 'SHIPPING', 'PREVIEW', 'PAYMENT'];
  List<NameIdSelected> titles = [
    NameIdSelected('ADDRESS', isSelected: true),
    NameIdSelected('SHIPPING',),
    NameIdSelected('PREVIEW',),
    NameIdSelected('PAYMENT',),
  ];

  List<NameIdSelected> shippingMethods = [
    NameIdSelected('Free shipping', value: '\$0.00', isSelected: true, price: 0.0),
    NameIdSelected('Flat rate', value: '\$20.00', price: 20.00),
    NameIdSelected('Local pickup', value: '\$10.00', price: 10.00),
  ];

  List<ModelCartProducts> cartProducts = [];

  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String email = '';
  String country = '';
  String state = '';
  String city = '';
  String apartment = '';
  String block = '';
  String streetName = '';
  String zipcode = '';

  updateCountry(String value){
    country = value;
    update();
  }

  getCartList(){
    if (DbProvider().getCart().isNotEmpty) {
      cartProducts = DbProvider().getCart();
    } else {
      cartProducts = [];
    }
    update();
  }

  String getCartPrice() {
    if (cartProducts.isNotEmpty) {
      double price = 0;
      for (int i = 0; i < cartProducts.length; i++) {
        if (cartProducts[i].isDiamond!) {
          price = price + double.parse(cartProducts[i].markupprice!);
        } else {
          price = (price +
              double.parse(cartProducts[i].finalprice!) * cartProducts[i].qty!);
        }
      }
      return "\$${price.toStringAsFixed(2)}";
    } else {
      return "\$00.00";
    }
  }

  double _getCartTotal(){
    if (cartProducts.isNotEmpty){
      double price = 0;
      for (int i = 0; i < cartProducts.length; i++) {
        if (cartProducts[i].isDiamond!) {
          price = price + double.parse(cartProducts[i].markupprice!);
        } else {
          price = (price +
              double.parse(cartProducts[i].finalprice!) * cartProducts[i].qty!);
        }
      }
      return price;
    }else{
      return 0.0;
    }
  }

  NameIdSelected selectedShipping(){
    return shippingMethods.filter((element) {return element.isSelected;}).first;
  }

  double getTotal(){
     return _getCartTotal() + selectedShipping().price;
  }
}