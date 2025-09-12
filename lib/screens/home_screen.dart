import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/display_white_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                // height: 300,
                // width: 200,
                // color: Theme.of(context).colorScheme.primary,
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: 'Aug 7, 2025',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    // const Gap(20),
                    DisplayWhiteText(
                      text: 'My Todo List',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Column(
                  children: [
                    Container(
                      width: deviceSize.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colors.primaryContainer,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (ctx, index) {
                          return Text('Home');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// all dependencies
/*
equatable: https://pub.dev/packages/equatable
flex_color_scheme: https://pub.dev/packages/flex_color_scheme/install
flutter_riverpod: https://pub.dev/packages/flutter_riverpod/install
font_awesome: https://pub.dev/packages/font_awesome_flutter/install
gap: https://pub.dev/packages/gap/install
go_router: https://pub.dev/packages/go_router/install
google_fonts: https://pub.dev/packages/google_fonts/install
intl: http://pub.dev/packages/intl/install
path: https://pub.dev/packages/path/install
sqflite: https://pub.dev/packages/sqflite/install
 */
