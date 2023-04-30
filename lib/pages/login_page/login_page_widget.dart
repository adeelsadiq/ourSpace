import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.emailAddressLoginController ??= TextEditingController();
    _model.passwordLoginController ??= TextEditingController();
    _model.emailAddressController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
    _model.passwordConfirmController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF14181B),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFF14181B),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/background.jpg',
              ).image,
            ),
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0x990F1113),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Color(0xA7FFFFFF),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              Theme.of(context).brightness == Brightness.dark
                                  ? 'assets/images/ourSpaceLogo-no-bg.png'
                                  : 'assets/images/ourSpaceLogo.png',
                              width: 160,
                              height: 155,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            labelColor: Colors.white,
                            labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF0F1113),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                            indicatorColor: Colors.white,
                            tabs: [
                              Tab(
                                text: 'Sign In',
                              ),
                              Tab(
                                text: 'Sign Up',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                          child: TextFormField(
                                            controller: _model.emailAddressLoginController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Email Address',
                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            maxLines: null,
                                            validator: _model.emailAddressLoginControllerValidator.asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                          child: TextFormField(
                                            controller: _model.passwordLoginController,
                                            obscureText: !_model.passwordLoginVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () =>
                                                      _model.passwordLoginVisibility = !_model.passwordLoginVisibility,
                                                ),
                                                focusNode: FocusNode(skipTraversal: true),
                                                child: Icon(
                                                  _model.passwordLoginVisibility
                                                      ? Icons.visibility_outlined
                                                      : Icons.visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            minLines: 1,
                                            validator: _model.passwordLoginControllerValidator.asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              GoRouter.of(context).prepareAuthEvent();

                                              final user = await signInWithEmail(
                                                context,
                                                _model.emailAddressLoginController.text,
                                                _model.passwordLoginController.text,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              if (currentJwtToken != null && currentJwtToken != '') {
                                                context.pushNamedAuth('HomePage', mounted);
                                              } else {
                                                context.pushNamedAuth('LoginPage', mounted);
                                              }
                                            },
                                            text: 'Login',
                                            options: FFButtonOptions(
                                              width: 230,
                                              height: 50,
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                              color: Color(0xFF39D2C0),
                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              elevation: 3,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed('forgotPass');
                                            },
                                            text: 'Forgot Password?',
                                            options: FFButtonOptions(
                                              width: 170,
                                              height: 40,
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                              color: Color(0x0039D2C0),
                                              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              elevation: 0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                                child: Text(
                                                  'Or use your Google account to login',
                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                        fontFamily: 'Outfit',
                                                        color: Color(0xC8FFFFFF),
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  GoRouter.of(context).prepareAuthEvent();
                                                  final user = await signInWithGoogle(context);
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  context.goNamedAuth('HomePage', mounted);
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0F1113),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 5,
                                                        color: Color(0x3314181B),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment: AlignmentDirectional(0, 0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.google,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                          child: TextFormField(
                                            controller: _model.emailAddressController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Email Address',
                                              labelStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            maxLines: null,
                                            validator: _model.emailAddressControllerValidator.asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                          child: TextFormField(
                                            controller: _model.passwordController,
                                            obscureText: !_model.passwordVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => _model.passwordVisibility = !_model.passwordVisibility,
                                                ),
                                                focusNode: FocusNode(skipTraversal: true),
                                                child: Icon(
                                                  _model.passwordVisibility
                                                      ? Icons.visibility_outlined
                                                      : Icons.visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            minLines: 1,
                                            validator: _model.passwordControllerValidator.asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                          child: TextFormField(
                                            controller: _model.passwordConfirmController,
                                            obscureText: !_model.passwordConfirmVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Confirm Password',
                                              labelStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => _model.passwordConfirmVisibility =
                                                      !_model.passwordConfirmVisibility,
                                                ),
                                                focusNode: FocusNode(skipTraversal: true),
                                                child: Icon(
                                                  _model.passwordConfirmVisibility
                                                      ? Icons.visibility_outlined
                                                      : Icons.visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            minLines: 1,
                                            validator: _model.passwordConfirmControllerValidator.asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              GoRouter.of(context).prepareAuthEvent();
                                              if (_model.passwordController.text !=
                                                  _model.passwordConfirmController.text) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Passwords don\'t match!',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }

                                              final user = await createAccountWithEmail(
                                                context,
                                                _model.emailAddressController.text,
                                                _model.passwordController.text,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              context.goNamedAuth('HomePage', mounted);
                                            },
                                            text: 'Create Account',
                                            options: FFButtonOptions(
                                              width: 230,
                                              height: 50,
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                              color: Color(0xFF39D2C0),
                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                              elevation: 3,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                                  child: Text(
                                                    'Or use your Google account to create account',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                          fontFamily: 'Outfit',
                                                          color: Color(0xC8FFFFFF),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  GoRouter.of(context).prepareAuthEvent();
                                                  final user = await signInWithGoogle(context);
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  context.goNamedAuth('HomePage', mounted);
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0F1113),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 5,
                                                        color: Color(0x3314181B),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment: AlignmentDirectional(0, 0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.google,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
