import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';

class TaskImageWidget extends StatefulWidget {
  final Function(String imagePath)? onImageSelected;

  const TaskImageWidget({super.key, this.onImageSelected});

  @override
  State<TaskImageWidget> createState() => _TaskImageWidgetState();
}

class _TaskImageWidgetState extends State<TaskImageWidget> {
  String? _imagePath;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (context) => _buildImagePickerOptions(picker),
    );

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
      if (widget.onImageSelected != null) {
        widget.onImageSelected!(_imagePath!);
      }
    }
  }
  Widget _buildImagePickerOptions(ImagePicker picker) {
    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.photo_library),
          title: const Text('اختر من المعرض'),
          onTap: () async {
            final pickedFile = await picker.pickImage(source: ImageSource.gallery);
            Navigator.pop(context, pickedFile);
          },
        ),
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('التقط صورة'),
          onTap: () async {
            final pickedFile = await picker.pickImage(source: ImageSource.camera);
            Navigator.pop(context, pickedFile);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueGrey, width: 1.5.w),
          image: _imagePath != null
              ? DecorationImage(image: AssetImage(_imagePath!), fit: BoxFit.cover)
              : null,
        ),
        child: _imagePath == null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_photo_alternate_outlined,
              size: 50,
              color: Colors.blueGrey,
            ),
            verticalSpace(8),
            Text(
              "اضغط لإضافة صورة",
              style: TextStyle(fontSize: 16.sp, color: Colors.blueGrey),
            ),
          ],
        )
            : null,
      ),
    );
  }
}