import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final value = '';
  TextEditingController txtSearch = TextEditingController();
  updateSearchValue({required String str}){
    txtSearch.text = str;
    update();
  }

}