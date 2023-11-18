import 'package:flutter/material.dart';
import 'package:food_app_flutter/constant.dart';
import 'package:food_app_flutter/models/food.dart';
import 'package:food_app_flutter/screens/product_screen.dart';
import 'package:food_app_flutter/widgets/widgets.dart';

class QuickAndEasyScreen extends StatelessWidget {
  const QuickAndEasyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Quick & Easy",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Center(
            child: NotificationWidget(),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  // childAspectRatio: 3 / 4,
                  mainAxisExtent: 230,
                ),
                // itemCount: foods.length,
                itemBuilder: (context, index) {
                  final item = foods[index % foods.length];

                  return ItemQuickEasy(
                    item: item,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(item: item),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
