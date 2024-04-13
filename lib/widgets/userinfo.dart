import 'package:flutter/material.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/components/customforuser.dart';
import 'package:google_fonts/google_fonts.dart';

class Usersettings extends StatefulWidget {
  const Usersettings({super.key});

  @override
  State<Usersettings> createState() => _UsersettingsState();
}

class _UsersettingsState extends State<Usersettings> {
  TextEditingController date = TextEditingController();
  TextEditingController tele = TextEditingController();
  TextEditingController ad1 = TextEditingController();
  TextEditingController ad2 = TextEditingController();
  TextEditingController postal = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Modify your account",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.lightGreen, width: 2),
                    // This sets the radius to make it a circle
                    color: Colors.white, // Background color of the oval
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2012/04/13/21/07/user-33638_640.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Aditya K',
                  style: GoogleFonts.getFont('Poppins',
                      fontSize: 23, fontWeight: FontWeight.w500),
                ),
              ),
              Text("aditya@gmail.com"),
              SizedBox(
                height: 40,
              ),
              Customtextuser(
                  controller: date,
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                  hinttext: "Date of birth"),
              Customtextuser(
                  controller: date,
                  prefixIcon: Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                  hinttext: "Telephone"),
              Customtextuser(
                  controller: date,
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Colors.grey,
                  ),
                  hinttext: "Address 1"),
              Customtextuser(
                  controller: date,
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Colors.grey,
                  ),
                  hinttext: "Address 2"),
              Customtextuser(
                  controller: date,
                  prefixIcon: Icon(
                    Icons.directions,
                    color: Colors.grey,
                  ),
                  hinttext: "Postal code"),
              Customtextuser(
                  controller: date,
                  prefixIcon: Icon(
                    Icons.house,
                    color: Colors.grey,
                  ),
                  hinttext: "City"),
              Customtextuser(
                  controller: date,
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Colors.grey,
                  ),
                  hinttext: "Country"),
              SizedBox(
                height: 26,
              ),
              Custombutton(
                  text: "Confirm",
                  onTap: () {},
                  color: Color.fromARGB(255, 61, 89, 32),
                  textcolor: Colors.white),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 204, 201),
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                          child: Text(
                        "Delete",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 242, 65, 53),
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
