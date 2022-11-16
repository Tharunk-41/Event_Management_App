import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../redux/store.dart';
import '../input/input.dart';
import '../input/remove.dart';
import '../profile/profile.dart';

class Landing extends StatefulWidget {
  static const routeName = '/';
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  late BuildContext appStateContext;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        appStateContext = context;
        return Scaffold(
          backgroundColor: Color(0xFFA0D6FF),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  CircleAvatar(
                    radius: 100.0,
                    backgroundImage:
                        AssetImage('assets/images/apple-intro.jpg'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ...state.students!
                      .map(
                        //...students.map(
                        (e) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(
                                  name: e.name,
                                  srn: e.srn,
                                  phoneNo: e.phoneNo,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(e.name),
                            subtitle: Text(e.srn),
                            trailing: FaIcon(
                              FontAwesomeIcons.user,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Input.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Add Student'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Remove.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Remove Student'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
