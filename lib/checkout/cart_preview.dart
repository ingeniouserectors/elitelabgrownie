import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/CommonFunction.dart';
import '../constant.dart';
import '../core/model/model_cart_products.dart';
import '../core/view/image_viewer_network.dart';
import 'checkout_controller.dart';

class CartPreviewView extends StatelessWidget {
  const CartPreviewView({Key? key}) : super(key: key);

  Widget _titleValue(String title, String value, {TextDecoration? decoration}){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonFunction.shared.setCommonText(title, fontSize: 15, color: Colors.grey[650], fontWeight: FontWeight.w500),
          CommonFunction.shared.setCommonText(value, fontSize: 13, color: Colors.grey[650], fontWeight: FontWeight.w500, decoration: decoration)

        ],
      ),
    );
  }

  Widget _productCell(int index, ModelCartProducts product, CheckoutController controller){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // color: Colors.grey,
            child: ImageViewerNetwork(
              mFit: BoxFit.fill,
              url:product.isDiamond!
                  ?product.imagelink ?? ''
                  :product.imageUrl ?? '',
              width: 250,
              height: 200,
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonFunction.shared.setCommonText(product.name, color: themeGrey, fontSize: 18, noOfLine: 3, fontWeight: FontWeight.w500),
                SizedBox(height: 10,),
                CommonFunction.shared.setCommonText(
                  product.isDiamond!
                      ? "\$${double.parse(product.markupprice!).toStringAsFixed(2)}"
                      : "\$${double.parse(product.finalprice!).toStringAsFixed(2)}",
                  fontSize: 15,
                  color: themeGrey,
                  fontWeight: FontWeight.w500
                ),
                SizedBox(height: 10,),
                Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 1),
                    borderRadius: BorderRadius.circular(3.5),
                  ),
                  alignment: Alignment.center,
                  child: CommonFunction.shared.setCommonText('${product.qty}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _productListView(CheckoutController controller){
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: controller.cartProducts.length,
        itemBuilder: (context, index) {
          return _productCell(index, controller.cartProducts[index], controller);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 10,);
        },
      ),
    );
  }

  Widget _allColumnWidget(CheckoutController controller){
    return Container(
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          CommonFunction.shared.setCommonText('Order Details', fontSize: 20, fontWeight: FontWeight.bold),
          SizedBox(height: 20,),
          _productListView(controller),
          SizedBox(height: 20,),
          Divider(
            // height: 0,
            color: Colors.grey.withOpacity(0.5),
          ),
          SizedBox(height: 30,),
          _titleValue('Subtotal', controller.getCartPrice()),
          SizedBox(height: 20,),
          _titleValue(controller.selectedShipping().name, controller.selectedShipping().value),
          SizedBox(height: 20,),
          _titleValue('Total', '\$${controller.getTotal()}', decoration: TextDecoration.underline),
          SizedBox(height: 40,),
          CommonFunction.shared.setCommonText('Your note', fontSize: 20, fontWeight: FontWeight.bold),
          SizedBox(height: 10,),
          Container(
            // height: 100,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: kLightGrey, width: 1),
                ),
                hintText: 'write your note'
              ),
            ),
          ),
          SizedBox(height: 30,),
          CommonFunction.shared.shadowThemeButton('CONTINUE TO PAYMENT', 50, () {
            controller.selectedView = 3;
            controller.titles[3].isSelected = true;
            controller.update();
          }, BGColor: Colors.cyan, textColor: Colors.white),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              controller.selectedView = 1;
              controller.titles[1].isSelected = true;
              controller.titles[2].isSelected = false;
              controller.update();
            },
            child: Container(
              width: double.infinity,
              child: Text(
                'Go back to shipping',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
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
