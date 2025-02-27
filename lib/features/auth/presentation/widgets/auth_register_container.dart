import 'package:amazon/core/constants/enum.dart';
import 'package:amazon/core/utils/size_calculator.dart';
import 'package:amazon/features/auth/presentation/widgets/auth_form.dart';
import 'package:amazon/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRegisterContainer extends ConsumerWidget {
  const AuthRegisterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authOption = ref.watch(authOptionProvider);
    return Container(
      decoration: BoxDecoration(
        color: authOption.index == 0 ? Colors.grey.shade300 : Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey),
          left: BorderSide(color: Colors.grey),
          right: BorderSide(color: Colors.grey),
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7), topRight: Radius.circular(7)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Radio(
                  value: AuthOption.register,
                  groupValue: authOption,
                  onChanged: (value) {
                    ref.read(authOptionProvider.notifier).state = value!;
                  }),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: 'Create account',
                      style: theme.textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: ' New to Amazon?',
                      style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: authOption.index == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: sizer(true, 11, context))),
                ]),
              )
            ],
          ),
          authOption.index == 1
              ? AuthForm(
                  isNewUser: true,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
