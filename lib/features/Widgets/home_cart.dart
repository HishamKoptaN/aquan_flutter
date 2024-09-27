import 'package:aquan/core/database/api/routes.dart';
import 'package:aquan/core/Helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/utils/app_colors.dart';

class CartHome extends StatelessWidget {
  const CartHome(
      {super.key,
      required this.title,
      required this.body,
      required this.image});

  final String title;
  final String body;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: cartHeading,
              ),
              Image.network(
                domain + image,
                width: 60,
                color: Colors.amber,
              )
            ],
          ),
          const Gap(20),
          Text(
            body,
          ),
        ],
      ),
    );
  }
}
