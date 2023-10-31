import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tonomo/Provider/statemanage.dart';
import 'package:tonomo/Services/dummyreservation.dart';
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
      contentPadding: const EdgeInsets.only(bottom: 20).copyWith(bottom: 0),
      // insetAnimationCurve: Curves.bounceIn,
      // insetAnimationDuration: const Duration(milliseconds: 500),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.indigo.shade200,
          )),
      // backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.8 - 25,
        width: MediaQuery.of(context).size.width * 0.6 - 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1 - 50,
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 45),
              decoration: BoxDecoration(
                  color: Colors.indigo.shade200,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.indigo.shade200,
                  )),
              child: const Row(
                children: [
                  LabelTextWidget(
                      title: 'Add Reservation',
                      textColor: Colors.white,
                      fontSize: 18)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                      TextFieldWidget(
                          textEditingController: userText,
                          hintText: 'Add User',
                          textFieldWidth: screenWidth * 0.2),
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
              padding: EdgeInsets.symmetric(horizontal: 90),
              child: StepperWidget(),
            ),
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            setState(() {
              context.read<StateManagement>().addReserVation(DummyReservation(
                  name: itemText.text,
                  from: fromDate.text,
                  to: toDate.text,
                  duration: '',
                  user: userText.text,
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
        )
      ],
    );
  }
}
