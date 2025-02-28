import 'package:amazon/core/router/app_router.dart';
import 'package:amazon/providers/auth_provider.dart';
import 'package:amazon/shared/components/general_text_field.dart';
import 'package:amazon/shared/components/text_button.dart';
import 'package:amazon/core/themes/colors.dart';
import 'package:amazon/core/utils/size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthForm extends ConsumerStatefulWidget {
  final bool isNewUser;

  const AuthForm({super.key, this.isNewUser = false});

  @override
  ConsumerState<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends ConsumerState<AuthForm> {
  final TextEditingController _emailOrNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailForSignInController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sizer(true, 18, context),
          vertical: sizer(false, 0.25, context)),
      child: Column(
        children: [
          widget.isNewUser ? createUserForm() : signInUserForm(),
          CustomTextButton(
            buttonFunction: () {
              Navigator.pushNamed(context, AppRouter.otpPageRoute);
            },
            buttonText: "Continue",
          ),
          SizedBox(
            height: sizer(false, 8, context),
          ),
          registerBase(isNewUser: widget.isNewUser),
          SizedBox(
            height: sizer(false, 25, context),
          ),
        ],
      ),
    ));
  }

  /// widgets
  Widget buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: sizer(false, 4, context)),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget registerBase({isNewUser}) {
    return RichText(
      text: TextSpan(
        text: isNewUser
            ? 'By Creating account you agree to Amazon\'s'
            : 'By signing-in you agree to Amazon\'s',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: sizer(true, 12, context)),
        children: [
          TextSpan(
              text: ' Conditions of Use & Sale',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: sizer(true, 12, context),
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.blue)),
          TextSpan(
              text: ' Please see our ',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: sizer(true, 12, context))),
          TextSpan(
              text: 'Privacy Notice',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: sizer(true, 12, context),
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.blue)),
          TextSpan(
              text: ', our',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: sizer(true, 12, context),
                  )),
          TextSpan(
              text: ' Cookies Notice',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: sizer(true, 12, context),
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.blue)),
          TextSpan(
              text: ' and our',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: sizer(true, 12, context))),
          TextSpan(
              text: ' interest-Based Ads Notice',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: sizer(true, 12, context),
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.blue)),
        ],
      ),
    );
  }

  Widget createUserForm() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLabel("First and last name"),
          GeneralTextField(
            textController: _nameController,
          ),
          SizedBox(height: sizer(false, 8, context)),
          buildLabel("Mobile number or email"),
          GeneralTextField(
            textController: _emailOrNumberController,
          ),
          SizedBox(
            height: sizer(false, 8, context),
          ),
          buildLabel("Create a password"),
          GeneralTextField(
            obscureText: ref.watch(obscurePasswordProvider),
            textController: _passwordController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: !ref.watch(obscurePasswordProvider),
                activeColor: AppColors.blue,
                onChanged: (value) {
                  ref.read(obscurePasswordProvider.notifier).state = !value!;
                },
              ),
              Text(
                "Show password",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: sizer(true, 12, context)),
              ),
            ],
          ),
        ]);
  }

  Widget signInUserForm() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      buildLabel("Email or phone number"),
      GeneralTextField(
        textController: _emailForSignInController,
      ),
      SizedBox(
        height: sizer(false, 8, context),
      ),
    ]);
  }
}
