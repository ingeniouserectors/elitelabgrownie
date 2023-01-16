import 'package:ecom/core/model/model_cart_products.dart';
import 'package:ecom/core/view/image_viewer_network.dart';
import 'package:flutter/material.dart';

class WidgetCart extends StatefulWidget {
  final Function deleteCart;
  final Function(int) updateQTY;
  final ModelCartProducts mModelCartProducts;
  const WidgetCart({Key? key, required this.deleteCart, required this.mModelCartProducts, required this.updateQTY}) : super(key: key);

  @override
  State<WidgetCart> createState() => _WidgetCartState();
}

class _WidgetCartState extends State<WidgetCart> {

  String dropdownvalue = ' 1';

// List of items in our dropdown menu
  var items = [
    ' 1',
    ' 2',
    ' 3',
    ' 4',
    ' 5',
    ' 6',
    ' 7',
    ' 8',
    ' 9',
    ' 10',
  ];
  @override
  void initState() {
   init();
    super.initState();
  }

  init(){
    setState(() {
      //dropdownvalue=' '+widget.mModelCartProducts.qty.toString();
      if(widget.mModelCartProducts.qty!=null) {
        dropdownvalue=' '+widget.mModelCartProducts.qty.toString();
       /* for(int i=0;i<items.length;i++) {
          if(' '+widget.mModelCartProducts.qty.toString()==items[i]) {
            dropdownvalue = items[i];
            break;
          }
        }*/
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: const Padding(
                padding: EdgeInsets.only(
                    left: 20, right: 20, top: 50, bottom: 20),
                child: Icon(Icons.remove_circle_outline),
              ),
              onTap: () {
                widget.deleteCart();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ImageViewerNetwork(
                mFit: BoxFit.contain,
                url:widget.mModelCartProducts.isDiamond!
                    ?widget.mModelCartProducts.imagelink ?? ''
                    :widget.mModelCartProducts.imageUrl ?? '',
                width: 250,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   widget.mModelCartProducts.isDiamond!
                        ? ' Lot: ${widget.mModelCartProducts.lot}'
                        :widget.mModelCartProducts.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style:
                    (TextStyle(fontSize: 15, color: Color(0xff5c7580))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                   widget.mModelCartProducts.isDiamond!
                        ? "\$${double.parse( widget.mModelCartProducts.markupprice!).toStringAsFixed(2)}"
                        : "\$${double.parse( widget.mModelCartProducts.finalprice!).toStringAsFixed(2)}",
                    style:
                    TextStyle(fontSize: 15, color: Color(0xff5c7580)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (! widget.mModelCartProducts.isDiamond!)
                    Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(3.5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
// Initial Value
                          value: dropdownvalue,

// Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

// Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
// After selecting the desired option,it will
// change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                            widget.updateQTY(int.parse(dropdownvalue));
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
