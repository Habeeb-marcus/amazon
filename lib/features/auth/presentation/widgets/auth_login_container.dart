import 'package:amazon/core/constants/enum.dart';
import 'package:amazon/core/utils/size_calculator.dart';
import 'package:amazon/features/auth/presentation/widgets/auth_form.dart';
import 'package:amazon/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthLoginContainer extends ConsumerWidget {
  const AuthLoginContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authOption = ref.watch(authOptionProvider);

    return Container(
      decoration: BoxDecoration(
        color: authOption.index == 1 ? Colors.grey.shade300 : Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey),
          left: BorderSide(color: Colors.grey),
          right: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(7), bottomRight: Radius.circular(7)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              ref.read(authOptionProvider.notifier).state = AuthOption.login;
            },
            child: Row(
              children: [
                Radio(
                    value: AuthOption.login,
                    groupValue: authOption,
                    onChanged: (value) {
                      ref.read(authOptionProvider.notifier).state = value!;
                    }),
                Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'Sign in',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: ' Already a customer?',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontWeight: authOption.index == 0
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: sizer(true, 11, context))),
                    ]),
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          authOption.index == 0
              ? AuthForm(isNewUser: false)
              : Container(
                  height: 0,
                ),
        ],
      ),
    );
  }
}
