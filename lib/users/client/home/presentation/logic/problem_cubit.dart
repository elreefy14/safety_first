import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/client/home/data/model/problem_model.dart';
import 'package:safety_frist/users/client/home/data/repo/problem_repo.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_states.dart';
import 'package:image_picker/image_picker.dart';

class ProblemCubit extends Cubit<ProblemState> {
  final ProblemRepository _problemRepository;
  ProblemCubit(this._problemRepository) : super(ProblemInitial());

  static ProblemCubit get(context) => BlocProvider.of(context);

  final TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  late int serviceType;

  File? problemImageFile;
  ImagePicker picker = ImagePicker();
  Future<void> getProblemImage(ImageSource imageSource) async {
    XFile? pickedFile;
    if (imageSource == ImageSource.gallery) {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else if (imageSource == ImageSource.camera) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }
    if (pickedFile != null) {
      problemImageFile = File(pickedFile.path);
      emit(ImageSelectedSuccessState());
    } else {
      emit(ImageSelectedErrorState());
    }
  }

  Future<void> createProblem() async {
    emit(ProblemLoading());

    var file = await MultipartFile.fromFile(
      problemImageFile!.path,
      filename: "problem.jpg",
    );

    final response = await _problemRepository.createProblem(
      ProblemModel(description: descriptionController.text, type: serviceType),
      file,
    );

    if (response is Success) {
      log('تم إرسال المشكلة إلي مسؤليين الصيانة');
      emit(ProblemSuccess());
    } else if (response is Failure) {
      log('فشل إرسال المشكلة إلي مسؤليين الصيانة');
      emit(ProblemFailure(response.toString()));
    }
  }
}
