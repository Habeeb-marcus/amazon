import 'package:amazon/core/themes/colors.dart';
import 'package:amazon/core/utils/size_calculator.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
            SizedBox(height: 10),
          Divider(
            color: Colors.grey,
            thickness: 1.7,
          ),
          SizedBox(height: 10),
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text('Conditions of Use', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 9.3, context),color: AppColors.blue)),
              SizedBox(width: sizer(true, 18, context)),
              Text('Privacy Notice', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 9.3, context), color: AppColors.blue)),
              SizedBox(width: sizer(true, 18, context)),
              Text('Help', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 9.3, context), color: AppColors.blue)),
              SizedBox(width: sizer(true, 18, context)),
              Text('Cookies Notice', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 9.3, context), color: AppColors.blue)),
              SizedBox(width: sizer(true, 18, context)),
              Text('Interest-Based Ads', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 9.3, context), color: AppColors.blue)),
                ],
              ))
              
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('© 1996-2021, Amazon.com, Inc. or its affiliates', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: sizer(true, 9.3, context), fontWeight: FontWeight.normal)),
            ],
          ),
        ],  
      ),
    );
  }
}