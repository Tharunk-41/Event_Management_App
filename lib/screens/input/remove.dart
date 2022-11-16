import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../redux/actions.dart';
import '../../redux/store.dart';
import '../landing/landing.dart';

class Remove extends StatefulWidget {
  static const routeName = '/remove';
  const Remove({Key? key}) : super(key: key);

  @override
  State<Remove> createState() => _RemoveState();
}

class _RemoveState extends State<Remove> {
  String name = '';

  late BuildContext appStateContext;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        appStateContext = context;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text('Remove Profile'),
          ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05,
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: Image.asset(
                        'assets/images/apple-intro.jpg',
                        height: 200.0,
                        width: 200.0,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: 0.0),
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: 'Please enter name',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                                width: 3.0,
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      StoreProvider.of<AppState>(context).dispatch(
                        RemoveStudent(
                          name: name,
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
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Remove Student'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
