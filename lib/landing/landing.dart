import 'package:flt_p/profile/profile.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  static const routename = "/";
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.05,
            horizontal: MediaQuery.of(context).size.width * 0.01,
          ),
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Image.asset('assets/images/apple-intro.jpg'),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Profile(name: "tharun", srn: "pes2ug21cs576")));
                },
                child: ListTile(
                  title: Text("tharun"),
                  subtitle: Text("pes2ug21cs576"),
                ),
              ),
              ListTile(
                title: Text("tharun"),
                subtitle: Text("pes2ug21cs576"),
              ),
              ListTile(
                title: Text("tharun"),
                subtitle: Text("pes2ug21cs576"),
              ),
              ListTile(
                title: Text("tharun"),
                subtitle: Text("pes2ug21cs576"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
