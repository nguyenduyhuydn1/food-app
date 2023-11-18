import 'package:flutter/material.dart';
import 'package:food_app_flutter/constant.dart';
import 'package:food_app_flutter/models/categories.dart';
import 'package:food_app_flutter/models/food.dart';
import 'package:food_app_flutter/screens/quick_and_easy_screen.dart';
import 'package:food_app_flutter/widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(children: [
              const SizedBox(height: 20),

              // appbar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          "What are you cooking today ?",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            height: 0.9,
                          ),
                        ),
                      ),
                      const NotificationWidget(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "search any recipe ...",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/explore.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // categories
              Column(children: [
                const TitleLeft(title: "Categories"),
                const SizedBox(height: 15),
                SizedBox(
                  width: size.width,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final item = categories[index];
                      final check = selected == index;
                      final lastItem = categories.length - 1 == index;

                      return GestureDetector(
                        onTap: () {
                          selected = index;
                          setState(() {});
                        },
                        child: Container(
                          width: 100,
                          margin: lastItem
                              ? const EdgeInsets.only(right: 0)
                              : const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: check ? kprimaryColor : Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            item,
                            style: TextStyle(
                              color: check ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
              const SizedBox(height: 20),

              // quick
              Column(children: [
                const TitleLeft(title: "Quick & Easy", view: true),
                const SizedBox(height: 15),
                SizedBox(
                  width: size.width,
                  height: 220,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      final item = foods[index];
                      final lastItem = foods.length - 1 == index;

                      return Padding(
                        padding: lastItem
                            ? const EdgeInsets.only(right: 0)
                            : const EdgeInsets.only(right: 10),
                        child: ItemQuickEasy(
                          item: item,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const QuickAndEasyScreen(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ])
            ]),
          ),
        ),
      ),
    );
  }
}
