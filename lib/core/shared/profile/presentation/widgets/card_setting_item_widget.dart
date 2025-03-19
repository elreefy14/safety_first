// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardSettingItemWidget extends StatelessWidget {
  const CardSettingItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.image,
    this.color,
  });

  final String title;
  final Function() onTap;
  final String image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        child: ListTile(
          leading: SvgPicture.asset(
            image,
            color: color ?? Theme.of(context).iconTheme.color,
          ),
          title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
