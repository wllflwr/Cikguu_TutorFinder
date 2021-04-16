class Profile {
  final String uid;
  final String userType;
  final String fullName;
  final String phoneNumber;
  final String bio;
  final String address;
  final String education;
  final String extraInfo;
  final String image;
  final String exam;
  final List<dynamic> spm;
  final List<dynamic> pt3;

  Profile({
    this.uid,
    this.userType,
    this.fullName,
    this.phoneNumber,
    this.bio,
    this.address,
    this.education,
    this.extraInfo,
    this.image,
    this.exam,
    this.spm,
    this.pt3,
  });

  String toString() {
    return uid +
        userType +
        fullName +
        phoneNumber +
        bio +
        address +
        education +
        extraInfo +
        image;
  }
}
