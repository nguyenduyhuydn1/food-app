import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app_flutter/constant.dart';
import 'package:food_app_flutter/models/food.dart';
import 'package:food_app_flutter/widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  final Food item;
  const ProductScreen({super.key, required this.item});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 300);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      body: CustomScrollView(
        controller: _scrollController,
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverAppBarDelegate(
              maxExtent: size.height / 2,
              minExtent: size.height / 2,
              builder: (percent) {
                final bottomPercent = (percent / 0.3).clamp(0.0, 1.0);

                return _MainImage(
                    item: widget.item,
                    topPercent: ((1 - percent) / 0.7).clamp(0.0, 1.0),
                    bottomPercent: bottomPercent);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleLeft(title: widget.item.name, padding: false),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rate,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${widget.item.cal} cal",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 15),
                      const Icon(
                        Icons.access_time_outlined,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${widget.item.time}",
                        style: const TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rate,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${widget.item.rate} / 5",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "(${widget.item.reviews} reviews)",
                        style: const TextStyle(fontSize: 14),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleLeft(title: "Ingredients", padding: false),
                      SizedBox(height: 8),
                      Text("How many servings?")
                    ],
                  ),
                  Container(
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox.shrink(),
                        Icon(Icons.remove),
                        Text(
                          "1",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Icon(Icons.add),
                        SizedBox.shrink(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    ...List.generate(5, (index) {
                      return ListTile(
                        leading: Image.asset(
                          widget.item.image,
                          fit: BoxFit.fill,
                        ),
                        contentPadding: const EdgeInsets.only(bottom: 10),
                        title: Text(
                          widget.item.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: const Text("400g"),
                        trailing: const Text("400g"),
                      );
                    }),
                  ],
                ),
              );
            },
            itemCount: 1,
          )
        ],
      ),
      bottomNavigationBar: const _BottomNavigation(),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: kbackgroundColor,
      height: 100,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: size.width - 90,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kprimaryColor,
            ),
            alignment: Alignment.center,
            child: const Text(
              "Start Cooking",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutBack,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 100 * value),
          child: child!,
        );
      },
      child: child,
    );
  }
}

class _MainImage extends StatelessWidget {
  const _MainImage({
    required this.item,
    required this.topPercent,
    required this.bottomPercent,
  });

  final double topPercent;
  final double bottomPercent;
  final Food item;

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    final size = MediaQuery.of(context).size;

    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          child: Stack(
            children: [
              SizedBox(
                height: size.height / 2,
                child: PageView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage(item.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: paddingTop + 10,
                left: -60 * (0.6 - bottomPercent),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                top: paddingTop + 10,
                right: -60 * (0.5 - bottomPercent),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: size.height / 2 - 50,
          bottom: null,
          child: TranslateAnimation(
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(color: Colors.grey, width: 50, height: 4),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  const CustomSliverAppBarDelegate({
    required double maxExtent,
    required double minExtent,
    required this.builder,
  })  : _maxExtent = maxExtent,
        _minExtent = minExtent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
