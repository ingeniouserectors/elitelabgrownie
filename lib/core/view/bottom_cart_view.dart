import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/core/bloc/cart_bloc.dart';
import 'package:ecom/core/model/model_cart_products.dart';
import 'package:ecom/core/view/db_provider.dart';
import 'package:ecom/core/view/image_viewer_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomCartView extends StatefulWidget {
  const BottomCartView({Key? key}) : super(key: key);

  @override
  State<BottomCartView> createState() => _BottomCartViewState();
}

class _BottomCartViewState extends State<BottomCartView> {
  List<ModelCartProducts> mModelCartProducts = [];

  @override
  void initState() {
    isCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartResponse) {
          isCart();
        }
      },
      child: Align(
          alignment: FractionalOffset.bottomRight,
          child: SizedBox(
            height: 70,
            width: getWi(),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(color: Colors.white),
                backgroundColor: const Color(0xffD9F3F2),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    // topRight: Radius.circular(30),
                  ),
                ),
              ),
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                ),
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                    size: 20,
                  ),
                  mModelCartProducts.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              // alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.cyan,
                              ),
                              padding: EdgeInsets.all(3),
                              height: 33,
                              width: 15,
                              child: Center(child: Text('${mModelCartProducts.length}'))),
                        )
                      : SizedBox(),
                  mModelCartProducts.isNotEmpty
                      ? SizedBox(
                          height: 70,
                          width: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                mModelCartProducts.length >= 3 ? 3 : mModelCartProducts.length,
                            //itemCount: mModelCartProducts.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  color: Colors.white,
                                  height: 38,
                                  width: 33,
                                  child: ImageViewerNetwork(
                                    mFit: BoxFit.contain,
                                    url: mModelCartProducts[index].isDiamond!
                                        ? mModelCartProducts[index].imagelink ?? ''
                                        : mModelCartProducts[index].imageUrl ?? '',
                                    width: 38,
                                    height: 33,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          )),
    );
  }

  double getWi() {
    if (mModelCartProducts.length == 1) {
      return 150;
    } else if (mModelCartProducts.length == 2) {
      return 200;
    } else if (mModelCartProducts.isEmpty) {
      return 60;
    } else {
      return 245;
    }
  }

  isCart() {
    if (DbProvider().getCart().isNotEmpty) {
      setState(() {
        mModelCartProducts = DbProvider().getCart();
      });
    } else {
      setState(() {
        mModelCartProducts = [];
      });
    }
  }
}
