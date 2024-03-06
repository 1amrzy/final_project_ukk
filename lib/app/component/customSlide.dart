import 'package:flutter/cupertino.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
      child: Container(
        height: 165,
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
      Container(
        width: 100,
        height: 130,
        color: items.background,
      );
}

class CardItem {
  final Color background;

  const CardItem({
    required this.background,
  });
}
