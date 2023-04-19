import '/auth/auth_util.dart';
import 'dart:io';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
export 'package:our_space_app/backend/stripeLogicHandling.dart';

// Future<void> refreshUserData(BuildContext context) async {
//   // Get the current user's ID
//   final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

//   // Fetch the updated user data from Firebase
//   DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(currentUserId).get();

//   // Update the app state with the refreshed user data
//   Provider.of<FFAppState>(context, listen: false).updateUserData(documentSnapshot.data());
// }

Future<void> initUniLinks(context) async {
  try {
    Uri? initialLink = await getInitialUri();
    if (initialLink != null) {
      String url = initialLink.toString();
      handleIncomingLink(url, context);
    }
  } on PlatformException {
    // Handle exception
  }
}

Future<Uri?> createStripeAccount() async {
  final Map<String, dynamic> requestBody = {
    'email': currentUserDocument?.email,
    'name': currentUserDocument?.displayName,
  };
  print(currentUserDocument?.email);
  String url =
      Platform.isAndroid ? 'http://192.168.1.4:3000' : 'http://localhost:3000';
  final response = await http.post(
    Uri.parse('$url/create-stripe-account'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(requestBody),
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> account = json.decode(response.body);
    print('Stripe account created: $account');
    final Uri onboardingUri = Uri.parse(account['onboardingUri']);
    print('Stripe account created (line 67 handling): $onboardingUri');
    return onboardingUri;
  } else {
    print(
        'Failed to create Stripe account. Status code: ${response.statusCode}');
  }

  return null;
}

void handleIncomingLink(String url, context) async {
  Uri link = Uri.parse(url);
  if (link.path == '/return') {
    // Extract the Stripe ID from the incoming link
    final stripeId = link.queryParameters['accountId'];

    // Check if the Stripe ID is not null
    if (stripeId != null) {
      // Get the current user's UID
      final userUid = FirebaseAuth.instance.currentUser!.uid;

      // Update the user's account data in Firestore with the new Stripe ID
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .update({'stripeID': stripeId});
      print("Stripe ID Added to firebase");
      Navigator.of(context).pop(true);
      // Navigator.of(context).pushNamed('addSpace');
      // Take the appropriate action after the user has completed onboarding and the Stripe ID has been saved
    } else {
      print('Stripe ID not found in the incoming link');
    }
  }
}
