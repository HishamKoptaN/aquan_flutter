import 'package:aquan/Helpers/Storage.dart';
import 'package:aquan/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSetWidget extends StatelessWidget {
  LanguageSetWidget({
    super.key,
    required this.onPress,
    required this.onChanged,
  });

  final String locale = Storage.getString('language') ?? 'en';

  final Function()? onPress;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    final List<Map<String, String>> languages = [
      {"name": t.arabic, "key": "ar"},
      {"name": t.english, "key": "en"},
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 2,
        title: Text(
          t.welcome,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: locale,
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              items: languages
                  .map(
                    (item) => DropdownMenuItem(
                      value: item['key'],
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        item['name']!,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) => onChanged(value),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: size.width,
              child: TextButton(
                onPressed: onPress,
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  t.submit,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Arial",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
