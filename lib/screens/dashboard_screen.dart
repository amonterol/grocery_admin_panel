import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/consts/constants.dart';
import 'package:grocery_admin_panel/inner_screens/add_prod.dart';
import 'package:grocery_admin_panel/responsive.dart';
import 'package:grocery_admin_panel/services/global_method.dart';
import 'package:grocery_admin_panel/services/utils.dart';
import 'package:grocery_admin_panel/widgets/buttons.dart';
import 'package:grocery_admin_panel/widgets/grid_products.dart';
import 'package:grocery_admin_panel/widgets/header.dart';
import 'package:grocery_admin_panel/widgets/text_widget.dart';

import 'package:provider/provider.dart';

import '../controllers/MenuController.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    return SafeArea(
      child: SingleChildScrollView(
        controller: ScrollController(),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              fct: () {
                context.read<MenuController>().controlDashboarkMenu();
              },
              title: 'Dashboard',
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Latest Products',
              color: color,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ButtonsWidget(
                      onPressed: () {},
                      text: 'View All',
                      icon: Icons.store,
                      backgroundColor: Colors.blue),
                  const Spacer(),
                  ButtonsWidget(
                      onPressed: () {
                        GlobalMethods.navigateTo(
                            ctx: context,
                            routeName: UploadProductForm.routeName);
                      },
                      text: 'Add product',
                      icon: Icons.add,
                      backgroundColor: Colors.blue),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Responsive(
                        mobile: ProductGridWidget(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          childAspectRatio:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                          isInMain: true,
                        ),
                        desktop: ProductGridWidget(
                          childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
                          isInMain: true,
                        ),
                      ),
                      // MyProductsHome(),
                      // SizedBox(height: defaultPadding),
                      // OrdersScreen(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
