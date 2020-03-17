import 'package:fisbomock/Models/listingGet.dart';

class Users {
  List<User> userList;

  Users({this.userList});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['user-list'] != null) {
      userList = new List<User>();
      json['user-list'].forEach((v) {
        userList.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userList != null) {
      data['user-list'] = this.userList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int userId;
  String username;
  String password;
  String email;
  String phoneNumber;
  String firstName;
  String lastName;
  Address address;
  List<Listing> favourites;

  User(
      {this.userId,
      this.username,
      this.password,
      this.email,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.address,
      this.favourites});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user-id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    phoneNumber = json['phone-number'];
    firstName = json['first-name'];
    lastName = json['last-name'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['favourites'] != null) {
      favourites = new List<Listing>();
      json['favourites'].forEach((v) {
        favourites.add(new Listing.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user-id'] = this.userId;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.favourites!= null) {
      data['favourites'] = this.favourites.map((v) => v.toJson()).toList();
    }
    return data;
  }


}


