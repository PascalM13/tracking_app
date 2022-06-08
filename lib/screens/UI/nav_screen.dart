import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int pageIndex = 0;

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        Center(
          child: Text("Home"),
        ),
        Center(
          child: Text("Acitivity"),
        ),
        Center(
          child: Text("History"),
        ),
        Center(
          child: Text("User"),
        )
      ],
    );
  }

  Widget getFooter() {
    const List<IconData> icons = [
      IconData(0xe318, fontFamily: 'MaterialIcons'),
      IconData(0xf86b, fontFamily: 'MaterialIcons'),
      IconData(0xe314, fontFamily: 'MaterialIcons'),
      IconData(0xe491, fontFamily: 'MaterialIcons')
    ];

    void onTapIcon(newIndex) {
      setState(() {
        pageIndex = newIndex;
      });
    }

    return Container(
        height: 70,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: primary,
            border:
                Border(top: BorderSide(width: 1, color: Color(0x00000000)))),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(icons.length, (index) {
              return InkWell(
                onTap: () => onTapIcon(index),
                child: Column(
                  children: [
                    Icon(icons[index],
                        size: 28,
                        color: pageIndex == index ? secondery : Colors.black54),
                    const SizedBox(
                      height: 3,
                    ),
                    if (pageIndex == index)
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                            color: secondery, shape: BoxShape.circle),
                      )
                  ],
                ),
              );
            }),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }
}
