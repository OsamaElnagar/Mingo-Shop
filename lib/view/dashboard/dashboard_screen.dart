import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mingo_shop/controller/dashboard_controller.dart';
import 'package:mingo_shop/view/account/account_screen.dart';
import 'package:mingo_shop/view/category/category_screen.dart';
import 'package:mingo_shop/view/home/home_screen.dart';
import 'package:mingo_shop/view/product/product_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.grey.shade100,
              body: SafeArea(
                child: IndexedStack(
                  index: controller.tapIndex,
                  children:  const [
                    HomeScreen(),
                    ProductScreen(),
                    CategoryScreen(),
                    AccountScreen(),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 0.7))),
                child: SnakeNavigationBar.color(
                  behaviour: SnakeBarBehaviour.floating,
                  snakeShape: SnakeShape.circle,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  unselectedLabelStyle: const TextStyle(fontSize: 11),
                  snakeViewColor: Theme.of(context).primaryColor,
                  unselectedItemColor: Theme.of(context).colorScheme.secondary,
                  showUnselectedLabels: true,
                  currentIndex: controller.tapIndex,
                  onTap: (val) {
                    controller.updateIndex(val);
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.category), label: 'Category'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.menu), label: 'Menu'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle), label: 'Account')
                  ],
                ),
              ),
            ));
  }
}
