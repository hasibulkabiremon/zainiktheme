import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:zainikapi/model/product_list.dart';
import 'package:zainikapi/providers/api.dart';

import '../utils/widget_functions.dart';

class HomePAge extends StatefulWidget {
  static const String routeName = 'home';

  const HomePAge({Key? key}) : super(key: key);

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false)
        .getCurrentWeatherData();
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            // Respond to item press.
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(Icons.explore_outlined),
            ),
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ))),
            BottomNavigationBarItem(
              label: 'Inbox',
              icon: Icon(Icons.mail_outline),
            ),
            BottomNavigationBarItem(
              label: 'Shop',
              icon: Icon(Icons.shopping_bag_outlined),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white54,
              ),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: null,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search In sweaperxyz',
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              child: Consumer<ProductProvider>(
                builder: (context, provider, child) {
                  ProductList? product = provider.products;
                  return product.products == null
                      ? Center(
                          child: Text('Loading'),
                        )
                      : GridView.custom(
                          gridDelegate: SliverQuiltedGridDelegate(
                              crossAxisCount: 3,
                              mainAxisSpacing: 18,
                              crossAxisSpacing: 18,
                              pattern: [
                                QuiltedGridTile(1, 1),
                                QuiltedGridTile(1, 1),
                                QuiltedGridTile(1, 1),
                                QuiltedGridTile(2, 2),
                                QuiltedGridTile(1, 1),
                                QuiltedGridTile(1, 1),
                                QuiltedGridTile(1, 1),
                                QuiltedGridTile(1, 1),
                                QuiltedGridTile(1, 1),
                              ]),
                          childrenDelegate: SliverChildBuilderDelegate(
                              childCount: product.products!.length,
                              (context, index) {
                            final item = product.products![index];
                            return InkWell(
                              onTap: () {
                                showSingleTextInputDialog(
                                    context: context,
                                    title: item.thumbnail!,
                                ); },
                              child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Image.network(
                                    item.thumbnail!,
                                    fit: BoxFit.fill,
                                  )),
                            );
                          }),
                        );
                },
              ),
            ),
          ],
        ));
  }
}
