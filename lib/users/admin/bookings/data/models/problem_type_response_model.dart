class ProblemTypeResponseModel {
  ProblemTypeResponseModel({required this.id, required this.name});

  final String id;
  final String name;

  factory ProblemTypeResponseModel.fromJson(Map<String, dynamic> json) {
    return ProblemTypeResponseModel(id: json["Id"], name: json["Name"]);
  }
}
