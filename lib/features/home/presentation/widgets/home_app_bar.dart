import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_project/core/resources/app_color.dart';
import 'package:front_project/core/resources/app_icons.dart';
import 'package:front_project/core/resources/app_style.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.whiteColor,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppIcons.search),
          Text('Home', style: AppStyle.black12Color20Bold),
          Stack(
            children: [
              SvgPicture.asset(AppIcons.notification),
              Positioned(left:15,child: SvgPicture.asset(AppIcons.redCircle)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
