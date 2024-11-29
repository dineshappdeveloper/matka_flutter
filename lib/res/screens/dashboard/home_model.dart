class AppDetailsModel {
  String? message;
  String? code;
  String? status;
  Data? data;

  AppDetailsModel({this.message, this.code, this.status, this.data});

  AppDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? bannerMarquee;
  ContactDetails? contactDetails;
  BannerImage? bannerImage;
  List<Banner>? banner;
  ProjectStatus? projectStatus;
  String? withdrawOpenTime;
  String? withdrawCloseTime;
  String? addFundNotice;
  String? withdrawNotice;
  String? appNotice;
  String? appLink;
  String? appStatus;
  String? adminMessage;
  String? welcomeMessage;
  String? shareMessage;
  String? playLink;

  Data(
      {this.bannerMarquee,
        this.contactDetails,
        this.bannerImage,
        this.banner,
        this.projectStatus,
        this.withdrawOpenTime,
        this.withdrawCloseTime,
        this.addFundNotice,
        this.withdrawNotice,
        this.appNotice,
        this.appLink,
        this.appStatus,
        this.adminMessage,
        this.welcomeMessage,
        this.shareMessage,
        this.playLink});

  Data.fromJson(Map<String, dynamic> json) {
    bannerMarquee = json['banner_marquee'];
    contactDetails = json['contact_details'] != null
        ? ContactDetails.fromJson(json['contact_details'])
        : null;
    bannerImage = json['banner_image'] != null
        ? BannerImage.fromJson(json['banner_image'])
        : null;
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(Banner.fromJson(v));
      });
    }
    projectStatus = json['project_status'] != null
        ? ProjectStatus.fromJson(json['project_status'])
        : null;
    withdrawOpenTime = json['withdraw_open_time'];
    withdrawCloseTime = json['withdraw_close_time'];
    addFundNotice = json['add_fund_notice'];
    withdrawNotice = json['withdraw_notice'];
    appNotice = json['app_notice'];
    appLink = json['app_link'];
    appStatus = json['app_status'];
    adminMessage = json['admin_message'];
    welcomeMessage = json['welcome_message'];
    shareMessage = json['share_message'];
    playLink = json['play_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_marquee'] = bannerMarquee;
    if (contactDetails != null) {
      data['contact_details'] = contactDetails!.toJson();
    }
    if (bannerImage != null) {
      data['banner_image'] = bannerImage!.toJson();
    }
    if (banner != null) {
      data['banner'] = banner!.map((v) => v.toJson()).toList();
    }
    if (projectStatus != null) {
      data['project_status'] = projectStatus!.toJson();
    }
    data['withdraw_open_time'] = withdrawOpenTime;
    data['withdraw_close_time'] = withdrawCloseTime;
    data['add_fund_notice'] = addFundNotice;
    data['withdraw_notice'] = withdrawNotice;
    data['app_notice'] = appNotice;
    data['app_link'] = appLink;
    data['app_status'] = appStatus;
    data['admin_message'] = adminMessage;
    data['welcome_message'] = welcomeMessage;
    data['share_message'] = shareMessage;
    data['play_link'] = playLink;
    return data;
  }
}

class ContactDetails {
  String? whatsappNo;
  String? mobileNo1;
  String? mobileNo2;
  String? email1;
  String? telegramNo;
  String? withdrawProof;

  ContactDetails(
      {this.whatsappNo,
        this.mobileNo1,
        this.mobileNo2,
        this.email1,
        this.telegramNo,
        this.withdrawProof});

  ContactDetails.fromJson(Map<String, dynamic> json) {
    whatsappNo = json['whatsapp_no'];
    mobileNo1 = json['mobile_no_1'];
    mobileNo2 = json['mobile_no_2'];
    email1 = json['email_1'];
    telegramNo = json['telegram_no'];
    withdrawProof = json['withdraw_proof'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['whatsapp_no'] = whatsappNo;
    data['mobile_no_1'] = mobileNo1;
    data['mobile_no_2'] = mobileNo2;
    data['email_1'] = email1;
    data['telegram_no'] = telegramNo;
    data['withdraw_proof'] = withdrawProof;
    return data;
  }
}

class BannerImage {
  String? bannerImg1;
  String? bannerImg2;
  String? bannerImg3;

  BannerImage({this.bannerImg1, this.bannerImg2, this.bannerImg3});

  BannerImage.fromJson(Map<String, dynamic> json) {
    bannerImg1 = json['banner_img_1'];
    bannerImg2 = json['banner_img_2'];
    bannerImg3 = json['banner_img_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_img_1'] = bannerImg1;
    data['banner_img_2'] = bannerImg2;
    data['banner_img_3'] = bannerImg3;
    return data;
  }
}

class Banner {
  String? image;

  Banner({this.image});

  Banner.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}

class ProjectStatus {
  String? mainMarket;
  String? starlineMarket;
  String? galidesawarMarket;
  String? bannerStatus;
  String? marqueeStatus;

  ProjectStatus(
      {this.mainMarket,
        this.starlineMarket,
        this.galidesawarMarket,
        this.bannerStatus,
        this.marqueeStatus});

  ProjectStatus.fromJson(Map<String, dynamic> json) {
    mainMarket = json['main_market'];
    starlineMarket = json['starline_market'];
    galidesawarMarket = json['galidesawar_market'];
    bannerStatus = json['banner_status'];
    marqueeStatus = json['marquee_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['main_market'] = mainMarket;
    data['starline_market'] = starlineMarket;
    data['galidesawar_market'] = galidesawarMarket;
    data['banner_status'] = bannerStatus;
    data['marquee_status'] = marqueeStatus;
    return data;
  }
}
