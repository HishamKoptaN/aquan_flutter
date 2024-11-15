import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../core/helpers/shared_pref_helper.dart';

class SettingsTabWidget extends StatelessWidget {
  const SettingsTabWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final Function onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: .5,
              spreadRadius: .5,
            )
          ],
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                  child: FaIcon(
                    icon,
                    color: Colors.black.withOpacity(0.6),
                    size: 16,
                  ),
                ),
                const Gap(10),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            FaIcon(
              SharedPrefHelper.getString(key: 'language') == 'ar'
                  ? FontAwesomeIcons.angleRight
                  : FontAwesomeIcons.angleLeft,
              color: Colors.black.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}
