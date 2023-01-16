import 'dart:async';
import 'dart:convert';

import 'package:ecom/core/bloc/cart_bloc.dart';
import 'package:ecom/core/model/model_cart_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../HomePage_Button/model/model_custom_products.dart';
import 'app_string.dart';

/// A [DbProvider] class is used to network API call
/// Allows all classes implementing [Client] to be mutually composable.
class DbProvider {
  static final DbProvider _singletonDbProvider = DbProvider._internal();

  static SharedPreferences? _prefs;
  static final Map<String, dynamic> _memoryPrefs = <String, dynamic>{};

  static Future<SharedPreferences> load() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  factory DbProvider() {
    return _singletonDbProvider;
  }

  List _inventoryList = <ModelCustomProducts>[];
  List get inventoryList => _inventoryList;

  List<ModelCartProducts> getCart() {
    if (getString(AppString.cartData) != null && getString(AppString.cartData)!.isNotEmpty) {
      Iterable l = json.decode(getString(AppString.cartData)!);
      List<ModelCartProducts> data =
          List<ModelCartProducts>.from(l.map((model) => ModelCartProducts.fromJson(model)));
      _inventoryList = data;
      return data;
    } else {
      return [];
    }
  }

  bool addCart(String data, bool isDiamond, BuildContext context) {
    try {
      ModelCartProducts cart = ModelCartProducts.fromJson(jsonDecode(data));
      cart.isDiamond = isDiamond;
      List<ModelCartProducts> mList = [];
      bool added = false;
      if (getString(AppString.cartData) != null && getString(AppString.cartData)!.isNotEmpty) {
        Iterable l = json.decode(getString(AppString.cartData)!);
        mList = List<ModelCartProducts>.from(l.map((model) => ModelCartProducts.fromJson(model)));
        if (mList.isNotEmpty) {
          for (int i = 0; i < mList.length; i++) {
            if (isDiamond &&
                mList[i].diamonddetailsId != null &&
                mList[i].diamonddetailsId.toString() == cart.diamonddetailsId.toString()) {
              mList[i] = cart;
              added = true;
            } else if (isDiamond == false &&
                mList[i].entityId != null &&
                mList[i].entityId.toString() == cart.entityId.toString()) {
              mList[i] = cart;
              added = true;
            }
          }
        }
      }
      if (!added) {
        mList.add(cart);
      }
      DbProvider.setString(AppString.cartData, jsonEncode(mList));
      getCart();
      BlocProvider.of<CartBloc>(context).add(const CartProgress());
      return true;
    } catch (e) {
      ///Error
      BlocProvider.of<CartBloc>(context).add(const CartProgress());
      return false;
    }
  }

  bool deleteCart(String id, bool isDiamond, BuildContext context) {
    try {
      List<ModelCartProducts> mList = getCart();
      for (int i = 0; i < mList.length; i++) {
        if (isDiamond) {
          if (mList[i].diamonddetailsId != null && mList[i].diamonddetailsId.toString() == id) {
            mList.removeAt(i);
            break;
          }
        } else {
          if (mList[i].entityId != null && mList[i].entityId.toString() == id) {
            mList.removeAt(i);
            break;
          }
        }
      }
      DbProvider.setString(AppString.cartData, jsonEncode(mList));
      getCart();
      BlocProvider.of<CartBloc>(context).add(const CartProgress());
      return true;
    } catch (e) {
      ///Error
      BlocProvider.of<CartBloc>(context).add(const CartProgress());
      return false;
    }
  }

  bool clearCart(BuildContext context) {
    DbProvider.setString(AppString.cartData, '');
    getCart();
    BlocProvider.of<CartBloc>(context).add(const CartProgress());
    return true;
  }

  DbProvider._internal();

  static void setString(String key, String value) {
    _prefs!.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static String? getString(String key, {String? def}) {
    String? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _prefs?.getString(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val;
  }

  static Future<void> clear() async {
    _memoryPrefs.clear();
    await _prefs!.clear();
  }

  static void remove(String key) {
    _memoryPrefs.remove(key);
    _prefs!.remove(key);
  }
}
