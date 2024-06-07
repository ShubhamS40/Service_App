import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart'; // Update this with the correct path if necessary
import 'phoneauth.dart'; // Update this with the correct path if necessary
import 'package:pinput/pinput.dart';

class Otp extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  const Otp({Key? key, required this.verificationId,required this.phoneNumber}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login/Signup"),
        
          bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Height of the bottom boundary
          child: Container(
            color: const Color.fromARGB(255, 221, 221, 221), // Color of the bottom boundary
            height: 4.0, // Thickness of the bottom boundary
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          
            children: [
            Text("Enter Verification Code",style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold ),),
            SizedBox(height: 10,),
            Text("we have sent you a 6 digit verification code on"),
              SizedBox(height: 10,),
            Text("${widget.phoneNumber}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
           SizedBox(height: 15,),
            
          Pinput(
            length: 6,
            controller: otpController,
            showCursor: true,
            defaultPinTheme: PinTheme(
              textStyle: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              width: 40,
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
            )
            ),
          
              SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.black, // Background color of the button
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50), // Adjust the padding
                      minimumSize: Size(350, 50),
                        shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Adjust the border radius
                  ),
                      
                      ),
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: otpController.text.trim(),
                    );
                    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
          
                    if (userCredential.user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyWidget()), // Update with your target page
                      );
                    }
                  } catch (e) {
                    print('Error: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to sign in: ${e.toString()}'),
                      ),
                    );
                  }
                },
                child: Text('Verify OTP',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
