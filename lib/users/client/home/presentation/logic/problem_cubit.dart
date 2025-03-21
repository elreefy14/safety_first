import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_states.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../data/model/problem_model.dart';
import '../../data/repo/problem_repo.dart';

class ProblemCubit extends Cubit<ProblemState> {
  final ProblemRepository _problemRepository;
  ProblemCubit(this._problemRepository) : super(ProblemInitial());

  static ProblemCubit get(context) => BlocProvider.of(context);

  final TextEditingController descriptionController = TextEditingController();
  String? selectedService;
  File? imageFile;
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      emit(ProblemImageSelected(imageFile!.path));
    }
  }

  Future<void> createProblem() async {

    emit(ProblemLoading());

    try {
      final file = await MultipartFile.fromFile(imageFile!.path, filename: "problem.jpg");

      final response = await _problemRepository.createProblem(
        ProblemModel(
          description: descriptionController.text,
          type: 0,
        ),
        file,
      );

      if (response is Success<ProblemModel>) {
        emit(ProblemSuccess(response.data));
        print("🔹 ProblemSuccess Emitted: ${response.data}");

      } else if (response is Failure<ProblemModel>) {
        emit(ProblemFailure("Erorr"));
      }
    } catch (e) {
      emit(ProblemFailure("حدث خطأ غير متوقع"));
    }
  }

}
