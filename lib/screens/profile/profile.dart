import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../redux/actions.dart';
import '../../redux/store.dart';
import '../landing/landing.dart';

class Profile extends StatefulWidget {
  static const routeName = '/profile';
  final String name;
  final String srn;
  final String phoneNo;
  final int y,m,h,n,d,i;
  const Profile(
      {Key? key, required this.name, required this.srn, required this.phoneNo,required this.y,required this.m,required this.h,required this.n,required this.d,required this.i})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String phoneNo = ''; int y=0,m=0,h=0,n=0,d=0,i=0;
  @override
  Widget build(BuildContext context) {
    DateTime a=DateTime(widget.y,widget.m,widget.d,widget.h,widget.n,0);
    DateTime b=DateTime.now();
    String diff=b.isBefore(a)?a.difference(b).toString():'Time Lapsed';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(

          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Due Time(hrs): $diff',
                style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.blue,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/apple-intro.jpg'),
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xff2596be),
                  fontFamily: 'Lato',
                ),
              ),
              Text(
                widget.srn,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xff2596be),
                  fontFamily: 'Lato',
                ),
              ),
              Text(
                widget.phoneNo,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xff2596be),
                  fontFamily: 'Lato',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              ElevatedButton(
                onPressed: () {
                  StoreProvider.of<AppState>(context).dispatch(
                    RemoveStudent(
                      name: widget.name,
                    ),
                  );
                  Navigator.pushReplacementNamed(
                    context,
                    Landing.routeName,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.trash,
                      ),
                      Text('Remove Event'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
