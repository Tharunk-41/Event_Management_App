import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String name;
  final String srn;
  const Profile({Key? key, required this.name, required this.srn})
      : super(key: key);
  static const routeName = "/profile";
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String phoneNo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[100],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {},
        backgroundColor: Colors.orangeAccent,
      ),
      appBar: AppBar(
        title: Text('Student App'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(50.0, 0.0, 60.0, 0.0),
          color: Colors.blue[100],
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, //alligns the text at the center
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Pesu lads',
                  style: TextStyle(
                      fontSize: 50,
                      // backgroundColor: Colors.blue,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Lato'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/apple-intro.jpg'),
                  radius: 100.0,
                ),
                Container(
                  child: Text(widget.name,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          // backgroundColor: Colors.blue,
                          color: Colors.black,
                          fontFamily: 'Lato')),
                ),
                Text('SRN:PES2UG21CS576',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        // backgroundColor: Colors.blue,
                        color: Colors.black,
                        fontFamily: 'Lato')),
                Container(
                  margin: EdgeInsets.fromLTRB(30.0, 0.0, 60.0, 0.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'TextField',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )),
                    onChanged: (val) {
                      setState(() {
                        phoneNo = val;
                      });
                    },
                    // keyboardType: TextInputType.phone,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('button pressed');
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    ); //;
  }
}
