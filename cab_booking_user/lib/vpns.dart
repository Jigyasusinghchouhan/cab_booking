import 'dart:developer';
import 'package:cab_booking_user/HomeScreen.dart';
import 'package:cab_booking_user/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';


class VerifyPhoneNumberScreen extends StatefulWidget {

  final String phoneNumber;


  const VerifyPhoneNumberScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  late final ScrollController scrollController;

  final _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomViewInsets = WidgetsBinding.instance.window.viewInsets.bottom;
    isKeyboardVisible = bottomViewInsets > 0;
  }

  // scroll to bottom of screen, when pin input field is in focus.
  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  getData()async{
    box.write("phone", widget.phoneNumber);
    Get.offAll(const HomeScreen());
    var docSnapshot =
    await FirebaseFirestore.instance.collection("users").doc(box.read("uid")).get();

    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var name = data?['name'];
      var phone = data?['phone'];
      var email = data?['email'];
      box.write("name", name);
      box.write("phone", phone);
      box.write("email", email);


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Welcome back $name'),
        ),
      );

    }else{
      // box.write("phone", widget.phoneNumber).then((value) => {
      // Get.to(UserDetails(phoneNumber: widget.phoneNumber,),),
      // });

    }


  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FirebasePhoneAuthHandler(
        phoneNumber: widget.phoneNumber,
        signOutOnSuccessfulVerification: false,
        linkWithExistingUser: false,
        autoRetrievalTimeOutDuration: const Duration(seconds: 60),
        otpExpirationDuration: const Duration(seconds: 60),
        onCodeSent: () {
          log( 'OTP sent!');
        },
        onLoginSuccess: (userCredential, autoVerified) async {
          box.write('uid', userCredential.user?.uid).then((value) => {
            getData(),

          });
          log(
            'Login Success UID: ${userCredential.user?.uid}',
          );

        },
        onLoginFailed: (authException, stackTrace){
          // log(
          //   VerifyPhoneNumberScreen.id,
          //   name: authException.message.toString(),
          //   error: authException,
          //   stackTrace: stackTrace,
          // );

          switch (authException.code) {
            case 'invalid-phone-number':
            // invalid phone number
              return
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid phone number!'),
                  ),
                );
            case 'invalid-verification-code':
            // invalid otp entered
              return
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('The entered OTP is invalid!'),
                  ),
                );
          // handle other error codes
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Something went wrong!'),
                ),
              );
          // handle error further if needed
          }
        },
        onError: (error, stackTrace) {
          // log(
          //   VerifyPhoneNumberScreen.id,
          //   error: error,
          //   stackTrace: stackTrace,
          // );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('An error occurred!'),
            ),
          );

        },
        builder: (context, controller) {
          return Scaffold(

            //   appBar: aBar(
            //   ico: Icons.arrow_back_ios_new_rounded,
            //   icoColor: fontOnC,
            //   tIcoPre: true,
            //     title: 'Verify',
            // ),

            body: controller.isSendingCode
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CustomLoader(),
                SizedBox(height: 50),
                Center(
                  child: Text(
                    'Sending OTP',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            )
                : ListView(
              padding: const EdgeInsets.all(20),
              controller: scrollController,
              children: [
                Text(
                  "We've sent an SMS with a verification code to ${widget.phoneNumber}",
                  style: const TextStyle(fontSize: 25),textAlign: TextAlign.center,
                ),


                const SizedBox(height: 10),
                const Divider(),


                if (controller.isListeningForOtpAutoRetrieve)
                  Column(
                    children:const [

                      // CustomLoader(),

                      // SizedBox(height: 50),

                      // Text(
                      //   'Listening for OTP',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     fontSize: 25,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      // SizedBox(height: 15),
                      //
                      // Divider(),
                      // Text('OR', textAlign: TextAlign.center),
                      // Divider(),
                    ],
                  ),
                const SizedBox(height: 15),
                const Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                PinInputField(
                  length: 6,
                  onFocusChange: (hasFocus) async {
                    if (hasFocus) await _scrollToBottomOnKeyboardOpen();
                  },
                  onSubmit: (enteredOtp) async {
                    final verified =
                    await controller.verifyOtp(enteredOtp);
                    if (verified) {
                      // number verify success
                      // will call onLoginSuccess handler
                    } else {
                      // phone verification failed
                      // will call onLoginFailed or onError callbacks with the error
                    }
                  },
                ),
                const SizedBox(height: 15),

              ],
            ),
          );
        },
      ),
    );
  }
}


class CustomLoader extends StatelessWidget {
  static const id = 'CustomLoader';

  final Color? color;
  final double radius;
  final double padding;

  const CustomLoader({
    Key? key,
    this.color,
    this.radius = 15,
    this.padding = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Center(
        child: SizedBox(
          height: radius * 2,
          width: radius * 2,
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}

class PinInputField extends StatefulWidget {
  final int length;
  final void Function(bool)? onFocusChange;
  final void Function(String) onSubmit;

  const PinInputField({
    Key? key,
    this.length = 6,
    this.onFocusChange,
    required this.onSubmit,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PinInputFieldState createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  late final TextEditingController _pinPutController;
  late final FocusNode _pinPutFocusNode;
  late final int _length;

  Size _findContainerSize(BuildContext context) {
    // full screen width
    double width = MediaQuery.of(context).size.width * 0.85;

    // using left-over space to get width of each container
    width /= _length;

    return Size.square(width);
  }

  @override
  void initState() {
    _pinPutController = TextEditingController();
    _pinPutFocusNode = FocusNode();

    if (widget.onFocusChange != null) {
      _pinPutFocusNode.addListener(() {
        widget.onFocusChange!(_pinPutFocusNode.hasFocus);
      });
    }

    _length = widget.length;
    super.initState();
  }

  @override
  void dispose() {
    _pinPutController.dispose();
    _pinPutFocusNode.dispose();
    super.dispose();
  }

  PinTheme _getPinTheme(
      BuildContext context, {
        required Size size,
      }) {
    return PinTheme(
      height: size.height,
      width: size.width,
      textStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(7.5),
      ),
    );
  }

  static const _focusScaleFactor = 1.15;

  @override
  Widget build(BuildContext context) {
    final size = _findContainerSize(context);
    final defaultPinTheme = _getPinTheme(context, size: size);

    return SizedBox(
      height: size.height * _focusScaleFactor,
      child: Pinput(
        length: _length,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          height: size.height * _focusScaleFactor,
          width: size.width * _focusScaleFactor,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: Theme.of(context).errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        onCompleted: widget.onSubmit,
        pinAnimationType: PinAnimationType.scale,
        // submittedFieldDecoration: _pinPutDecoration,
        // selectedFieldDecoration: _pinPutDecoration,
        // followingFieldDecoration: _pinPutDecoration,
        // textStyle: const TextStyle(
        //   color: Colors.black,
        //   fontSize: 20.0,
        //   fontWeight: FontWeight.w600,
        // ),
      ),
    );
  }
}