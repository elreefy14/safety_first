class UpdateProblemRequestBody {
  UpdateProblemRequestBody({required this.description, required this.type});

  final String? description;
  final int? type;

  Map<String, dynamic> toJson() => {"Description": description, "Type": type};
}
