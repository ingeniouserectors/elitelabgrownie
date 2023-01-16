// import 'package:ecom/DetailPage.dart';
// import 'package:ecom/Pages/drawer.dart';
// import 'package:ecom/horizontal_list.dart';
// import 'package:ecom/search.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> with WidgetsBindingObserver {
//   List<String> linPink = [
//     'assets/images/bridal.png',
//     'assets/images/custom.png',
//     'assets/images/Main_banner_3.png',
//     'assets/images/bridal.png',
//     'assets/images/custom.png',
//     'assets/images/Main_banner_3.png',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     double iconheight = MediaQuery.of(context).size.height;
//     double iconwidth = MediaQuery.of(context).size.width;
//     String? law;
//
//     return Scaffold(
//         backgroundColor:Colors.white,
//         body: SafeArea(
//           child: Column(
//             children: [
//               Padding(padding: EdgeInsets.only(top: 0),
//                 child: AppBar(
//                   toolbarHeight: 95,
//                   leading:  InkWell(
//                     onTap: (){
//                       drawer();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: ImageIcon(
//                         AssetImage("assets/images/Bottom/dr.png"),
//
//                       ),
//                     ),
//                   ),
//                   title: Image.asset(
//                     'assets/images/image_elite.png',
//                     height: 55,
//                   ),
//                   centerTitle: true,
//                   backgroundColor: Colors.white,
//                   // elevation: 0,
//                   iconTheme: IconThemeData(color: Colors.black),
//                   actions: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(right: 1, left: 2),
//                       child: IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.camera_alt_outlined,
//                             color: Colors.grey,
//                           )),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         // method to show the search bar
//                         showSearch(
//                             context: context,
//                             // delegate to customize the search bar
//                             delegate: CustomSearchDelegate());
//                       },
//                       icon: const Icon(Icons.search,color:Colors.grey),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         // method to show the search bar
//                         showSearch(
//                             context: context,
//                             // delegate to customize the search bar
//                             delegate: CustomSearchDelegate());
//                       },
//                       icon: const Icon(Icons.notifications_none,color:Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 0,),
//                 child: ClipRRect(
//                   child: Container(
//                       color: Colors.white,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 14,bottom: 10),
//                         child: TopCategories(),
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         )
//     );
//   }
// }
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Main_Page/order.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Profilepage/about_us.dart';
import '../Profilepage/terms.dart';
import '../loginpage/loginpage.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int currentTab = 3;
  Widget currentScreen = Profile();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    double drawerwidth = MediaQuery.of(context).size.width;
    double drawerheighth = MediaQuery.of(context).size.height;
    return Scaffold(

      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: Colors.blueAccent[700],
              child: ImageIcon(AssetImage("assets/images/Bottom/home.png")),
              onPressed: () {setState(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));

              });}),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 120,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Category(),
                            ));
                        // currentScreen = Category();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/Bottom/first.png"),
                          color: currentTab == 0
                              ? Colors.blueAccent[700]
                              : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 220,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Order(),
                            ));
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 30,
                          color: currentTab == 1
                              ? Colors.blueAccent[700]
                              : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 220,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cart(),
                            ));
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/Bottom/cart.png"),
                          color: currentTab == 4
                              ? Colors.blueAccent[700]
                              : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 120,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ));
                        currentTab = 5;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/Bottom/profile.png"),
                          color: currentTab == 5
                              ? Colors.blueAccent[700]
                              : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

      drawer: Drawer(child: drawer(),),
      appBar: customappbar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0,),
            child: ClipRRect(
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 10),
                    child: TopCategories(),
                  )),
            ),
          ),
          Divider(
            height: 3,
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login_Page(),
                  ));
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login_Page()));
            },
            leading: Icon(
              CupertinoIcons.person,
              // color: Colors.black,
            ),
            title: Text(
              "Login",
              style: TextStyle(fontFamily: "roboto",fontSize: 13),
            ),
            trailing: Icon(
              CupertinoIcons.forward,
            ),
          ),
          Divider(
            height: 3,
          ),

          Padding(padding: EdgeInsets.only(top: 8,bottom: 20),),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10),),
              Text("General Setting",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "roboto",
                ),),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 20),),




          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            leading: Icon(
              CupertinoIcons.home,

              // color: Colors.black ,
            ),
            title: Text(
              "Home",style: TextStyle(fontFamily: "roboto",fontSize: 13),
            ),
            trailing: Icon(
              CupertinoIcons.forward,
            ),
          )  ,

          Divider(
            height: 3,
            indent: 70,
            endIndent: 20,
          ),


          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Order(),
                  ));

              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Order()));
            },
            leading: Icon(
              Icons.favorite_border,
              // color: Colors.black,
            ),
            title: Text(
              "Liked Products",
              style: TextStyle(fontFamily: "roboto",fontSize: 13),
            ),
            trailing: Icon(
              CupertinoIcons.forward,
            ),
          ),
          Divider(
            height: 3,
            indent: 70,
            endIndent: 20,
          ),

          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Order(),
                  ));


              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Order()));
            },
            leading: Icon(
              Icons.bookmark_border,
              // color: Colors.black,
            ),
            title: Text(
              "My Order",
              style: TextStyle(fontFamily: "roboto",fontSize: 13),
            ),
            trailing: Icon(
              CupertinoIcons.forward,
            ),
          ),
          Divider(
            height: 3,
            indent: 70,
            endIndent: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ));

              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
            },
            leading: Icon(
              CupertinoIcons.cart,
              // color: Colors.black,
            ),
            title: Text(
              "Cart",
              style: TextStyle(fontFamily: "roboto",fontSize: 13),
            ),
            trailing: Icon(
              CupertinoIcons.forward,
            ),
          ),
          Divider(
            height: 3,
            indent: 70,
            endIndent: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About_us(),
                  ));

  //            Navigator.of(context).push(MaterialPageRoute(builder: (context) => About_us()));
            },
            leading: Icon(
              Icons.account_box_outlined,
              // color: Colors.black,
            ),
            title: Text(
              "About",
              style: TextStyle(fontFamily: "roboto",fontSize: 13),
            ),
            trailing: Icon(
              CupertinoIcons.forward,
            ),
          ),
          Divider(
            height: 3,
            indent: 70,
            endIndent: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Trems(),
                  ));

     //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Trems()));
            },
            leading: Icon(
              Icons.privacy_tip,
              // color: Colors.black,
            ),
            title: Text(
              "Terms and Conditions",
              style: TextStyle(fontFamily: "roboto",fontSize: 13),
            ),
            trailing: Icon(
              CupertinoIcons.forward,
            ),
          ),
        ],
      ),
    );
  }
}