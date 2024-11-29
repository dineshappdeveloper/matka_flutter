class SignupModel {
  String? message;
  String? code;
  String? status;

  SignupModel({this.message, this.code, this.status});

  SignupModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['status'] = status;
    return data;
  }
}
