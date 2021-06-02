import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Use [SystemUiOverlayStyle.light] for white status bar
      // or [SystemUiOverlayStyle.dark] for black status bar
      // https://stackoverflow.com/a/58132007/1321917
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Obx(
                ()  =>
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.redAccent,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(FontAwesomeIcons.doorClosed),
                        Text(
                          'Restaurant is close now, will be open at 9:00am',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            'https://img.freepik.com/free-vector/man-riding-scooter-white-background_1308-46379.jpg?size=338&ext=jpg',
                            height: 35,
                            width: 35,
                          ),
                          Text(
                            '  eFood',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Icon(FontAwesomeIcons.solidBell)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0.0),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[200], width: 0.0),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red[300], width: 0.0),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red[300], width: 0.0),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      prefixIcon: Icon(FontAwesomeIcons.search),
                      suffixIcon: Icon(Icons.equalizer),
                      border: InputBorder.none,
                      hintText: 'Search items here...',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'All Categories',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.getCategoriesVarLength.value,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://image.freepik.com/free-psd/food-social-media-banner-post-template_202595-356.jpg'),
                                  radius: 35,
                                ),
                                Text(
                                  controller.getCategoriesVar[0][index].name,
                                  style: TextStyle(
                                      fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Set Menu',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     height: MediaQuery.of(context).size.width / 2,
                //     child: ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: controller.getSetMenuLength.value,
                //         itemBuilder: (BuildContext ctxt, int index) {
                //           return Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(20),
                //                 color: Colors.white,
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.grey.withOpacity(0.5),
                //                     spreadRadius: 0,
                //                     blurRadius: 3,
                //                     offset: Offset(
                //                         0, 1), // changes position of shadow
                //                   ),
                //                 ],
                //               ),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Image.network(
                //                     'https://image.freepik.com/free-psd/food-social-media-banner-post-template_202595-356.jpg',
                //                     width: MediaQuery.of(context).size.width / 2,
                //                     height: MediaQuery.of(context).size.width / 4,
                //                     fit: BoxFit.fitWidth,
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.all(4.0),
                //                     child: Text(
                //                       controller.getSetMenuVar[0][index].name,
                //                       style: TextStyle(
                //                           fontSize: 10,
                //                           fontWeight: FontWeight.bold),
                //                     ),
                //                   ),
                //                   Container(
                //                     width: MediaQuery.of(context).size.width / 2,
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(4.0),
                //                       child: Row(
                //                         children: [
                //                           Text(
                //                             '★★★★★',
                //                             style: TextStyle(
                //                                 color: Colors.redAccent),
                //                           )
                //                         ],
                //                         mainAxisAlignment: MainAxisAlignment.end,
                //                       ),
                //                     ),
                //                   ),Container(  width: MediaQuery.of(context).size.width / 2,
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(4.0),
                //                       child: Row(children: [
                //                         Text(
                //                           '\$ ${controller.getSetMenuVar[0][index].variations[0].price.toString()}',
                //                           style: TextStyle(
                //                               fontSize: 10,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Icon(Icons.add)
                //                       ],
                //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,),
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           );
                //         }),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Banner',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,

                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.getBannerVarLength.value,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(width: MediaQuery.of(context).size.width-150,
                                decoration: new BoxDecoration( borderRadius: BorderRadius.circular(20),
                                image: new DecorationImage(
                                image: new NetworkImage( 'https://as1.ftcdn.net/jpg/02/48/92/96/500_F_248929619_JkVBYroM1rSrshWJemrcjriggudHMUhV.jpg',),
                             fit: BoxFit.cover,
                            ),)
                            ),
                          );
                        }),
                  ),
                ),
                // Obx(
                //
                //       () => Text(
                //         '${controller.getSetMenuVar[0][1].variations[0].type}',
                //     // '${controller.getCategoriesVar[0][0].name}',
                //     style: Theme.of(context).textTheme.headline4,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
