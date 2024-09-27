import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/core/Helpers/storage.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:aquan/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bloc/language_bloc.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String locale = Storage.getString('language') ?? 'en';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;

    final List<Map<String, String>> languages = [
      {"name": t.arabic, "key": "ar"},
      {"name": t.english, "key": "en"},
    ];

    return AppLayout(
      route: t.changeLanguage,
      showAppBar: false,
      body: BlocProvider<LanguageBloc>(
        create: (context) => LanguageBloc(),
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return Padding(
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
                    onChanged: (value) => {setState(() => locale = value!)},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: size.width,
                    child: TextButton(
                      onPressed: () async {
                        Storage.setString(
                          'language',
                          locale,
                        );
                        RestartWidget.restartApp(context);
                        MotionToast.success(
                          description: Text(
                            t.languageChanged,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ).show(context);
                      },
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        t.change,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
