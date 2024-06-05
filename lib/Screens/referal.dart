import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/Layouts/app_layout.dart';
import 'package:aquan/Models/user.dart';
import 'package:aquan/User/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReferalScreen extends StatelessWidget {
  const ReferalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return AppLayout(
      route: t.referals,
      body: BlocProvider<UserBloc>(
        create: (context) => UserBloc()..add(GetReferals()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is ReferalsDone) {
              List<User> users = state.users;
              User user = state.user;
              List<Widget> childs = [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        t.referalCode,
                        style: cartHeading,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Share.share(user.refcode!);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                user.refcode!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const FaIcon(
                                FontAwesomeIcons.copy,
                                color: white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Text(
                    t.referals,
                    style: cartHeading,
                  ),
                ),
              ];

              if (state.users.isEmpty) {
                return Column(
                  children: [
                    Column(
                      children: childs,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          t.noReferals,
                          style: cartHeading,
                        ),
                      ),
                    ),
                  ],
                );
              }

              users.every((User user) {
                childs.add(
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.email!,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          user.name!,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                return true;
              });

              return ListView(
                children: childs,
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
