// ignore_for_file: deprecated_member_use

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safety_frist/core/shared/profile/presentation/screens/update_service_type_screen.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_response_model.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problem%20type/problem_type_cubit.dart';

class ServiceTypeListViewItem extends StatelessWidget {
  const ServiceTypeListViewItem({super.key, required this.typeModel});

  final ProblemTypeResponseModel typeModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.question,
          customHeader: SvgPicture.asset(
            'assets/icons/info-triangle.svg',
            height: 50,
            color: Colors.yellow[800],
          ),
          animType: AnimType.rightSlide,
          title: 'إدارة الخدمة',
          desc: 'هل تريد تحديث اسم الخدمة ام حذفها ؟',
          reverseBtnOrder: true,
          btnCancelText: 'حذف',
          btnOkText: 'تحديث',
          buttonsTextStyle: TextStyle(fontSize: 20, color: Colors.white),
          btnCancelOnPress: () {
            ProblemTypeCubit.get(context).deleteProblemType(id: typeModel.id);
          },
          btnOkOnPress: () {
            _navigateToUpdateServiceTypeScreen(
              context: context,
              typeModel: typeModel,
            );
          },
        ).show();
      },
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: Icon(Icons.store, size: 40),
          iconColor: Colors.blue,
          style: ListTileStyle.list,
          title: Text(
            typeModel.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }

  void _navigateToUpdateServiceTypeScreen({
    required BuildContext context,
    required ProblemTypeResponseModel typeModel,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                UpdateServiceTypeScreen(typeModel: typeModel),
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
