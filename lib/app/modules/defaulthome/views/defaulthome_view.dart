import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food/app/modules/home/controllers/home_controller.dart';
import 'package:food/app/modules/home/views/home_view.dart';

import 'package:get/get.dart';

import '../controllers/defaulthome_controller.dart';

class DefaulthomeView extends GetView<DefaulthomeController> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SizedBox.expand(
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            //setState(() => _currentIndex = index);
            controller.currentIndex=index;
          },
          children: <Widget>[
           HomeView(),
            Container(color: Colors.red,),
            Container(color: Colors.green,),
            Container(color: Colors.blue,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: controller.currentIndex,
        
        onItemSelected: (index) {
        //  setState(() => _currentIndex = index);
         controller.currentIndex=index;
         controller.pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home'),activeColor:Colors.redAccent,
            icon: Icon(Icons.home,)
          ),
          BottomNavyBarItem(
            title: Text('Cart'),
            icon: Icon(FontAwesomeIcons.cartPlus)
          ),
          BottomNavyBarItem(
            title: Text('Item Three'),
            icon: Icon(Icons.chat_bubble)
          ),
          BottomNavyBarItem(
            title: Text('Item Four'),
            icon: Icon(Icons.settings)
          ),
        ],
      ),
    );
  }
}