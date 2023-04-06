import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sawahku/src/home/iot_tools/main.dart';
import 'package:sawahku/src/home/profile/main.dart';
import 'package:sawahku/src/home/stats/main.dart';
import 'package:sawahku/src/home/stats/stats_v2/main.dart';

class MainHomePageLayouts extends StatefulWidget {
  const MainHomePageLayouts({Key? key}) : super(key: key);

  @override
  State<MainHomePageLayouts> createState() => _MainHomePageLayoutsState();
}

class _MainHomePageLayoutsState extends State<MainHomePageLayouts> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 1);

  int maxCount = 4;
  int index = 1;
  void _setIndex(int value) {
    setState(() {
      index = value;
    });
  }

  final List<String> title = ["Statistik", 'Alat IOT', 'Pasar', 'Profil'];

  /// widget list
  final List<Widget> bottomBarPages = [
    const AllStats(),
    const IotTools(),
    const MainStats(),
    const Profile(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.location_on_outlined,
                ),
                color: Colors.black,
                iconSize: 30),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings_outlined),
                  color: Colors.black,
                  iconSize: 30)
            ],
            title: Center(
                child: Text(title[index],
                    style: const TextStyle(
                        fontSize: 20, color: Color.fromRGBO(45, 45, 45, 1))))),
        body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
                bottomBarPages.length, (index) => bottomBarPages[index])),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
                pageController: _pageController,
                color: const Color.fromRGBO(246, 246, 246, 1),
                showLabel: false,
                notchColor: const Color.fromRGBO(13, 187, 87, 1),
                bottomBarItems: const [
                  BottomBarItem(
                      inActiveItem: Icon(Icons.eco_outlined,
                          color: Colors.blueGrey, size: 30),
                      activeItem: Center(
                          child: Icon(Icons.eco_outlined, color: Colors.white)),
                      itemLabel: 'Page 1'),
                  BottomBarItem(
                      inActiveItem: Icon(Icons.smart_toy_outlined,
                          color: Colors.blueGrey, size: 30),
                      activeItem: Center(
                          child: Icon(Icons.smart_toy_outlined,
                              color: Colors.white)),
                      itemLabel: 'Page 2'),
                  BottomBarItem(
                      inActiveItem: Icon(Icons.storefront,
                          size: 30, color: Colors.blueGrey),
                      activeItem: Icon(Icons.storefront, color: Colors.white),
                      itemLabel: 'Page 3'),
                  BottomBarItem(
                      inActiveItem: Icon(Icons.person_outline_rounded,
                          size: 30, color: Colors.blueGrey),
                      activeItem: Icon(Icons.person_outline_rounded,
                          color: Colors.white),
                      itemLabel: 'Page 4')
                ],
                onTap: (index) {
                  _setIndex(index);

                  /// control your animation using page controller
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn);
                })
            : null);
  }
}
