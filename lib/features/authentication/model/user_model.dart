import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/formatters/formatter.dart';

///Model class representing the user data

class UserModel {
  final String? id;
  String firstName;
  String lastName;
  String phoneNumber;
  String userName;
  String email;
  String password;
  String profilePicture;
  AppRole appRole;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel(
      {this.id,
      this.firstName = '',
      this.lastName = '',
      this.phoneNumber = '',
      this.userName = '',
      this.email = '',
      this.password = '',
      this.profilePicture = '',
      this.appRole = AppRole.user,
      this.createdAt,
      this.updatedAt});

  ///Helper function to get the full name
  String get fullname => '$firstName $lastName';

  ///Helper function to get Formatted Phone Number
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  String get formattedDate => TFormatter.formatDate(createdAt);
  String get formattedUpdatedDate => TFormatter.formatDate(updatedAt);

// static List<String> nameParts(fullName) => fullname.split(" ");

  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split(" ");
    String firstname = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelcaseusername = '$firstname$lastname';
    String usernamewithprefix = 'K_$firstname$lastname';

    return usernamewithprefix;
  }

  ///Static function to create an empty user model
  static UserModel empty() => UserModel(email: '');

  ///Convert model to Json struture for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': formattedPhoneNumber,
      'Password': password,
      'ProfilePicture': profilePicture,
      'Role': appRole.name.toString(),
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt = DateTime.now()
    };
  }

  ///Factory method to create a user model from a firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data.containsKey('FirstName') ? data['FirstName'] ?? '' : '',
        lastName: data.containsKey('LastName') ? data['LastName'] ?? '' : '',
        userName: data.containsKey('UserName') ? data['UserName'] ?? '' : '',
        email: data.containsKey('Email') ? data['Email'] ?? '' : '',
        phoneNumber:
            data.containsKey('PhoneNumber') ? data['PhoneNumber'] ?? '' : '',
        profilePicture: data.containsKey('ProfilePicture')
            ? data['ProfilePicture'] ?? ''
            : '',
        appRole: data.containsKey('Role')
            ? data['Role'] == AppRole.admin.name.toString()
                ? AppRole.admin
                : AppRole.user
            : AppRole.user,
        createdAt: data.containsKey('CreatedAt')
            ? data['CreatedAt'].toDate() ?? DateTime.now()
            : DateTime.now(),
        updatedAt: data.containsKey('UpdatedAt')
            ? data['UpdatedAt'].toDate() ?? DateTime.now()
            : DateTime.now(),
      );
    } else {
      return empty();
    }
  }
}
