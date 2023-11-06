// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, unused_element
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tonomo/Constants/colors.dart';
import 'package:tonomo/Model/topbuttonsmodel.dart';
import 'package:tonomo/Provider/statemanage.dart';
import 'package:tonomo/Widgets/buttons_widget.dart';
import 'package:tonomo/Widgets/calendarpagebuttons_widget.dart';
import 'package:tonomo/Widgets/labeltext_widget.dart';
// import 'package:tonomo/Widgets/minicalendar_widget.dart';
import 'package:tonomo/main.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget(
      {super.key, required this.expandedWidth, this.isExpanded = true});
  final double expandedWidth;
  final bool isExpanded;
  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  bool isVisible = false;
  bool isMonths = true;
  late bool isCurrentMonth;
  bool isCurrentDate = false;
  var currentSelected = weekButtonList[2];
  Color bgcolor = Colors.grey;
  var monthsofCurrentYear;
  DateTime selectedDate = DateTime.now();
  var initialDat = DateTime.now();
  var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  DateTime day = DateTime.now();
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  DateTime currentMonth = DateTime.now();
  DateTime selectedMonth = DateTime.now();
  // var dates = DaysInList();

  goToTodayDate() {
    setState(() {
      year = DateTime.now().year;
      month = DateTime.now().month;
    });
  }

  onPressedd() {
    goToTodayDate();
  }

  void updateYearAndMonth(DateTime newDate) {
    setState(() {
      year = newDate.year;
      month = newDate.month;
    });
  }

  List<DateTime> listOfWeek(DateTime date) {
    DateTime firstDayOfWeek = DateTime(date.year, date.month, 1);
    DateTime lastDayOfWeek = DateTime(date.year, date.month + 1, 0);
    List<DateTime> weekends = [];
    for (DateTime day = firstDayOfWeek;
        day.isBefore(lastDayOfWeek);
        day = day.add(const Duration(days: 1))) {
      if (day.weekday == DateTime.saturday || day.weekday == DateTime.sunday) {
        weekends.add(day);
      }
    }
    return weekends;
  }

  List<DateTime> monthsyear() {
    List<DateTime> months = [];
    for (int i = 1; i <= 12; i++) {
      months.add(DateTime(year, i));
      if (kDebugMode) {
        print(i);
      }
    }
    return months;
  }

  Future<void> selectDate() async {
    var picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2025));

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        updateYearAndMonth(selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selectedMonth;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
    List<DateTime> datesInList = [];
    var reservation = context.watch<StateManagement>().reserVationList;

    getDates() {
      for (var i = firstDayOfMonth;
          i.isBefore(lastDayOfMonth) || i.isAtSameMomentAs(lastDayOfMonth);
          i = i.add(const Duration(days: 1))) {
        datesInList.add(i);
      }
    }

    List<DateTime> yearsInMonth = monthsyear();
    final List<DateTime> listofWeeks = listOfWeek(DateTime(year, month));
    List<TimeOfDay> timeOfDay = [];
    for (int i = 1; i <= 23; i++) {
      timeOfDay.add(TimeOfDay(hour: i, minute: 0));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: screenHeight * 0.7,
          width: widget.expandedWidth,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [BoxShadow(color: Colors.grey)],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    DateFormat('MMMM-yyyy').format(DateTime(
                      year,
                      month,
                    )),
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  CalendarPageButtonWidget(
                    height: 40,
                    width: 190,
                    borderSide: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(weekButtonList.length, (index) {
                          bool isSelected =
                              currentSelected == weekButtonList[index];
                          return CustomButtonWidget(
                              height: 40,
                              width: 50,
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                setState(() {
                                  currentSelected = weekButtonList[index];
                                });
                              },
                              child: Center(
                                child: Text(
                                  weekButtonList[index].title,
                                  style: const TextStyle(),
                                ),
                              ));
                        })
                          ..insert(
                              1,
                              const SizedBox(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                ),
                              ))
                          ..insert(
                              3,
                              const SizedBox(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                ),
                              ))),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  CalendarPageButtonWidget(
                    height: 40,
                    width: 190,
                    borderSide: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButtonWidget(
                            height: 40,
                            width: 40,
                            onTap: () {
                              setState(() {
                                month--;
                              });
                            },
                            child: const Center(
                              child: Icon(Icons.arrow_left_rounded),
                            )),
                        CustomButtonWidget(
                          height: 40,
                          width: 65,
                          onTap: onPressedd,
                          border: Border(
                              right: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                              left: BorderSide(color: Colors.grey.shade300)),
                          child: const Text('Today'),
                        ),
                        CustomButtonWidget(
                          height: 40,
                          width: 40,
                          onTap: selectDate,
                          border: Border(
                              right: BorderSide(color: Colors.grey.shade300)),
                          child: const Center(
                            child: Icon(Icons.calendar_today),
                          ),
                        ),
                        CustomButtonWidget(
                            height: 40,
                            width: 40,
                            onTap: () {
                              setState(() {
                                month++;
                              });
                            },
                            child: const Center(
                              child: Icon(Icons.arrow_right_rounded),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(children: [
                if (currentSelected == weekButtonList[2])
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: screenHeight * 0.6,
                        width: screenWidth * 0.9,
                        color: Colors.white,
                        child: Table(
                          border: TableBorder.all(color: Colors.grey.shade400),
                          children: [
                            TableRow(
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
                              String da = DateFormat('EEE')
                                  .format(DateTime(year, month, 1));
                              return TableRow(
                                  children: List.generate(7, (childIndex) {
                                int minusIndex = days.indexOf(da);
                                day = DateTime(
                                    year,
                                    month,
                                    (7 * mainIndex) +
                                        (childIndex + 1) -
                                        minusIndex);
                                // String dy = DateFormat('EEE').format(day);
                                Color tc = Colors.grey;
                                Color bg = Colors.white;
                                if (month == day.month && year == day.year) {
                                  tc = Colors.black;
                                }

                                if (day.year == initialDat.year &&
                                    day.month == initialDat.month &&
                                    day.day == initialDat.day) {
                                  bgcolor = Colors.blue;
                                  bg = Colors.yellow.shade50;
                                }
                                    var reservationDay = reservation.where((element) =>
                                    element.from.year == day.year && 
                                    element.from.month == day.month &&
                                    element.from.day == day.day); 

                                   var reservationToDay = reservation.where((element) =>
                                    element.to.year == day.year && 
                                    element.to.month == day.month &&
                                    element.to.day == day.day); 

                                    // if(reservation.any((element) => day.isBefore(reservation[1].from.subtract(Duration(days: 1))) && day.isAfter(reservation[1].to.add(Duration(days: 1))))){
                                    //   tc = Colors.yellow;
                                    // }
                                   
                                    for(var reser in reservation){
                                        DateTime dayBefore=reser.from.subtract(const Duration(days: 1));
                                        DateTime dayAfter=reser.to.add(const Duration(days: 1));
                                        bool isAV=day.isBefore(dayBefore)&&day.isAfter(dayAfter);
                                        if(isAV){
                                          tc=Colors.yellow;
                                          bg=Colors.red.withOpacity(.5);
                                        }}
                                       
                                // if (day.year == initialDat.year &&
                                //     day.month == initialDat.month &&
                                //     day.day == initialDat.day) {
                                //   tc = Colors.blue;
                                //   bg = Colors.yellow.shade50;
                                // }
                                var selec = selectedDate;
                                selec = day;
                                if (kDebugMode) {
                                  print(da);
                                }
                                return Container(
                                  height: 90,
                                  width: 60,
                                  color: bg,
                                  padding: const EdgeInsets.all(12),
                                  alignment: Alignment.topRight,
                                  child: Column(
                                    children: [
                                      Text(
                                        selec.day.toString(),
                                        style: TextStyle(
                                          color: tc,
                                          fontFamily: 'Inter',
                                          fontSize: 18,
                                        ),
                                      
                                      ), 
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      reservationDay.isEmpty ? const Text('') :
                                    Text( reservationDay.map((e) => e.name ).join(','), style: TextStyle(color: tc),), 

                                     reservationToDay.isEmpty ? const Text('') :
                                    Text( reservationToDay.map((e) => e.name ).join(','), style: TextStyle(color: tc))
                                    ],
                                  ),
                                );
                              }));
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                //-------------------------------------Show Weekends When Selected -------------------------------------------------
                if (currentSelected == weekButtonList[1])
                  Container(
                    height: screenHeight * 0.6,
                    width: screenWidth * 0.9,
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView(children: [
                                DataTable(
                                    columnSpacing: 10,
                                    // headingRowColor: MaterialStatePropertyAll<Color>( isCurrentDate ? Colors.amber : Colors.grey),
                                    dividerThickness: 1,
                                    // border: TableBorder.all(color: Colors.transparent),
                                    columns: [
                                      const DataColumn(label: Text('')),
                                      ...List.generate(7, (index) {
                                        DateTime now = DateTime.now();
                                        DateTime day = DateTime(
                                            selectedDate.year,
                                            selectedDate.month,
                                            now.day + index);
                                        isCurrentDate =
                                            (day.year == initialDat.year &&
                                                day.month == initialDat.month &&
                                                day.day == initialDat.day);
                                        return DataColumn(
                                            label: Container(
                                          height: screenHeight * 0.1 - 60,
                                          width: screenWidth * 0.1 - 55,
                                          decoration: BoxDecoration(
                                              color: isCurrentDate
                                                  ? Colors.amber
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Center(
                                            child: Text(
                                              DateFormat('EEE MM/dd')
                                                  .format(day),
                                              style: TextStyle(
                                                  color: isCurrentDate
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ),
                                        ));
                                      })
                                    ],
                                    rows: [
                                      DataRow(cells: [
                                        const DataCell(Text('All day')),
                                        ...List.generate(
                                            7,
                                            (index) => DataCell(Container(
                                                  color: Colors.grey,
                                                  width: 110,
                                                  height: 30,
                                                )))
                                      ]),
                                      ...timeOfDay.map((e) {
                                        DateTime time = DateTime(
                                            initialDat.year,
                                            initialDat.month,
                                            initialDat.day,
                                            e.hour);

                                        String formattedText = time.hour < 12
                                            ? '${time.hour} AM'
                                            : '${time.hour} PM';
                                        DateTime currentTime = DateTime.now();

                                        bool isCurrentTime =
                                            (currentTime.year == time.year &&
                                                currentTime.month ==
                                                    time.month &&
                                                currentTime.day == time.day &&
                                                time.hour == currentTime.hour);
                                        return DataRow(cells: [
                                          DataCell(Container(
                                              height: 40,
                                              width: 80,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: isCurrentTime
                                                      ? Colors.amber
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Text(formattedText))),
                                          ...List.generate(
                                              7,
                                              (index) {
                                                DateTime dayC = DateTime(
                                            selectedDate.year,
                                            selectedDate.month,
                                            DateTime.now().day + index);
                                    bool isCurrentDateC =
                                            (dayC.year == initialDat.year &&
                                                dayC.month == initialDat.month &&
                                                dayC.day == initialDat.day);
                                               return DataCell(Container(
                                                    width: 110,
                                                    height: 38,
                                                    decoration: BoxDecoration(
                                                      color: isCurrentDateC &&isCurrentTime ? Colors.amber : Colors.transparent, 
                                                      borderRadius: BorderRadius.circular(12)
                                                    ),
                                                  ));})
                                        ]);
                                      })
                                    ]),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),


//---------------------------------------------------Shows Time When selected ------------------------------------------------------------

                if (currentSelected == weekButtonList[0])
                  Container(
                    height: screenHeight * 0.6,
                    width: screenWidth * 0.9,
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 30,
                                width: screenWidth * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.amber.shade200,
                                    borderRadius: BorderRadius.circular(7)),
                                padding: const EdgeInsets.all(3.0),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('All day'),
                                      Container(
                                          height: 20,
                                          width: screenWidth * 0.5,
                                          color: Colors.amber.shade200)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: timeOfDay.map((e) {
                                    DateTime time = DateTime(
                                        initialDat.year,
                                        initialDat.month,
                                        initialDat.day,
                                        e.hour);
                                    String formattedText = time.hour < 12
                                        ? '${time.hour}AM'
                                        : '${time.hour}PM';
                                    var formt = DateTime(
                                        initialDat.year,
                                        initialDat.month,
                                        initialDat.day,
                                        initialDat.hour);
                                    var formattedTime =
                                        DateFormat('HH a').format(formt);
                                    bool isCurrentTime =
                                        time.hour == formt.hour;
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        height: 30,
                                        width: screenWidth * 0.9,
                                        decoration: BoxDecoration(
                                            color: isCurrentTime
                                                ? Colors.amber.shade200
                                                : Colors.yellow.shade50,
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        padding: const EdgeInsets.all(3.0),
                                        child: Center(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                isCurrentTime
                                                    ? formattedTime
                                                    : formattedText.toString(),
                                                style: TextStyle(
                                                    color: isCurrentTime
                                                        ? const Color.fromARGB(
                                                            255, 50, 111, 203)
                                                        : Colors.black),
                                              ),
                                              Container(
                                                height: 20,
                                                width: screenWidth * 0.5,
                                                color: isCurrentTime
                                                    ? Colors.amber.shade200
                                                    : Colors.yellow.shade50,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ])
            ],
          ),
        ),
        if (widget.isExpanded)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 2),
              child: Container(
                height: screenHeight * 0.8,
                width: screenWidth * 0.2 - 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                        height: screenHeight * 0.1 - 40,
                width: screenWidth  , 
               decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12), 
                ), color: AllColors.kReservationWidgetColor, 
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(1, 1))]
               ),
               child: const Center(child: Text('Reservations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),),
                    ),
                    Expanded(
                      child: ListView.builder(
                             // padding: const EdgeInsets.all(10).copyWith(top: 8, left: 5, right: 5, bottom: 5),
                              itemCount: reservation.length,
                              itemBuilder: (_, index) {
                               
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: screenHeight * 0.1, 
                                    width:  screenWidth, 
                                    decoration:  BoxDecoration(
                                      color: Colors.grey.shade200, 
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                   child: Column(
                                    children: [
                                      Container(
                                        height: screenHeight * 0.1 - 60, 
                                        width: screenWidth, 
                                         decoration:  BoxDecoration(
                                      color: AllColors.kOpenCheckoutColor, 
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('User name :'), 
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(reservation[index].name), 
                                          const Spacer(),
                                          const Text('Item :'),
                                           const SizedBox(
                                            width: 5,
                                          ),
                                          Text(reservation[index].items)
                                        ],
                                      ),
                                    ),
                                      ), 
                                      const SizedBox(
                                        height: 10,
                                      ), 
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                           Column(
                                           
                                             children: [
                                               const LabelTextWidget(title: 'From', textColor: Colors.black, fontSize: 15), 
                                        const SizedBox(
                                          width: 10,
                                        ),  Text(DateFormat('dd-MMM').format(reservation[index].from)),
                                             ],
                                           ), 
                                            Column(
                                           
                                             children: [
                                               const LabelTextWidget(title: 'To', textColor: Colors.black, fontSize: 15), 
                                        const SizedBox(
                                          width: 10,
                                        ),  Text(DateFormat('dd-MMM').format(reservation[index].to)),
                                             ],
                                           ),
                                            Column(
                                           
                                             children: [
                                               const LabelTextWidget(title: 'Duration', textColor: Colors.black, fontSize: 15), 
                                        const SizedBox(
                                          width: 10,
                                        ),  Text('${reservation[index].duration} Days'),
                                             ],
                                           ),
                                                                          
                                          ],
                                        ),
                                      )
                                    ],
                                   ),
                                  ),
                                );
                              }),
                    ),
                  ],
                )
              ),
            ),
          ),
      ],
    );
  }
}