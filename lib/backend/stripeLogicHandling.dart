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

Future<void> initUniLinks(context) async {
  try {
    Uri? initialLink = await getInitialUri();
    if (initialLink != null) {
      String url = initialLink.toString();
      handleIncomingLink(url, context);
    }
  } on PlatformException {
    print('Failed to handle the incoming link.');
  }
}

Future<Uri?> createStripeAccount() async {
  final Map<String, dynamic> requestBody = {
    'email': currentUserDocument?.email,
    'name': currentUserDocument?.displayName,
  };
  // print(currentUserDocument?.email);
  // String url =
  //     Platform.isAndroid ? 'http://192.168.1.4:3000' : 'http://localhost:3000';
  String url = "https://express-server-tau.vercel.app";
  // String url = "http://192.168.1.4:3000";
  final response = await http.post(
    Uri.parse('$url/create-stripe-account'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(requestBody),
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> account = json.decode(response.body);
    // print('Stripe account created: $account');
    final Uri onboardingUri = Uri.parse(account['onboardingUri']);
    // print('Stripe account created (line 67 handling): $onboardingUri');
    return onboardingUri;
  } else {
    print('Failed to create Stripe account. Status code: ${response.statusCode}');
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
      await FirebaseFirestore.instance.collection('users').doc(userUid).update({'stripeID': stripeId});
      // print("Stripe ID Added to firebase");
    } else {
      print('Stripe ID not found in the incoming link');
    }
  }
  if (link.path == '/refresh') {
    // Extract the Stripe ID from the incoming link

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Stripe Account creation not completed.',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );

    context.pushNamed('homePage');
  }
}
