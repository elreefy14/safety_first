import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/cache/cache_helper_keys.dart';
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/profile/presentation/logic/profile_cubit.dart';
import 'package:safety_frist/core/shared/profile/presentation/logic/profile_state.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/card_setting_item_widget.dart';

class LogoutBlocListenerWidget extends StatelessWidget {
  const LogoutBlocListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // FirebaseMessaging messaging = FirebaseMessaging.instance;

    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutUserSuccessState) {
          context.pushReplacement(Routes.userTypeScreen);
          showToast(msg: 'تم تسجيل الخروج بنجاح', color: Colors.green);
          // messaging.unsubscribeFromTopic('Engineers');

          CacheHelper.saveData(key: CacheHelperKeys.onBoarding, value: false);
        }
      },
      child: CardSettingItemWidget(
        title: 'تسجيل الخروج',
        image: 'assets/icons/power_settings_new.svg',
        color: Colors.red,
        onTap: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.question,
            customHeader: SvgPicture.asset(
              'assets/icons/power_settings_new.svg',
              height: 50,
            ),
            animType: AnimType.rightSlide,
            title: 'تسجيل الخروج',
            desc: 'هل تريد تسجيل الخروج من التطبيق',
            reverseBtnOrder: true,
            btnCancelText: 'لا',
            btnOkText: 'نعم',
            buttonsTextStyle: TextStyle(fontSize: 20, color: Colors.white),
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              ProfileCubit.get(context).logoutUser();
            },
          ).show();
        },
      ),
    );
  }
}
