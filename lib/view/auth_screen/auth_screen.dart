import 'package:amazon/components/general_text_field.dart';
import 'package:amazon/constants/enum.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/utils/size_calculator.dart';
import 'package:amazon/view/auth_screen/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthOption _authOption = AuthOption.login;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

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
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                // color: white,
                border: Border.all(color: Colors.grey, width: 1.3),
                borderRadius: BorderRadius.circular(10),
              ),
              // padding: EdgeInsets.symmetric(vertical:  height * 0.002, horizontal: width * 0.009),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _authOption = AuthOption.register;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _authOption.index == 0
                            ? Colors.grey.shade300
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: AuthOption.register,
                                  groupValue: _authOption,
                                  onChanged: (value) {
                                    setState(() {
                                      _authOption = value!;
                                    });
                                  }),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Create account',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: ' New to Amazon?',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                              fontWeight: _authOption.index == 1
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              fontSize:
                                                  sizer(true, 11, context))),
                                ]),
                              )
                            ],
                          ),
                          _authOption.index == 1
                              ? AuthForm(
                                  isNewUser: true,
                                )
                              : Container(
                                  height: 0,
                                ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: _authOption.index == 1
                            ? Colors.grey.shade100
                            : Colors.white,
                        border: Border(top: BorderSide(color: Colors.grey))),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _authOption = AuthOption.login;
                            });
                          },
                          child: Row(
                            children: [
                              Radio(
                                  value: AuthOption.login,
                                  groupValue: _authOption,
                                  onChanged: (value) {
                                    setState(() {
                                      _authOption = value!;
                                    });
                                  }),
                              Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                        text: 'Sign in',
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: ' Already a customer?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight:
                                                    _authOption.index == 0
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                fontSize:
                                                    sizer(true, 11, context))),
                                  ]),
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ),
                        _authOption.index == 0
                            ? AuthForm(isNewUser: false)
                            : Container(
                                height: 0,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
