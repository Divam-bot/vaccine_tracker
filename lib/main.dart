import 'package:flutter/material.dart';
import 'package:vacc_tracker_app/pages/home.dart';
import 'package:vacc_tracker_app/pages/loading.dart';
import 'package:vacc_tracker_app/pages/login.dart';
import 'package:vacc_tracker_app/pages/register.dart';
import 'package:vacc_tracker_app/pages/sign_up.dart';
import 'package:vacc_tracker_app/pages/find_location.dart';
import 'package:vacc_tracker_app/pages/booking.dart';
import 'package:vacc_tracker_app/pages/booking_confirm.dart';
import 'package:vacc_tracker_app/pages/booking_success.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/login": (context) => Login(),
      "/sign_up": (context) => SignUp(),
      "/find_location": (context) => FindLocation(),
      "/booking": (context) => Booking(),
      "/booking_confirm": (context) => BookingConfirm(),
      "/booking_success": (context) => BookingSuccess(),
      "/register": (context) => Register(),
    },
  ));
}
