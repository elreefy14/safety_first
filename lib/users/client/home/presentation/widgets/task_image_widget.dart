import 'dart:io';
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
      backgroundColor: Colors.transparent, // يجعل الخلفية شفافة
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          verticalSpace(12),
          ListTile(
            leading: Icon(Icons.photo_library, color: Colors.blue),
            title: Text('اختر من المعرض', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () async {
              final pickedFile = await picker.pickImage(source: ImageSource.gallery);
              Navigator.pop(context, pickedFile);
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
          ListTile(
            leading: Icon(Icons.camera_alt, color: Colors.green),
            title: Text('التقط صورة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () async {
              final pickedFile = await picker.pickImage(source: ImageSource.camera);
              Navigator.pop(context, pickedFile);
            },
          ),
        ],
      ),
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
              ? DecorationImage(image: FileImage(File(_imagePath!)), fit: BoxFit.cover)
              : null,
        ),
        child: _imagePath == null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate_outlined, size: 50, color: Colors.blueGrey),
            verticalSpace(8),
            Text("اضغط لإضافة صورة", style: TextStyle(fontSize: 16.sp, color: Colors.blueGrey)),
          ],
        )
            : null,
      ),
    );
  }
}
