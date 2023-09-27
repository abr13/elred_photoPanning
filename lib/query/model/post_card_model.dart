class ImageUploadResponse {
  final bool? success;
  final bool? isAuth;
  final String? message;
  final List<Result>? result;

  ImageUploadResponse({
    required this.success,
    required this.isAuth,
    required this.message,
    required this.result,
  });

  factory ImageUploadResponse.fromJson(Map<String, dynamic> json) {
    final List<Result>? resultList = (json['result'] as List<dynamic>?)
        ?.map((dynamic e) => Result.fromJson(e as Map<String, dynamic>))
        .toList();

    return ImageUploadResponse(
      success: json['success'] as bool?,
      isAuth: json['isAuth'] as bool?,
      message: json['message'] as String?,
      result: resultList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'success': success,
      'isAuth': isAuth,
      'message': message,
    };
    if (result != null) {
      data['result'] = result!.map((Result e) => e.toJson()).toList();
    }
    return data;
  }
}

class Result {
  final String? uid;
  final String? profileBannerImageURL;

  Result({
    required this.uid,
    required this.profileBannerImageURL,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      uid: json['uid'] as String?,
      profileBannerImageURL: json['profileBannerImageURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'uid': uid,
      'profileBannerImageURL': profileBannerImageURL,
    };
    return data;
  }
}
