class StudentModel {
  String? name;
  String? age;
  String? classs;
  String? subject;

  StudentModel({this.name, this.age, this.classs, this.subject});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      name: json['name'] as String?,
      age: json['age'] as String?,
      classs: json['class'] as String?,
      subject: json['subject'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subject': subject,
      'age': age,
      'class': classs,
    };
  }
}
