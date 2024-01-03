import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tonomo/Services/steppermodel.dart';
import 'package:tonomo/Widgets/textfield_widget.dart';
import 'package:tonomo/main.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int currentStep = 0;
  TextEditingController commentController = TextEditingController();
  DateTime currentTime = DateTime.now();
  List<Stepss> commentsData = [];
  var format;

  addinList() {
    setState(() {
      commentsData.insert(0, Stepss(time: currentTime, coment: commentController.text));
      commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    format = DateFormat('HH:mm').format(currentTime);

    return SizedBox(
      height: screenHeight * 0.4 + 70,
      width: screenWidth * 0.3 - 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       
        children: [
          SizedBox(
            height: screenHeight * 0.2,
            width: screenWidth * 0.3,
            child: Stepper(
              steps: [
                Step(
                  title: Transform.translate(
                    offset: const Offset(-72, 50),
                    child: Row(
                      children: [
                        Text(format),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(child: Text('WA')),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFieldWidget(
                          textEditingController: commentController,
                          hintText: 'Comments',
                          textFieldWidth: screenWidth * 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    InkWell(
                      onTap: addinList,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        child: Container(
                          height: screenHeight * 0.1 - 60,
                          width: screenWidth * 0.1 - 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.blue.shade300,
                          ),
                          child: const Center(
                            child: Text(
                              'Add Comment',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
            SizedBox(
              height: screenHeight * 0.2, 
              width: screenWidth * 0.2,
              child: Transform.translate(
                offset: const Offset(-48, 0),
                child: SingleChildScrollView(child: Column(
                  children: commentsData.isEmpty ? [
                    SizedBox(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.3,
                      child: Row(
                        children: [
                          Text(DateFormat('HH:mm a').format(currentTime), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                           const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: screenHeight * 0.1,
                            child: const VerticalDivider(
                              color: Colors.grey,
                            ),
                          ),
                         
                          Transform.translate(
                            offset: const Offset(-13, 0),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          const Text('WA', style: TextStyle(fontWeight: FontWeight.bold)),
                         
                          const Expanded(
                            child: Text('Created Reservation'),
                          ),
                        ],
                      ),
                    )
                  ]  :  commentsData.map((e) => SizedBox(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.3,
                      child: Row(
                        children: [
                           Text(DateFormat('HH:mm a').format(currentTime), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: screenHeight * 0.1,
                            child: const VerticalDivider(
                              color: Colors.grey,
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-12, 0),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          const Text('WA', style: TextStyle()),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(e.coment),
                          ),
                        ],
                      ),
                    )).toList(),
                )),
              ),
            )
        ],
      ),
    );
  }
}
