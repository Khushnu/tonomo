import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tonomo/Widgets/buttons_widget.dart';

class MiniCalendarWidget extends StatefulWidget {
  const MiniCalendarWidget({super.key,});

  @override
  State<MiniCalendarWidget> createState() => _MiniCalendarWidgetState();
}

class _MiniCalendarWidgetState extends State<MiniCalendarWidget> {
  var initialDat = DateTime.now();
  var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  DateTime day = DateTime.now(); 
  DateTime  currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  int year = DateTime.now().year;
  int month = DateTime.now().month;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            CustomButtonWidget(height: 10, width: 15, child: Icon(Icons.arrow_back))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Table(
                      children: [
                        TableRow(
                         decoration:  const BoxDecoration(
                          color:  Color(0xffF9F5F6),
                        
                         ),
                            children: days
                                .map((e) => SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Inter',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ))
                                .toList()),
                        ...List.generate(5, (mainIndex) {
                          String da =
                              DateFormat('EEE').format(DateTime(year, month, 1));
                          return TableRow(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)
                            ),
                              children: List.generate(7, (childIndex) {
                            int minusIndex = days.indexOf(da);
                             day = DateTime(year, month,
                                (7 * mainIndex) + (childIndex + 1) - minusIndex);
                            // String dy = DateFormat('EEE').format(day);
                            Color tc = Colors.grey;
                            Color bg = const Color(0xffF9F5F6);
                            if (month == day.month && year == day.year) {
                              tc = Colors.black;
                            }
          
                            // if (day.month == initialDat.month&&day.year==initialDat.year) {
                            //   tc = Colors.black;
                            //   if (dy == 'Sun' || dy == 'Sat') {
                            //   tc = Colors.red.shade500;
                            // }
                            if (day.year == initialDat.year &&
                                day.month == initialDat.month &&
                                day.day == initialDat.day) {
                              tc = Colors.blue;
                              bg = Colors.yellow.shade50;
                            }
                              bool isSelected = 
                                                          (day.year ==
                                                                selectedDate.year &&
                                                            day.month ==
                                                                selectedDate.month &&
                                                            day.day ==
                                                                selectedDate.day); 

                              bool isCurrentDate = (currentDate.year == day.year &&
                                                    currentDate.month == day.month && currentDate.day == day.day);
          
                            if (kDebugMode) {
                              print(da);
                            }
                            return InkWell( 
                              onTap: (){
                                setState(() {
                                  currentDate = DateTime(selectedDate.year,selectedDate.month, day.day);
                                });
                              },
                              child: Container(
                                height: 60,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: isCurrentDate ? Colors.purple : bg, 
                                    border: isSelected ? Border.all(color: Colors.indigo) : null
                                ),
                                padding: const EdgeInsets.all(12),
                                alignment: Alignment.topRight,
                                child: Text(
                                  day.day.toString(),
                                  style: TextStyle(
                                     color: isSelected ? Colors.black : isCurrentDate ? Colors.white :  
                                      tc,
                                    fontFamily: 'Inter',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            );
                          }));
                        })
                      ],
        ),
      ],
    );
  }
}