import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_application/ui/Screen/favorites.dart';
import 'package:food_ordering_application/ui/Screen/homepage.dart';
import 'package:food_ordering_application/ui/Screen/shopping_cart.dart';
import 'package:food_ordering_application/ui/utils/custom_colors.dart';


class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<HomeBottomNavigationBar> createState() => _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {

  var pageList = [HomePage() ,Favorites(), ShoppingCart()];
  late int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        buttonBackgroundColor: CustomColors.iconColor,
        backgroundColor: Colors.white,
        color: CustomColors.backColor,
        animationDuration: const Duration(milliseconds: 300),
        items: const
        [
          Icon(Icons.home,color: Colors.white,),
          Icon(Icons.person,color: Colors.white,),
          Icon(Icons.shopping_cart,color: Colors.white,),
        ],
        onTap: (indeks)
        {
          setState(() {
            selectedIndex = indeks;
            print(selectedIndex.toString());
          });
        },
      ),
    );
  }
}
