// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:our_space_app/backend/stripeLogicHandling.dart';

// class WebViewScreen extends StatefulWidget {
//   final String initialUrl;

//   WebViewScreen({required this.initialUrl});

//   @override
//   _WebViewScreenState createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WebView Screen'),
//       ),
//       body: WebView(
//         initialUrl: widget.initialUrl,
//         javascriptMode: JavascriptMode.unrestricted,
//         navigationDelegate: (NavigationRequest request) {
//           return _handleNavigationRequest(request, context);
//         },
//       ),
//     );
//   }

//   NavigationDecision _handleNavigationRequest(
//       NavigationRequest request, BuildContext context) {
//     final uri = Uri.parse(request.url);

//     if (uri.scheme == 'ourspaceapp' &&
//         uri.host == 'ourspace.com' &&
//         uri.path == '/return') {
//       handleIncomingLink(
//           uri, context); // Call your deep link handling function here
//       return NavigationDecision
//           .prevent; // Prevent loading the custom URL scheme in the WebView
//     }

//     return NavigationDecision
//         .navigate; // Allow other URLs to be loaded in the WebView
//   }
// }
