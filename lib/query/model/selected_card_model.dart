class SelectedCardParams {
  final String? cardImageId;

  SelectedCardParams({this.cardImageId});

  SelectedCardParams.fromJson(Map<String, dynamic> json)
      : cardImageId = json['cardImageId'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardImageId'] = this.cardImageId;
    return data;
  }
}

class SelectedCardResponse {
  final bool? success;
  final bool? isAuth;
  final String? message;
  final List<Result>? result;

  SelectedCardResponse({this.success, this.isAuth, this.message, this.result});

  SelectedCardResponse.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        isAuth = json['isAuth'],
        message = json['message'],
        result = json['result'] != null
            ? List<Result>.from(json['result'].map((v) => Result.fromJson(v)))
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['isAuth'] = this.isAuth;
    data['message'] = this.message;
    data['result'] = this.result?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Result {
  final List<CardDesignVariations>? cardDesignVariations;
  final String? cardImageId;
  final String? cardShortBgURL;
  final String? cardLongBgURL;
  final String? cardImageURL;
  final String? cardImageURL2;
  final String? cardImageURL3;
  final String? cardImageURL4;
  final String? categoryId;
  final String? cardName;
  final String? errorTextColor;
  final String? cardDesignType;
  final CustomImageCardDesignInfo? customImageCardDesignInfo;
  final ProfileDesignInfo? profileDesignInfo;
  final DpStyling? dpStyling;
  final UserNameStyling? userNameStyling;
  final TitleStyling? titleStyling;
  final TitleStyling? locationStyling;
  final CompanyStyling? companyStyling;
  final SkillsStyling? skillsStyling;
  final SkillsStyling? hobbiesStyling;
  final SkillsStyling? subjectsStyling;
  final TitleStyling? phoneStyling;
  final TitleStyling? emailStyling;
  final TitleStyling? addressStyling;
  final ActionIcons? actionIcons;
  final bool? favouriteStatus;

  Result({
    this.cardDesignVariations,
    this.cardImageId,
    this.cardShortBgURL,
    this.cardLongBgURL,
    this.cardImageURL,
    this.cardImageURL2,
    this.cardImageURL3,
    this.cardImageURL4,
    this.categoryId,
    this.cardName,
    this.errorTextColor,
    this.cardDesignType,
    this.customImageCardDesignInfo,
    this.profileDesignInfo,
    this.dpStyling,
    this.userNameStyling,
    this.titleStyling,
    this.locationStyling,
    this.companyStyling,
    this.skillsStyling,
    this.hobbiesStyling,
    this.subjectsStyling,
    this.phoneStyling,
    this.emailStyling,
    this.addressStyling,
    this.actionIcons,
    this.favouriteStatus,
  });

  Result.fromJson(Map<String, dynamic> json)
      : cardDesignVariations = json['cardDesignVariations'] != null
            ? List<CardDesignVariations>.from(
                json['cardDesignVariations'].map(
                  (v) => CardDesignVariations.fromJson(v),
                ),
              )
            : null,
        cardImageId = json['cardImageId'],
        cardShortBgURL = json['cardShortBgURL'],
        cardLongBgURL = json['cardLongBgURL'],
        cardImageURL = json['cardImageURL'],
        cardImageURL2 = json['cardImageURL2'],
        cardImageURL3 = json['cardImageURL3'],
        cardImageURL4 = json['cardImageURL4'],
        categoryId = json['categoryId'],
        cardName = json['cardName'],
        errorTextColor = json['errorTextColor'],
        cardDesignType = json['cardDesignType'],
        customImageCardDesignInfo = json['customImageCardDesignInfo'] != null
            ? CustomImageCardDesignInfo.fromJson(
                json['customImageCardDesignInfo'],
              )
            : null,
        profileDesignInfo = json['profileDesignInfo'] != null
            ? ProfileDesignInfo.fromJson(json['profileDesignInfo'])
            : null,
        dpStyling = json['dpStyling'] != null
            ? DpStyling.fromJson(json['dpStyling'])
            : null,
        userNameStyling = json['userNameStyling'] != null
            ? UserNameStyling.fromJson(json['userNameStyling'])
            : null,
        titleStyling = json['titleStyling'] != null
            ? TitleStyling.fromJson(json['titleStyling'])
            : null,
        locationStyling = json['locationStyling'] != null
            ? TitleStyling.fromJson(json['locationStyling'])
            : null,
        companyStyling = json['companyStyling'] != null
            ? CompanyStyling.fromJson(json['companyStyling'])
            : null,
        skillsStyling = json['skillsStyling'] != null
            ? SkillsStyling.fromJson(json['skillsStyling'])
            : null,
        hobbiesStyling = json['hobbiesStyling'] != null
            ? SkillsStyling.fromJson(json['hobbiesStyling'])
            : null,
        subjectsStyling = json['subjectsStyling'] != null
            ? SkillsStyling.fromJson(json['subjectsStyling'])
            : null,
        phoneStyling = json['phoneStyling'] != null
            ? TitleStyling.fromJson(json['phoneStyling'])
            : null,
        emailStyling = json['emailStyling'] != null
            ? TitleStyling.fromJson(json['emailStyling'])
            : null,
        addressStyling = json['addressStyling'] != null
            ? TitleStyling.fromJson(json['addressStyling'])
            : null,
        actionIcons = json['actionIcons'] != null
            ? ActionIcons.fromJson(json['actionIcons'])
            : null,
        favouriteStatus = json['favouriteStatus'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardDesignVariations'] =
        this.cardDesignVariations?.map((v) => v.toJson()).toList();
    data['cardImageId'] = this.cardImageId;
    data['cardShortBgURL'] = this.cardShortBgURL;
    data['cardLongBgURL'] = this.cardLongBgURL;
    data['cardImageURL'] = this.cardImageURL;
    data['cardImageURL2'] = this.cardImageURL2;
    data['cardImageURL3'] = this.cardImageURL3;
    data['cardImageURL4'] = this.cardImageURL4;
    data['categoryId'] = this.categoryId;
    data['cardName'] = this.cardName;
    data['errorTextColor'] = this.errorTextColor;
    data['cardDesignType'] = this.cardDesignType;
    if (this.customImageCardDesignInfo != null) {
      data['customImageCardDesignInfo'] =
          this.customImageCardDesignInfo!.toJson();
    }
    if (this.profileDesignInfo != null) {
      data['profileDesignInfo'] = this.profileDesignInfo!.toJson();
    }
    if (this.dpStyling != null) {
      data['dpStyling'] = this.dpStyling!.toJson();
    }
    if (this.userNameStyling != null) {
      data['userNameStyling'] = this.userNameStyling!.toJson();
    }
    if (this.titleStyling != null) {
      data['titleStyling'] = this.titleStyling!.toJson();
    }
    if (this.locationStyling != null) {
      data['locationStyling'] = this.locationStyling!.toJson();
    }
    if (this.companyStyling != null) {
      data['companyStyling'] = this.companyStyling!.toJson();
    }
    if (this.skillsStyling != null) {
      data['skillsStyling'] = this.skillsStyling!.toJson();
    }
    if (this.hobbiesStyling != null) {
      data['hobbiesStyling'] = this.hobbiesStyling!.toJson();
    }
    if (this.subjectsStyling != null) {
      data['subjectsStyling'] = this.subjectsStyling!.toJson();
    }
    if (this.phoneStyling != null) {
      data['phoneStyling'] = this.phoneStyling!.toJson();
    }
    if (this.emailStyling != null) {
      data['emailStyling'] = this.emailStyling!.toJson();
    }
    if (this.addressStyling != null) {
      data['addressStyling'] = this.addressStyling!.toJson();
    }
    if (this.actionIcons != null) {
      data['actionIcons'] = this.actionIcons!.toJson();
    }
    data['favouriteStatus'] = this.favouriteStatus;
    return data;
  }
}

class CardDesignVariations {
  final UserNameStyling? userNameStyling;
  final TitleStyling? titleStyling;
  final TitleStyling? locationStyling;
  final ActionIcons? actionIcons;
  final ProfileDesignInfo? profileDesignInfo;
  final String? cardLongBgURL;
  final String? cardDesignType;
  final CustomImageCardDesignInfo? customImageCardDesignInfo;
  final String? cardImageURL4;
  final String? cardImageId;
  final String? cardImageURL;

