import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customSlide extends StatelessWidget {
  final context;

  customSlide({
    super.key,
    required this.context,
  });

  List<CardItem> items = [
    CardItem(background: Color(0xFFD9D9D9)),
    CardItem(background: Color(0xFFD9D9D9)),
    CardItem(background: Color(0xFFD9D9D9)),
    CardItem(background: Color(0xFFD9D9D9)),
    CardItem(background: Color(0xFFD9D9D9)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (context, _) => SizedBox(
            width: 15,
          ),
          itemBuilder: (context, index) => builCard(items: items[index]),
        ),
      ),
    );
  }

  Widget builCard({
    required CardItem items,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 150,
          height: 50,
          color: items.background,
        ),
      );
}

class CardItem {
  final Color background;

  const CardItem({
    required this.background,
  });
}
