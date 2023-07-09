import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halalfood/core/constant/constants.dart';
import 'package:halalfood/features/main/presentation/cubit/navigation_cubit.dart';

class MainPageView extends StatefulWidget {
  const MainPageView(
      {super.key,
      required this.body,
      required this.selectedIndex,
      required this.onDestinationSelected});
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final NavigationCubit navigationCubit = NavigationCubit();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
          bottomNavigationBar: _bottomNavigationBar(), body: widget.body),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          widget.onDestinationSelected(index);
        },
        backgroundColor: Colors.white,
        currentIndex: widget.selectedIndex,
        elevation: 0,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              "assets/icons/home.svg",
              width: 25,
              height: 25,
              color: appMainColor,
            ),
            label: 'Əsas',
            icon: SvgPicture.asset(
              "assets/icons/home-outline.svg",
              width: 25,
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            activeIcon: SvgPicture.asset(
              "assets/icons/person.svg",
              width: 25,
              height: 25,
              color: appMainColor,
            ),
            icon: SvgPicture.asset(
              "assets/icons/person-outline.svg",
              width: 25,
              height: 25,
            ),
          )
        ]);
  }
}