  CardDesignVariations({
    this.userNameStyling,
    this.titleStyling,
    this.locationStyling,
    this.actionIcons,
    this.profileDesignInfo,
    this.cardLongBgURL,
    this.cardDesignType,
    this.customImageCardDesignInfo,
    this.cardImageURL4,
    this.cardImageId,
    this.cardImageURL,
  });

  CardDesignVariations.fromJson(Map<String, dynamic> json)
      : userNameStyling = json['userNameStyling'] != null
            ? UserNameStyling.fromJson(json['userNameStyling'])
            : null,
        titleStyling = json['titleStyling'] != null
            ? TitleStyling.fromJson(json['titleStyling'])
            : null,
        locationStyling = json['locationStyling'] != null
            ? TitleStyling.fromJson(json['locationStyling'])
            : null,
        actionIcons = json['actionIcons'] != null
            ? ActionIcons.fromJson(json['actionIcons'])
            : null,
        profileDesignInfo = json['profileDesignInfo'] != null
            ? ProfileDesignInfo.fromJson(json['profileDesignInfo'])
            : null,
        cardLongBgURL = json['cardLongBgURL'],
        cardDesignType = json['cardDesignType'],
        customImageCardDesignInfo = json['customImageCardDesignInfo'] != null
            ? CustomImageCardDesignInfo.fromJson(
                json['customImageCardDesignInfo'],
              )
            : null,
        cardImageURL4 = json['cardImageURL4'],
        cardImageId = json['cardImageId'],
        cardImageURL = json['cardImageURL'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userNameStyling != null) {
      data['userNameStyling'] = this.userNameStyling!.toJson();
    }
    if (this.titleStyling != null) {
      data['titleStyling'] = this.titleStyling!.toJson();
    }
    if (this.locationStyling != null) {
      data['locationStyling'] = this.locationStyling!.toJson();
    }
    if (this.actionIcons != null) {
      data['actionIcons'] = this.actionIcons!.toJson();
    }
    if (this.profileDesignInfo != null) {
      data['profileDesignInfo'] = this.profileDesignInfo!.toJson();
    }
    data['cardLongBgURL'] = this.cardLongBgURL;
    data['cardDesignType'] = this.cardDesignType;
    if (this.customImageCardDesignInfo != null) {
      data['customImageCardDesignInfo'] =
          this.customImageCardDesignInfo!.toJson();
    }
    data['cardImageURL4'] = this.cardImageURL4;
    data['cardImageId'] = this.cardImageId;
    data['cardImageURL'] = this.cardImageURL;
    return data;
  }
}

