import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:serviceapp/otp.dart';
import 'package:country_picker/country_picker.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  Country country = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController number = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image(image: NetworkImage("https://i.pinimg.com/474x/97/84/c8/9784c8b48c7c5a496b4866c87d144cb7.jpg"),height: 50,),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                       margin: EdgeInsets.fromLTRB(60, 0  , 0, 0),
                      child: Text("AC Service ",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                        
                      )),
                    ),
                    Text("is now",),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Image(image: NetworkImage("https://i.pinimg.com/474x/97/84/c8/9784c8b48c7c5a496b4866c87d144cb7.jpg"),height: 160,),
                    SizedBox(width: 10),
                    Column(
                      children: [ 
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 65, 0),
                        child: Text("Shyam",style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                                          ),),
                      ),
                     Text("Comapany",style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400
                    ),),
                      ]
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text("Your Home Service Expert",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ),),
                Text("quick. affordable. trust"),
                
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextField(
                    
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter the Mobile Number",
                      border: OutlineInputBorder(),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(8, 12, 10, 0),
                          child: InkWell(
                            
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 500
                                ),
                                onSelect: (value) {
                                  setState(() {
                                    country = value;
                                  });
                                },
                              );
                            },
                            child: Text("${country.flagEmoji} + ${country.phoneCode}"),
                          ),
                        ),
                      ),
                    ),
                    controller: number,
                  ),
                ),
                SizedBox(height: 0),
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
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException ex) {},
                      codeSent: (String verificationid, int? resendtoken) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Otp(verificationId: verificationid)),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      phoneNumber: number.text.toString(),
                    );
                  },
                  child: Text('Login/Sign-up',style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
