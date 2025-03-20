class ProblemModel {
  final String imageUrl;
  final String description;
  final String type;

  ProblemModel({
    required this.imageUrl,
    required this.description,
    required this.type,
  });


  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'description': description,
      'type': type,
    };
  }

  factory ProblemModel.fromJson(Map<String, dynamic> json) {
    return ProblemModel(
      imageUrl: json['imageUrl'],
      description: json['description'],
      type: json['type'],
    );
  }
}
