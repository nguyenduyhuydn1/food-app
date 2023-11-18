import 'package:flutter/material.dart';
import 'package:food_app_flutter/models/food.dart';

class ItemQuickEasy extends StatefulWidget {
  const ItemQuickEasy({
    super.key,
    required this.item,
    required this.onTap,
  });

  final VoidCallback onTap;
  final Food item;

  @override
  State<ItemQuickEasy> createState() => _ItemQuickEasyState();
}

class _ItemQuickEasyState extends State<ItemQuickEasy> {
  bool favorites = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: size.width * 0.55,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.item.image),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: Alignment.topRight,
              child: Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.only(top: 15, right: 15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: () {
                    favorites = !favorites;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.favorite,
                    color: favorites ? Colors.red : Colors.grey,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.item.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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
              "${widget.item.rate}",
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
        )
      ],
    );
  }
}
