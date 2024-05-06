import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

String epochTimeConverter(int dateTime) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(dateTime * 1000);
  String sonuc = date.toString();
  sonuc = sonuc.substring(0, (sonuc.length - 7));

  String year = sonuc.substring(0, 4);
  // Ay
  String month = sonuc.substring(5, 7);
  // Gün
  String day = sonuc.substring(8, 10);
  // Saat ve dakika
  String time = sonuc.substring(11);

  return "$day-$month-$year $time";
}
