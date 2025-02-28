import 'package:amazon/core/themes/colors.dart';
import 'package:amazon/core/utils/size_calculator.dart';
import 'package:amazon/features/auth/presentation/widgets/auth_footer.dart';
import 'package:amazon/providers/auth_provider.dart';
import 'package:amazon/shared/components/general_text_field.dart';
import 'package:amazon/shared/components/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailOrPhoneEditingController = ref.watch(authOptionProvider);
    final otpController = TextEditingController();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Image(
            image: AssetImage('assets/images/amazon_logo.png'),
            height: MediaQuery.of(context).size.height * 0.04),
      ),
      body: SafeArea(
        
     
          child: Column(
            children: [
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(
              vertical: sizer(true, 8, context),
              horizontal: sizer(true, 18, context)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Verify e-mail address',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(
                            'To verify your e-mail, we\'ve sent a One Time Password(OTP) to email',
                            style: theme.textTheme.bodySmall
                                ?.copyWith(fontSize: 14.6)),
                        Text('(Change)',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.blue,
                            )),
                        SizedBox(height: 20),
                        Text(
                          'Enter security code',
                          style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GeneralTextField(
                          textController: otpController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        CustomTextButton(
                            buttonFunction: () {}, buttonText: 'Verify'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14.0),
                              child: Text(
                                'Resend code',
                                style: theme.textTheme.bodySmall?.copyWith(
                                    color: AppColors.blue, fontSize: 14.6),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              AuthFooter()

            ],
          ),
        ),
      
    );
  }
}
