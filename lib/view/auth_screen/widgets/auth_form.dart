import 'package:amazon/components/general_text_field.dart';
import 'package:amazon/components/text_button.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/utils/size_calculator.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  bool isNewUser;

  AuthForm({Key? key, this.isNewUser = false}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isChecked = false;
  bool passwordVisible = false;



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
 
    return Form(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sizer(true, 18, context),
          vertical: sizer(false, 0.25, context)),
      child: Column(
        
        children:[
          widget.isNewUser ? createUserForm(): signInUserForm(),
          CustomTextButton(buttonFunction: () {}, buttonText: "Continue", ),
          SizedBox(
            height: sizer(false, 8, context),
          ),
          RegisterBase(isNewUser: widget.isNewUser),
          SizedBox(
            height: sizer(false,25, context),
          ),
        ] ,
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


  Widget RegisterBase ({isNewUser}){
    return RichText(text: TextSpan(text: isNewUser ? 'By Creating account you agree to Amazon\'s': 'By signing-in you agree to Amazon\'s', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 12, context)), children: [
            TextSpan(text: ' Conditions of Use & Sale', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 12, context), color: AppColors.blue, decoration: TextDecoration.underline, decorationColor: AppColors.blue)),
            TextSpan(text: ' Please see our ', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 12, context))),
            TextSpan(text: 'Privacy Notice', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 12, context), color: AppColors.blue,  decoration: TextDecoration.underline, decorationColor: AppColors.blue)),
            TextSpan(text: ', our', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 12, context), )),
            TextSpan(text: ' Cookies Notice', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 12, context), color: AppColors.blue,  decoration: TextDecoration.underline, decorationColor: AppColors.blue )),
            TextSpan(text: ' and our', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 12, context) )),
            TextSpan(text: ' interest-Based Ads Notice', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 12, context), color: AppColors.blue,  decoration: TextDecoration.underline, decorationColor: AppColors.blue )),
          ],),
          );
  }

  Widget createUserForm(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
buildLabel("First and last name"),
          GeneralTextField(),
          SizedBox(height: sizer(false, 8, context)),
          buildLabel("Mobile number or email"),
          GeneralTextField(),
          SizedBox(
            height: sizer(false, 8, context),
          ),
          buildLabel("Create a password"),
          GeneralTextField(obscureText: true),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isChecked,
                activeColor: AppColors.blue,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
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


  Widget signInUserForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
buildLabel("Email or phone number"),
          GeneralTextField(),
          SizedBox(
            height: sizer(false, 8, context),
          ),
 
    ]);
}
}