class UserNameStyling {
  final String? noOfLines;
  final String? fontSize;
  final String? alignment;
  final String? fontColor;
  final String? fontStyle;
  final String? fontWeight;

  UserNameStyling({
    this.noOfLines,
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  UserNameStyling.fromJson(Map<String, dynamic> json)
      : noOfLines = json['noOfLines'],
        fontSize = json['fontSize'],
        alignment = json['alignment'],
        fontColor = json['fontColor'],
        fontStyle = json['fontStyle'],
        fontWeight = json['fontWeight'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noOfLines'] = this.noOfLines;
    data['fontSize'] = this.fontSize;
    data['alignment'] = this.alignment;
    data['fontColor'] = this.fontColor;
    data['fontStyle'] = this.fontStyle;
    data['fontWeight'] = this.fontWeight;
    return data;
  }
}

class TitleStyling {
  final String? fontSize;
  final String? alignment;
  final String? fontColor;
  final String? fontStyle;
  final String? fontWeight;

  TitleStyling({
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  TitleStyling.fromJson(Map<String, dynamic> json)
      : fontSize = json['fontSize'],
        alignment = json['alignment'],
        fontColor = json['fontColor'],
        fontStyle = json['fontStyle'],
        fontWeight = json['fontWeight'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fontSize'] = this.fontSize;
    data['alignment'] = this.alignment;
    data['fontColor'] = this.fontColor;
    data['fontStyle'] = this.fontStyle;
    data['fontWeight'] = this.fontWeight;
    return data;
  }
}

class ActionIcons {
  final String? type;
  final String? backgroundColor;
  final String? iconColor;
  final String? alignment;

  ActionIcons({
    this.type,
    this.backgroundColor,
    this.iconColor,
    this.alignment,
  });

  ActionIcons.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        backgroundColor = json['backgroundColor'],
        iconColor = json['iconColor'],
        alignment = json['alignment'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['backgroundColor'] = this.backgroundColor;
    data['iconColor'] = this.iconColor;
    data['alignment'] = this.alignment;
    return data;
  }
}

class ProfileDesignInfo {
  final Opacity? opacity;
  final String? designType;
  final String? errorTextColor;
  final String? primaryColor;
  final String? secondaryColor;
  final String? textColor;
  final String? profileBannerImageURL;
  final String? baseColor;
  final bool? tint;

  ProfileDesignInfo({
    this.opacity,
    this.designType,
    this.errorTextColor,
    this.primaryColor,
    this.secondaryColor,
    this.textColor,
    this.profileBannerImageURL,
    this.baseColor,
    this.tint,
  });

  ProfileDesignInfo.fromJson(Map<String, dynamic> json)
      : opacity =
            json['opacity'] != null ? Opacity.fromJson(json['opacity']) : null,
        designType = json['designType'],
        errorTextColor = json['errorTextColor'],
        primaryColor = json['primaryColor'],
        secondaryColor = json['secondaryColor'],
        textColor = json['textColor'],
        profileBannerImageURL = json['profileBannerImageURL'],
        baseColor = json['baseColor'],
        tint = json['tint'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.opacity != null) {
      data['opacity'] = this.opacity!.toJson();
    }
    data['designType'] = this.designType;
    data['errorTextColor'] = this.errorTextColor;
    data['primaryColor'] = this.primaryColor;
    data['secondaryColor'] = this.secondaryColor;
    data['textColor'] = this.textColor;
    data['profileBannerImageURL'] = this.profileBannerImageURL;
    data['baseColor'] = this.baseColor;
    data['tint'] = this.tint;
    return data;
  }
}

class Opacity {
  final String? primary;
  final String? secondary;

  Opacity({
    this.primary,
    this.secondary,
  });

  Opacity.fromJson(Map<String, dynamic> json)
      : primary = json['primary'],
        secondary = json['secondary'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    data['secondary'] = this.secondary;
    return data;
  }
}

class CustomImageCardDesignInfo {
  final String? primaryColor;
  final String? profileBannerImageURL;

  CustomImageCardDesignInfo({
    this.primaryColor,
    this.profileBannerImageURL,
  });

  CustomImageCardDesignInfo.fromJson(Map<String, dynamic> json)
      : primaryColor = json['primaryColor'],
        profileBannerImageURL = json['profileBannerImageURL'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primaryColor'] = this.primaryColor;
    data['profileBannerImageURL'] = this.profileBannerImageURL;
    return data;
  }
}

class DpStyling {
  final String? borderPresent;
  final BorderDetails? borderDetails;
  final String? alignment;

  DpStyling({
    this.borderPresent,
    this.borderDetails,
    this.alignment,
  });

  DpStyling.fromJson(Map<String, dynamic> json)
      : borderPresent = json['borderPresent'],
        borderDetails = json['borderDetails'] != null
            ? BorderDetails.fromJson(json['borderDetails'])
            : null,
        alignment = json['alignment'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['borderPresent'] = this.borderPresent;
    if (this.borderDetails != null) {
      data['borderDetails'] = this.borderDetails!.toJson();
    }
    data['alignment'] = this.alignment;
    return data;
  }
}

class BorderDetails {
  final String? type;
  final String? color;
  final String? thickness;

  BorderDetails({
    this.type,
    this.color,
    this.thickness,
  });

  BorderDetails.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        color = json['color'],
        thickness = json['thickness'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['color'] = this.color;
    data['thickness'] = this.thickness;
    return data;
  }
}

class CompanyStyling {
  final String? noOfLines;
  final String? fontSize;
  final String? alignment;
  final String? fontColor;
  final String? fontStyle;
  final String? fontWeight;

  CompanyStyling({
    this.noOfLines,
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  CompanyStyling.fromJson(Map<String, dynamic> json)
      : noOfLines = json['noOfLines'],
        fontSize = json['fontSize'],
        alignment = json['alignment'],
        fontColor = json['fontColor'],
        fontStyle = json['fontStyle'],
        fontWeight = json['fontWeight'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noOfLines'] = this.noOfLines;
    data['fontSize'] = this.fontSize;
    data['alignment'] = this.alignment;
    data['fontColor'] = this.fontColor;
    data['fontStyle'] = this.fontStyle;
    data['fontWeight'] = this.fontWeight;
    return data;
  }
}

class SkillsStyling {
  final String? noOfLines;
  final String? fontSize;
  final String? alignment;
  final String? fontColor;
  final String? fontStyle;
  final String? fontWeight;

  SkillsStyling({
    this.noOfLines,
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  SkillsStyling.fromJson(Map<String, dynamic> json)
      : noOfLines = json['noOfLines'],
        fontSize = json['fontSize'],
        alignment = json['alignment'],
        fontColor = json['fontColor'],
        fontStyle = json['fontStyle'],
        fontWeight = json['fontWeight'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noOfLines'] = this.noOfLines;
    data['fontSize'] = this.fontSize;
    data['alignment'] = this.alignment;
    data['fontColor'] = this.fontColor;
    data['fontStyle'] = this.fontStyle;
    data['fontWeight'] = this.fontWeight;
    return data;
  }
}

class TitleTexts {
  final TitleStyling? companyName;
  final TitleStyling? location;
  final TitleStyling? title;
  final TitleStyling? phone;
  final TitleStyling? email;
  final TitleStyling? address;

  TitleTexts({
    this.companyName,
    this.location,
    this.title,
    this.phone,
    this.email,
    this.address,
  });

  TitleTexts.fromJson(Map<String, dynamic> json)
      : companyName = json['companyName'] != null
            ? TitleStyling.fromJson(json['companyName'])
            : null,
        location = json['location'] != null
            ? TitleStyling.fromJson(json['location'])
            : null,
        title =
            json['title'] != null ? TitleStyling.fromJson(json['title']) : null,
        phone =
            json['phone'] != null ? TitleStyling.fromJson(json['phone']) : null,
        email =
            json['email'] != null ? TitleStyling.fromJson(json['email']) : null,
        address = json['address'] != null
            ? TitleStyling.fromJson(json['address'])
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companyName != null) {
      data['companyName'] = this.companyName!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.phone != null) {
      data['phone'] = this.phone!.toJson();
    }
    if (this.email != null) {
      data['email'] = this.email!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class ActionIconText {
  final String? type;
  final String? fontSize;
  final String? fontColor;
  final String? iconColor;

  ActionIconText({
    this.type,
    this.fontSize,
    this.fontColor,
    this.iconColor,
  });

  ActionIconText.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        fontSize = json['fontSize'],
        fontColor = json['fontColor'],
        iconColor = json['iconColor'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['fontSize'] = this.fontSize;
    data['fontColor'] = this.fontColor;
    data['iconColor'] = this.iconColor;
    return data;
  }
}
