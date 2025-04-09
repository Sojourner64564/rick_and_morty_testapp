import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_testapp/core/assets/app_colors.dart';
import 'package:rick_and_morty_testapp/core/route/app_router.dart';

@RoutePage()
class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      routes: [
        const MainRoute(),
        FavoriteRoute(),
      ],
      animationDuration: const Duration(milliseconds: 150),
      bottomNavigationBuilder: (BuildContext context, TabsRouter tabRouter) {
        return BottomNavigationBar(
          elevation: 0,
          backgroundColor: AppColors.blueColor,
          onTap: tabRouter.setActiveIndex,
          currentIndex: tabRouter.activeIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.paste_sharp,
                size: 35,
                color: AppColors.greyShade65,
              ),
              activeIcon: Icon(
                Icons.paste_sharp,
                size: 35,
                color: AppColors.orange,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.rectangle_outlined,
                size: 35,
                color: AppColors.greyShade65,
              ),
              activeIcon: Icon(
                Icons.rectangle_outlined,
                size: 35,
                color: AppColors.orange ,
              ),
            ),
          ],
        );
      },
    );
  }
}
