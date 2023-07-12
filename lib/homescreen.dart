import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcodegenerator/qrcodescanner.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController name = TextEditingController();
TextEditingController phone_number = TextEditingController();
TextEditingController address = TextEditingController();


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.height * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name.text.isEmpty ||
                        phone_number.text.isEmpty ||
                        address.text.isEmpty
                    ? Container()
                    : Center(
                        child: FadedScaleAnimationWidget(
                          child: QrImage(
                            data:
                                "${name.text},${phone_number.text}, ${address.text}",
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        ),
                      ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Center(
                    child: Text(
                  "Enter your Data",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )),
                SizedBox(
                  height: size.height * 0.05,
                ),
                // const Text("Enter Your Name",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
                // SizedBox(height: size.height*0.03),
                TextFormField(
                  controller: name,
                  decoration:
                      const InputDecoration(hintText: "Enter Your name"),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                // const Text("Enter Your Phone Number",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
                // SizedBox(height: size.height*0.03),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phone_number,
                  decoration: const InputDecoration(
                      hintText: "Enter Your Phone number"),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                // const Text("Enter Your Address",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
                // SizedBox(height: size.height*0.03),
                TextFormField(
                  controller: address,
                  decoration:
                      const InputDecoration(hintText: "Enter Your Address"),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const QRCodeScanner()));
                    },
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.black),
                      mouseCursor:MaterialStateProperty.all(SystemMouseCursors.allScroll)
                    ),
                    child: const Text(
                      "Scan QR Code",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18,color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
