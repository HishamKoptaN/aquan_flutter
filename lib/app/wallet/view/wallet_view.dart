import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/Auth/model/user.dart';
import 'package:aquan/app/Auth/User/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:motion_toast/resources/colors.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          t.myAccounts,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocProvider<UserBloc>(
          create: (context) => UserBloc()
            ..add(
              GetProfileUser(),
            ),
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is ProfileDone) {
                if (state.updated) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        backgroundColor: successColor,
                        duration: const Duration(seconds: 3),
                        content: Text(
                          t.accountsUpdated,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                }
              }
              if (state is UserError) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: danger,
                      duration: const Duration(seconds: 3),
                      content: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
              }
            },
            builder: (context, state) {
              if (state is ProfileDone) {
                List<Widget> childs = [];
                List<TextEditingController> controllers = [];
                final List<String> currencies = [];

                state.user.accountInfo?.every(
                  (a) {
                    TextEditingController controller =
                        TextEditingController(text: a.value);
                    currencies.add(a.currency!);

                    controllers.add(controller);
                    childs.add(
                      Text(
                        a.currency!,
                        style: const TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );

                    childs.add(const Gap(10));
                    childs.add(
                      SizedBox(
                        width: size.width,
                        child: TextFormField(
                          controller: controller,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return t.required;
                          //   }

                          //   return null;
                          // },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    );
                    childs.add(const Gap(20));
                    return true;
                  },
                );

                childs.add(
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: size.width,
                    child: TextButton(
                      onPressed: () {
                        final List<dynamic> accountInfo = [];
                        for (var i = 0; i < controllers.length; i++) {
                          accountInfo.add({
                            "currency": currencies[i],
                            "value": controllers[i].text,
                          });
                        }

                        context.read<UserBloc>().add(
                              ChangeAccountInfo(
                                accountInfo: accountInfo
                                    .map((e) => AccountInfo.fromJson(e))
                                    .toList(),
                              ),
                            );
                      },
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        t.submit,
                        style: const TextStyle(
                          color: black,
                          fontFamily: "Arial",
                        ),
                      ),
                    ),
                  ),
                );
                return ListView(
                  children: childs,
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
