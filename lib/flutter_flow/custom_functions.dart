import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

List<GuestStruct>? sampleList() {
  // return list of guest struct
  return [
    createGuestStruct(
        id: 1,
        name: 'John Doe',
        dob: DateTime(1990, 1, 1),
        passportNumber: 'A12345678',
        countryOfResidency: Countries.PT,
        nationality: Countries.PT),
    createGuestStruct(
        id: 2,
        name: 'Jane Smith',
        dob: DateTime(1985, 5, 15),
        passportNumber: 'B87654321',
        countryOfResidency: Countries.PT,
        nationality: Countries.PT),
    createGuestStruct(
        id: 3,
        name: 'Alice Johnson',
        dob: DateTime(2000, 12, 30),
        passportNumber: 'C23456789',
        countryOfResidency: Countries.PT,
        nationality: Countries.PT),
  ];
}
