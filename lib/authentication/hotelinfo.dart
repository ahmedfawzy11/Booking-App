import 'package:flutter/material.dart';
import 'package:booking_app/models/room_data.dart';
import 'package:booking_app/utils/localfiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';




class Hotelinfo {
  String id;
  String description;
  String imagePath;
  String titleTxt;
  String subTxt;
  DateText? date;
  String dateTxt;
  String roomSizeTxt;
  RoomData? roomData;
  double dist;
  double rating;
  int reviews;
  String perNight;
  bool isSelected;
  PeopleSleeps? peopleSleeps;
  LatLng? location;
  Offset? screenMapPin; // we used this screen Offset for adding on Map layer

  Hotelinfo({
    this.id = '',
    this.description = '',
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dateTxt = "",
    this.roomSizeTxt = "",
    this.roomData,
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 10.0,
    this.perNight = '',
    this.isSelected = false,
    this.date,
    this.peopleSleeps,
    this.location,
    this.screenMapPin,
  });

  // we need location in this hotelList bcz we using that in map






  factory Hotelinfo.fromJson(Map<String, dynamic> data) {
    return new Hotelinfo(

      id: data['id'],
      titleTxt: data['name'],
      perNight: data['price'],
      subTxt: data['address'],





    );
  }







}
