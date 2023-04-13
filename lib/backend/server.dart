import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
export 'server.dart';

final user = FirebaseAuth.instance.currentUser;
final String name = user!.displayName!;
final String email = user!.email!;

Future<void> createConnectedAccount() async {
  const apiKey =
      'sk_test_51Ms8klHP4fXKJAPbjz0Y6p6qTkko7mGxJjImrUpOe3pY6NTS5ABeR1KXXNT66MwEAYRcGLSms70D5jTcLsgjIcqz00EN6sauD5';
  const headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  final body =
      'type=custom&country=IE&email=$email&capabilities[card_payments][requested]=true&capabilities[transfers][requested]=true';

  final response = await http.post(
    Uri.parse('https://api.stripe.com/v1/accounts'),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    jsonResponse['name'] = name;
    jsonResponse['email'] = email;
    print('Connected account created: ${jsonResponse['id']}');
  } else {
    print('Error creating connected account: ${response.body}');
  }
}


// const express = require('express');
// const bodyParser = require('body-parser');
// const admin = require('firebase-admin');
// const stripe = require('stripe')('pk_test_51Ms8klHP4fXKJAPbxbGgB6xnR5DwC1XNgWUt9WJOWtwJvq8ex2GQ2hagBqV89VVKFbk5yiqL5SZHEd7TfCfFMJmw00tgNqlxcI');

// // Initialize Firebase Admin SDK
// const serviceAccount = require('/home/adeelsk4/stripe_acc/flutter-practice-a4f28-firebase-adminsdk-xc0g9-3364b18f52.json');
// admin.initializeApp({
//   credential: admin.credential.cert(serviceAccount),
// });

// const app = express();
// app.use(bodyParser.json());

// // Route for creating a Stripe account
// app.post('/create_stripe_account', async (req, res) => {
//   try {
//     const { name, email } = req.body;

//     // Create Stripe account
//     const account = await stripe.accounts.create({
//       type: 'custom',
//       country: 'IE',
//       name: name,
//       email: email,
//       requested_capabilities: ['card_payments', 'transfers'],
//     });

//     // Update Firebase document
//     const userRef = admin.firestore().collection('users').doc(email);
//     await userRef.update({ stripe_id: account.id });

//     // Send response
//     res.status(200).json({ message: 'Stripe account created and saved to Firebase' });
//   } catch (error) {
//     res.status(500).json({ error: error.message });
//   }
// });

// const PORT = process.env.PORT || 3002;
// app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));
