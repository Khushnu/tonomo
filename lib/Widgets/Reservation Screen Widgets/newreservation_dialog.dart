import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tonomo/Provider/statemanage.dart';
import 'package:tonomo/Services/dummyreservation.dart';
import 'package:tonomo/Services/dummyuser.dart';
import 'package:tonomo/Widgets/Reservation%20Screen%20Widgets/stepper_widgert.dart';
import 'package:tonomo/Widgets/labeltext_widget.dart';
import 'package:tonomo/Widgets/textfield_widget.dart';
import 'package:tonomo/main.dart';

class ReservationAddWidget extends StatefulWidget {
  const ReservationAddWidget({super.key});

  @override
  State<ReservationAddWidget> createState() => _ReservationAddWidgetState();
}

class _ReservationAddWidgetState extends State<ReservationAddWidget> {
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController userText = TextEditingController();
  TextEditingController itemText = TextEditingController();
 
 DummyUser? initialValue;

  Future<void> showDates(TextEditingController text) async {
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pick != null) {
      setState(() {
        text.text = DateFormat('dd/MM/yyyy').format(pick);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(bottom: 20).copyWith(bottom: 0,),
      // insetAnimationCurve: Curves.bounceIn,
      // insetAnimationDuration: const Duration(milliseconds: 500),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.indigo.shade200,
          )),
      // backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.8 + 10,
        width: MediaQuery.of(context).size.width * 0.5 ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 49, vertical: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 - 50,
                width: MediaQuery.of(context).size.width * 0.6,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LabelTextWidget(
                        title: 'Add Reservation',
                        textColor: Colors.black,
                        fontSize: 18), 
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade100, 
                                  child: const Icon(Icons.close),
                                ),
                              )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelTextWidget(
                          title: 'Name of Item',
                          textColor: Colors.black54,
                          fontSize: 17),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          textEditingController: itemText,
                          hintText: 'Add Item name',
                          textFieldWidth: screenWidth * 0.2),
                      const SizedBox(
                        height: 10,
                      ),
                      const LabelTextWidget(
                          title: 'Add User',
                          textColor: Colors.black54,
                          fontSize: 16),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: initialValue,
                          hint: const Text('Select User'),
                        items: dumyUser.map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),)).toList(),
                        onChanged: (value){
                          setState(() {
                            initialValue = value!;
                          });
                        },))
                      // TextFieldWidget(
                      //     textEditingController: userText,
                      //     hintText: 'Add User',
                      //     textFieldWidth: screenWidth * 0.2, 
                      //     onTap: (){

                      //     },),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelTextWidget(
                          title: 'When', textColor: Colors.grey, fontSize: 20),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          textEditingController: fromDate,
                          onTap: () {
                            showDates(fromDate);
                          },
                          hintText: 'From',
                          textFieldWidth: screenWidth * 0.2),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          textEditingController: toDate,
                          onTap: () {
                            showDates(toDate);
                          },
                          hintText: 'To',
                          textFieldWidth: screenWidth * 0.2),
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: StepperWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: InkWell(
                        onTap: () {
              try {
                var fromparse = DateFormat('dd/MM/yyyy').parseStrict(fromDate.text);
              var toparse = DateFormat('dd/MM/yyyy').parseStrict(toDate.text);
              
                Duration duration = toparse.difference(fromparse);
                // int days = duration.inDays; 
              
              
              setState(() {
                context.read<StateManagement>().addReserVation(DummyReservation(
                    name: itemText.text,
                    from: fromparse,
                    to: toparse,
                    duration: '${duration.inDays ==0?duration.inHours:duration.inDays}',
                    user: initialValue!.name,
                    items: itemText.text));
              });
              
              Navigator.of(context).pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 590, vertical: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  content: const Text('Reservation Saved Successfully')));
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 590, vertical: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  content:  Text('Error $e')));
              }
              
              },
                        child: Container(
              height: screenHeight * 0.1 - 49,
              width: screenWidth * 0.6 - 25,
              decoration: BoxDecoration(
                  color: Colors.indigo.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'Confirm Reservation',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
                        ),
                      ),
            )
          ],
        ),
      ),
    );
  }
}
