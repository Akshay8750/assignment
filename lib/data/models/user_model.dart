class UserModel {
  final String name;
  final String profileUrl;
  final String gender;
  final String phoneNumber;
  final String createdAt;

  UserModel({
    this.name = "Radhika Joshi",
    this.profileUrl =
    "https://w7.pngwing.com/pngs/514/813/png-transparent-child-computer-icons-avatar-user-avatar-child-face-orange-thumbnail.png",
    this.gender = "Female",
    this.phoneNumber = "+91- 9811122200",
    this.createdAt = "May 9 2024, 12:23 PM",
  });

  String getUserName() {
    return name;
  }

  String getProfileUrl() {
    return profileUrl;
  }

  String getGender() {
    return gender;
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  String getCreatedAt() {
    return createdAt;
  }
}
