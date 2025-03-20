import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_states.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/model/problem_model.dart';
import '../../data/repo/problem_repo.dart';

class ProblemCubit extends Cubit<ProblemState> {
  final ProblemRepository _problemRepository;
  ProblemCubit(this._problemRepository) : super(ProblemInitial());

  static ProblemCubit get(context) => BlocProvider.of(context);

  final TextEditingController descriptionController = TextEditingController();
  String? selectedService;
  String? imagePath;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath = pickedFile.path;
      emit(ProblemImageSelected(imagePath!));
    }
  }

  Future<void> createProblem() async {
    if (imagePath == null) {
      emit(ProblemFailure("يجب إضافة صورة"));
      return;
    }
    if (descriptionController.text.isEmpty) {
      emit(ProblemFailure("يجب إضافة وصف للمشكلة"));
      return;
    }
    if (selectedService == null) {
      emit(ProblemFailure("يجب اختيار نوع الخدمة"));
      return;
    }

    emit(ProblemLoading());
    final problemModel = ProblemModel(
      imageUrl: imagePath!,
      description: descriptionController.text,
      type: selectedService!,
    );

    ApiResult<ProblemModel> response = await _problemRepository.createProblem(problemModel);

    if (response is Success<ProblemModel>) {
      emit(ProblemSuccess(response.data));
    } else if (response is Failure<ProblemModel>) {
      emit(ProblemFailure(response.error.message));
    }
  }
}
