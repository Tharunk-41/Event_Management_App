import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/student.dart';
import '../../redux/actions.dart';
import '../../redux/store.dart';
import '../landing/landing.dart';
import 'package:intl/intl.dart';

class Input extends StatefulWidget {
  static const routeName = '/input';
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String name = '';
  int y=0,m=0,h=0,n=0,d=0,i=0;
  TextEditingController srn = TextEditingController();
  TextEditingController phoneNo = TextEditingController();

  void initState() {
    srn.text = "";
    phoneNo.text = '';
    super.initState();
  }

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
            title: Text('Add Event'),
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
                          hintText: 'EVENT DETAILS',
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
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: 0.0),
                      child: Center(
                          child: TextField(
                        controller: srn, //editing controller of this TextField
                        decoration: InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), //icon of text field
                            labelText: "Enter Date" //label text of field
                            ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd-mm-yyyy').format(pickedDate);
                            setState(() {
                              y=pickedDate.year;m=pickedDate.month;d=pickedDate.day;
                              srn.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          }
                        },
                      ))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: 0.0),
                      child: TextField(
                        controller: phoneNo,
                        decoration: InputDecoration(
                            icon: Icon(Icons.timer), labelText: "Enter Time"),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );
                          if (pickedTime != null) {
                            DateTime parsedTime = DateFormat.jm()
                                .parse(pickedTime.format(context).toString());
                            String formattedTime =
                                DateFormat('hh:mm:ss').format(parsedTime);
                            setState(() {
                              h=pickedTime.hour;n=pickedTime.minute;
                              phoneNo.text =
                                  formattedTime; //set the value of text field.
                            }
                            );
                          }
                        },
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.075,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Student newStudent = Student(
                        y:y,m:m,d:d,h:h,n:n,i:i,
                        name: name,
                        srn: srn.text,
                        phoneNo: phoneNo.text,
                      );
                      StoreProvider.of<AppState>(context).dispatch(
                        AddStudent(
                          newStudent: newStudent,
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
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Add Event'),
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
