import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:aquan/Helpers/styles.dart';

import 'package:aquan/Layouts/app_layout.dart';
import 'package:aquan/Models/user.dart';
import 'package:aquan/Screens/deposit.dart';
import 'package:aquan/Screens/transactions.dart';
import 'package:aquan/Screens/withdraw.dart';
import 'package:aquan/User/bloc/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:gap/gap.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool copy = false;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;

    return AppLayout(
      route: t.home,
      body: BlocProvider<UserBloc>(
        create: (context) => UserBloc()..add(Dashboard()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is DashboardLoaded) {
              User user = state.user;

              List<Widget> trList = [];
              List<Widget> currList = [];

              state.transactions.every((tr) {
                trList.add(
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                image: DecorationImage(
                                  image: NetworkImage(state.user.image!),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                              ),
                            ),
                            const Gap(5),
                            Column(
                              children: [
                                Text(
                                  t.transferFromBankToBank,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  tr.createdDate!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          tr.amountFormated!,
                          style: cartHeading,
                        )
                      ],
                    ),
                  ),
                );

                return true;
              });

              state.currencies.every((curr) {
                if (curr.name?.toLowerCase() == "bankak" ||
                    curr.name?.toLowerCase() == "بنكك") {
                  return true;
                }

                // Map<String, dynamic> rate =
                //     curr.rates?[state.user.planId.toString()];

                currList.add(
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  curr.name!,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  "${t.lastUpdate} ${curr.updatedDate!}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  t.sell,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  curr.sellingRate.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Column(
                              children: [
                                Text(
                                  t.buy,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  curr.buyingRate.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );

                return true;
              });

              return ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  Container(
                    width: size.width,
                    height: size.height * .23,
                    decoration: BoxDecoration(
                      color: third,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 15,
                          top: -90,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              'AQUAN',
                              style: TextStyle(
                                color: white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width,
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            textAlign: Storage.getString('language') == 'ar'
                                ? TextAlign.start
                                : TextAlign.end,
                            user.planId == 1
                                ? t.levelOne
                                : (user.planId == 2
                                    ? t.levelTwo
                                    : t.levelThree),
                            style: const TextStyle(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(.0),
                                child: Text(
                                  user.balanceFormated!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: black,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  t.accountNumber,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  user.id.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      copy = true;
                                    });
                                    Clipboard.setData(
                                      ClipboardData(text: user.id.toString()),
                                    );

                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      setState(() {
                                        copy = false;
                                      });
                                    });
                                  },
                                  icon: Icon(
                                    copy
                                        ? FontAwesomeIcons.check
                                        : FontAwesomeIcons.copy,
                                    color: black,
                                    size: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width / 2 - 20,
                        child: TextButton(
                          onPressed: () {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DepositScreen(
                                    currencies: state.currencies,
                                    user: state.user,
                                  ),
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                FontAwesomeIcons.circleChevronUp,
                                color: black,
                                size: 20,
                              ),
                              Text(
                                t.deposit,
                                style: const TextStyle(
                                  color: black,
                                  fontSize: 16,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 2 - 20,
                        child: TextButton(
                          onPressed: () {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => WithdrawScreen(
                                    currencies: state.currencies,
                                    user: state.user,
                                  ),
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                FontAwesomeIcons.circleDollarToSlot,
                                color: black,
                                size: 20,
                              ),
                              Text(
                                t.withdraw,
                                style: const TextStyle(
                                  color: black,
                                  fontSize: 16,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: black, width: 4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          t.last2Transactions,
                          style: const TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionsScreen(),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            t.showAll,
                            style: const TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(20),
                  Column(
                    children: trList.isEmpty
                        ? [
                            Text(
                              t.noTransactions,
                              style:
                                  const TextStyle(color: black, fontSize: 18),
                            )
                          ]
                        : trList,
                  ),
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: black, width: 4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          t.changeRate,
                          style: const TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(20),
                  Column(
                    children: currList.isEmpty
                        ? [
                            Text(
                              t.noCurrencies,
                              style:
                                  const TextStyle(color: black, fontSize: 18),
                            )
                          ]
                        : currList,
                  ),
                ],
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
    );
  }
}
