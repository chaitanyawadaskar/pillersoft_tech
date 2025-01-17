///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class SignUpModelUser {
/*
{
  "firstname": "demo",
  "lastname": "user",
  "location": "India",
  "phone": "8080156829",
  "phonecode": "91",
  "email": "demo@gmail.com",
  "date_of_birth": "1990-01-01",
  "gender": "male",
  "referral_code": "djbdj",
  "profile_image": "noimage",
  "id_front": "--",
  "id_back": "--",
  "user_referral_code": "IYV4Yc",
  "updated_at": "2024-09-02T19:11:27.000000Z",
  "created_at": "2024-09-02T19:11:27.000000Z",
  "id": 84,
  "name": "demo user",
  "phone_wcode": "+91 8080156829",
  "age": 34,
  "is_register_q_done": 0,
  "total_earnings": 0
} 
*/

  String? firstname;
  String? lastname;
  String? location;
  String? phone;
  String? phonecode;
  String? email;
  String? dateOfBirth;
  String? gender;
  String? referralCode;
  String? profileImage;
  String? idFront;
  String? idBack;
  String? userReferralCode;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? name;
  String? phoneWcode;
  int? age;
  int? isRegisterQDone;
  int? totalEarnings;

  SignUpModelUser({
    this.firstname,
    this.lastname,
    this.location,
    this.phone,
    this.phonecode,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.referralCode,
    this.profileImage,
    this.idFront,
    this.idBack,
    this.userReferralCode,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.name,
    this.phoneWcode,
    this.age,
    this.isRegisterQDone,
    this.totalEarnings,
  });
  SignUpModelUser.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname']?.toString();
    lastname = json['lastname']?.toString();
    location = json['location']?.toString();
    phone = json['phone']?.toString();
    phonecode = json['phonecode']?.toString();
    email = json['email']?.toString();
    dateOfBirth = json['date_of_birth']?.toString();
    gender = json['gender']?.toString();
    referralCode = json['referral_code']?.toString();
    profileImage = json['profile_image']?.toString();
    idFront = json['id_front']?.toString();
    idBack = json['id_back']?.toString();
    userReferralCode = json['user_referral_code']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
    name = json['name']?.toString();
    phoneWcode = json['phone_wcode']?.toString();
    age = json['age']?.toInt();
    isRegisterQDone = json['is_register_q_done']?.toInt();
    totalEarnings = json['total_earnings']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['location'] = location;
    data['phone'] = phone;
    data['phonecode'] = phonecode;
    data['email'] = email;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    data['referral_code'] = referralCode;
    data['profile_image'] = profileImage;
    data['id_front'] = idFront;
    data['id_back'] = idBack;
    data['user_referral_code'] = userReferralCode;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['name'] = name;
    data['phone_wcode'] = phoneWcode;
    data['age'] = age;
    data['is_register_q_done'] = isRegisterQDone;
    data['total_earnings'] = totalEarnings;
    return data;
  }
}

class SignUpModel {
/*
{
  "status": true,
  "message": "User registered successfully",
  "user": {
    "firstname": "demo",
    "lastname": "user",
    "location": "India",
    "phone": "8080156829",
    "phonecode": "91",
    "email": "demo@gmail.com",
    "date_of_birth": "1990-01-01",
    "gender": "male",
    "referral_code": "djbdj",
    "profile_image": "noimage",
    "id_front": "--",
    "id_back": "--",
    "user_referral_code": "IYV4Yc",
    "updated_at": "2024-09-02T19:11:27.000000Z",
    "created_at": "2024-09-02T19:11:27.000000Z",
    "id": 84,
    "name": "demo user",
    "phone_wcode": "+91 8080156829",
    "age": 34,
    "is_register_q_done": 0,
    "total_earnings": 0
  }
} 
*/

  bool? status;
  String? message;
  SignUpModelUser? user;

  SignUpModel({
    this.status,
    this.message,
    this.user,
  });
  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    user =
        (json['user'] != null) ? SignUpModelUser.fromJson(json['user']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
