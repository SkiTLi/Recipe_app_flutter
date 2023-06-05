import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void _navigate(int index) {
    DefaultTabController.of(context).index = index;
    // setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    DefaultTabController.of(context).addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.scaffold,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarIcon(
              isActive: DefaultTabController.of(context).index == 0,
              notActiveIcon: SvgPicture.asset(
                colorFilter:
                    ColorFilter.mode(ThemeColors.primary, BlendMode.modulate),
                'assets/images/home.svg',
              ),
              activeIcon: SvgPicture.asset(
                colorFilter:
                    ColorFilter.mode(ThemeColors.primary, BlendMode.modulate),
                'assets/images/homeActive.svg',
              ),
              onTap: () => _navigate(0)),
          _NavBarIcon(
            isActive: DefaultTabController.of(context).index == 1,
            notActiveIcon: SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                  ThemeColors.primaryAdditional, BlendMode.srcIn),
              'assets/images/cooking.svg',
            ),
            activeIcon: SvgPicture.asset(
              colorFilter:
                  ColorFilter.mode(ThemeColors.primary, BlendMode.modulate),
              'assets/images/hatActive.svg',
            ),
            onTap: () => _navigate(1),
          ),
          SizedBox(),
          _NavBarIcon(
              isActive: DefaultTabController.of(context).index == 2,
              notActiveIcon: SvgPicture.asset(
                colorFilter: ColorFilter.mode(
                    ThemeColors.primaryAdditional, BlendMode.srcIn),
                'assets/images/flag.svg',
              ),
              activeIcon: SvgPicture.asset(
                colorFilter:
                    ColorFilter.mode(ThemeColors.primary, BlendMode.modulate),
                'assets/images/flagActive.svg',
                fit: BoxFit.contain,
              ),
              onTap: () => _navigate(2)),
          _NavBarIcon(
              isActive: DefaultTabController.of(context).index == 3,
              notActiveIcon: SvgPicture.asset(
                colorFilter:
                    ColorFilter.mode(ThemeColors.primary, BlendMode.modulate),
                'assets/images/settings.svg',
              ),
              activeIcon: SvgPicture.asset(
                colorFilter:
                    ColorFilter.mode(ThemeColors.primary, BlendMode.xor),
                'assets/images/settings.svg',
              ),
              onTap: () => _navigate(3)),
        ],
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  final bool isActive;
  final Widget notActiveIcon;
  final Widget activeIcon;
  final VoidCallback onTap;

  const _NavBarIcon({
    Key? key,
    required this.isActive,
    required this.notActiveIcon,
    required this.activeIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, //for stable click
      child: Column(
        children: [
          SizedBox(
              width: 22,
              height: 22,
              child: isActive ? activeIcon : notActiveIcon),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
