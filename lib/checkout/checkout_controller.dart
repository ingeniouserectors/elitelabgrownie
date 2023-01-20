

import 'package:get/get.dart';

class NameIdSelected{
  String name;
  String id;
  bool isSelected;

  NameIdSelected(this.name, {this.id = '', this.isSelected = false});
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

}