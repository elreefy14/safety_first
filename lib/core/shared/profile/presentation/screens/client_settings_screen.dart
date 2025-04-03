import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/shared/profile/data/models/profile_response_model.dart';
import 'package:safety_frist/core/shared/profile/presentation/logic/profile_cubit.dart';
import 'package:safety_frist/core/shared/profile/presentation/logic/profile_state.dart';
import 'package:safety_frist/core/shared/profile/presentation/screens/profile_screen.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/card_setting_item_widget.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/logout_bloc_listener_widget.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/notification_playing_widget.dart';

class ClientSettingsScreen extends StatelessWidget {
  const ClientSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            var user = ProfileCubit.get(context).userModel;
            return CardSettingItemWidget(
              title: 'الملف الشخصي',
              image: 'assets/icons/user-pen.svg',
              onTap: () {
                _navigateToProfileScreen(context: context, user: user!);
              },
            );
          },
        ),
        Divider(color: Colors.grey),
        const NotificationPlayingWidget(),

        Divider(color: Colors.grey),
        CardSettingItemWidget(
          title: 'قيمنا الأن',
          image: 'assets/icons/feedback-review.svg',
          onTap: () {},
        ),
        Divider(color: Colors.grey),
        LogoutBlocListenerWidget(),
        Divider(color: Colors.grey),
      ],
    );
  }

  void _navigateToProfileScreen({
    required BuildContext context,
    required ProfileResponseModel user,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                ProfileScreen(user: user),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}
