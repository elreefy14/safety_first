import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_response_model.dart';
import 'package:safety_frist/users/client/home/data/model/notification_topic_request_body.dart';
import 'package:safety_frist/users/client/home/data/model/problem_model.dart';
import 'package:safety_frist/users/client/home/data/repo/problem_repo.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_states.dart';
import 'package:image_picker/image_picker.dart';

class ProblemCubit extends Cubit<ProblemState> {
  final ProblemRepository _problemRepository;
  ProblemCubit(this._problemRepository) : super(ProblemInitial());

  static ProblemCubit get(context) => BlocProvider.of(context);

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController problemTypeIdController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

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
      ProblemModel(
        description: descriptionController.text,
        problemTypeId: problemTypeIdController.text,
      ),
      file,
    );

    if (response is Success) {
      // sendNotificationToEngineers();
      emit(ProblemSuccess());
    } else if (response is Failure) {
      emit(ProblemFailure(response.toString()));
    }
  }

  List<ProblemTypeResponseModel> allProblemTypesList = [];

  Future<void> getAllProblemTypes() async {
    emit(GetAllProblemTypesLoadingState());
    final response = await _problemRepository.getAllProblemTypes();

    if (response is Success<List<ProblemTypeResponseModel>>) {
      allProblemTypesList = response.data;
      emit(GetAllProblemTypesSuccessState());
    } else if (response is Failure) {
      emit(GetAllProblemTypesErrorState(error: response.toString()));
    }
  }

  Future<void> sendNotificationToEngineers() async {
    final response = await _problemRepository.sendNotificationToAdmins(
      notificationBody: NotificationBody(
        title: 'مشكلة جديدة',
        body: 'هناك عميل قام بإرسال مشكلة جديدة ويطلب تعيين فني متخصص لحلها',
      ),
    );

    if (response is Success) {
      emit(SendNotificationToEngineerSuccess());
    } else if (response is Failure) {
      emit(SendNotificationToEngineerFailure(response.toString()));
    }
  }
}
