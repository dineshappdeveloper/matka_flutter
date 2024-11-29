class ProfileModel {
  String? message;
  String? code;
  String? status;
  Data? data;

  ProfileModel({this.message, this.code, this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  String? mobile;
  String? email;
  String? bankName;
  String? accountHolderName;
  String? ifscCode;
  String? branchAddress;
  String? bankAccountNo;
  String? paytmMobileNo;
  String? phonepeMobileNo;
  String? gpayMobileNo;
  String? pendingNoti;

  Data(
      {this.username,
        this.mobile,
        this.email,
        this.bankName,
        this.accountHolderName,
        this.ifscCode,
        this.branchAddress,
        this.bankAccountNo,
        this.paytmMobileNo,
        this.phonepeMobileNo,
        this.gpayMobileNo,
        this.pendingNoti});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    mobile = json['mobile'];
    email = json['email'];
    bankName = json['bank_name'];
    accountHolderName = json['account_holder_name'];
    ifscCode = json['ifsc_code'];
    branchAddress = json['branch_address'];
    bankAccountNo = json['bank_account_no'];
    paytmMobileNo = json['paytm_mobile_no'];
    phonepeMobileNo = json['phonepe_mobile_no'];
    gpayMobileNo = json['gpay_mobile_no'];
    pendingNoti = json['pending_noti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['mobile'] = mobile;
    data['email'] = email;
    data['bank_name'] = bankName;
    data['account_holder_name'] = accountHolderName;
    data['ifsc_code'] = ifscCode;
    data['branch_address'] = branchAddress;
    data['bank_account_no'] = bankAccountNo;
    data['paytm_mobile_no'] = paytmMobileNo;
    data['phonepe_mobile_no'] = phonepeMobileNo;
    data['gpay_mobile_no'] = gpayMobileNo;
    data['pending_noti'] = pendingNoti;
    return data;
  }
}
