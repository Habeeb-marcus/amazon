import 'package:amazon/features/auth/presentation/widgets/auth_login_container.dart';
import 'package:amazon/features/auth/presentation/widgets/auth_register_container.dart';
import 'package:amazon/providers/auth_provider.dart';
import 'package:amazon/shared/components/general_text_field.dart';
import 'package:amazon/core/constants/enum.dart';
import 'package:amazon/core/themes/colors.dart';
import 'package:amazon/core/utils/size_calculator.dart';
import 'package:amazon/features/auth/presentation/widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Image(
            image: AssetImage('assets/images/amazon_logo.png'),
            height: height * 0.04),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text('Welcome', style: Theme.of(context).textTheme.titleMedium),
            ]),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      ref.read(authOptionProvider.notifier).state =
                          AuthOption.register;
                    },
                    child: AuthRegisterContainer(),
                  ),
                  AuthLoginContainer()
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
