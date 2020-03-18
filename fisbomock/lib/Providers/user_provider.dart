import 'package:flutter/material.dart';

import '../Models/listingGet.dart';
import '../Models/UserGet.dart';

import 'dart:convert';
import 'dart:developer';

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users {
    return [..._users];
  }

  List<Listing> getUserFavourites(int userId) {
    User user = findById(userId);
    return [...user.favourites.toList()];
  }

  int get itemCount {
    return _users == [] ? 0 : _users.length;
  }

  int userFavouritesItemCount(int userId) {
    User user = findById(userId);
    return user.favourites.length;
  }

  User findById(int id) {
    return _users.firstWhere((a) => a.userId == id);
  }

  bool seeIfFav(listing){
    // fix ----------------------------------------------------------------------------------------------
    return _users[0].favourites.contains(listing) ? true : false;
  }

  void setUser() {
    final res = json.encode({
      "user-list": [
        {
          "user-id": 1,
          "username": "user1",
          "password": "pass",
          "email": "email.mail.com",
          "phone-number": "027356489",
          "first-name": "Harry",
          "last-name": "Potter",
          "address": {
            "street-number": "123",
            "street-name": "Northcote St",
            "suburb": "Frimley",
            "city": "Hastings",
            "region": "Hawkes Bay",
            "country": "New Zealand"
          },
          "favourites": []
        }
      ]
    });
    Users users = Users.fromJson(json.decode(res));

    log('Users: ${users.userList}');

    _users = [...users.userList];
  }

  void toggleFavourite(int userId, Listing aListing) {
    User user = findById(userId);
    if (user.favourites.isNotEmpty) {
      try{
        Listing matching =
          user.favourites.firstWhere((a) => a.listingId == aListing.listingId);
          user.favourites.remove(aListing);
      } catch(e){
        user.favourites.add(aListing);
      }
      
    } else{
      user.favourites.add(aListing);
    }
    notifyListeners();

  }
}
