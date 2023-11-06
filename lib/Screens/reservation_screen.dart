import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tonomo/Constants/colors.dart';
import 'package:tonomo/Provider/statemanage.dart';
import 'package:tonomo/Widgets/Reservation%20Screen%20Widgets/newreservation_dialog.dart';
import 'package:tonomo/Widgets/buttons_widget.dart';
import 'package:tonomo/Widgets/calendarpagebuttons_widget.dart';
import 'package:tonomo/Widgets/labeltext_widget.dart';
import 'package:tonomo/Widgets/textfield_widget.dart';
import 'package:tonomo/main.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  String dropDownValue = 'name';
  int isvalue = 12345;
  bool isFilterSelected = false;
  List dropDownItems = <String>[
    'name',
    'status',
    'brand',
    'model',
    'Ascending',
    'Dscending'
  ];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
    var reservationlist = context.watch<StateManagement>().reserVationList;
    return Scaffold(
        backgroundColor: AllColors.kDashboardBackground,
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.1 - 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'All items',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Export',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return const ReservationAddWidget();
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AllColors.kLeftMenuSelectionColor,
                          ),
                          child: const Text(
                            'New Reservation',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: SizedBox(
                  height: screenHeight,
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 40,
                                child: TextFieldWidget(
                                  hintText: 'Search',
                                  textFieldWidth: screenWidth * 0.2,
                                  suffix: const Icon(Icons.search),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomButtonWidget(
                              height: 40,
                              width: 50,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                              bgColor: Colors.white,
                              onTap: () {
                                setState(() {
                                  isFilterSelected = !isFilterSelected;
                                });
                              },
                              child: const Center(
                                child: Icon(Icons.filter_list_rounded),
                              ),
                            ),
                            const Spacer(),
                            CustomButtonWidget(
                              height: 40,
                              width: 70,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                              bgColor: Colors.white,
                              child: Center(
                                  child: PopupMenuButton<String>(
                                      initialValue: dropDownValue,
                                      onSelected: (String? value) {
                                        setState(() {
                                          dropDownValue = value!;
                                        });
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Sort'),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                      itemBuilder: (BuildContext context) =>
                                          dropDownItems
                                              .map<PopupMenuItem<String>>((e) =>
                                                  PopupMenuItem(
                                                      value: e, child: Text(e)))
                                              .toList())),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CalendarPageButtonWidget(
                              height: 40,
                              width: 104,
                              borderSide:
                                  Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButtonWidget(
                                      height: 40,
                                      width: 50,
                                      border: const Border(
                                          right:
                                              BorderSide(color: Colors.grey)),
                                      onTap: () {
                                        setState(() {});
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.list_alt,
                                          color: Colors.grey.shade600,
                                        ),
                                      )),
                                  CustomButtonWidget(
                                    height: 40,
                                    width: 50,
                                    onTap: () {
                                      setState(() {});
                                    },
                                    border: Border(
                                        right: BorderSide(
                                            color: Colors.grey.shade300)),
                                    child: Center(
                                      child: Icon(
                                        Icons.grid_view,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isFilterSelected)
                        Row(
                          children: [
                            CustomButtonWidget(
                              height: 40,
                              width: 120,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                              bgColor: Colors.white,
                              child: Center(
                                  child: PopupMenuButton<String>(
                                      initialValue: dropDownValue,
                                      onSelected: (String? value) {
                                        setState(() {
                                          dropDownValue = value!;
                                        });
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Any label'),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                      itemBuilder: (BuildContext context) =>
                                          dropDownItems
                                              .map<PopupMenuItem<String>>((e) =>
                                                  PopupMenuItem(
                                                      value: e, child: Text(e)))
                                              .toList())),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            CustomButtonWidget(
                              height: 40,
                              width: 120,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                              bgColor: Colors.white,
                              child: Center(
                                  child: PopupMenuButton<String>(
                                      initialValue: dropDownValue,
                                      onSelected: (String? value) {
                                        setState(() {
                                          dropDownValue = value!;
                                        });
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Any User'),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                      itemBuilder: (BuildContext context) =>
                                          dropDownItems
                                              .map<PopupMenuItem<String>>((e) =>
                                                  PopupMenuItem(
                                                      value: e, child: Text(e)))
                                              .toList())),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            CustomButtonWidget(
                              height: 40,
                              width: 120,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                              bgColor: Colors.white,
                              child: Center(
                                  child: PopupMenuButton<String>(
                                      initialValue: dropDownValue,
                                      onSelected: (String? value) {
                                        setState(() {
                                          dropDownValue = value!;
                                        });
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Any Time'),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                      itemBuilder: (BuildContext context) =>
                                          dropDownItems
                                              .map<PopupMenuItem<String>>((e) =>
                                                  PopupMenuItem(
                                                      value: e, child: Text(e)))
                                              .toList())),
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: screenHeight * 0.7,
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12)),
                          child: DataTable(
                              // showCheckboxColumn: true,

                              columns: [
                                DataColumn(
                                  onSort: (columnIndex, ascending) {},
                                  // numeric: true,
                                  label: const LabelTextWidget(
                                      title: 'Name',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'From',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'To',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'Duration',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'User',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'Items',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                              ],
                              rows: reservationlist.isEmpty
                                  ? <DataRow>[
                                      DataRow(
                                        cells: [
                                          DataCell(
                                            Transform.translate(
                                              offset: const Offset(522, 50),
                                              child: const Center(
                                                child: Text(
                                                  'No data available',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const DataCell(Text('')),
                                          const DataCell(Text('')),
                                          const DataCell(Text('')),
                                          const DataCell(Text('')),
                                          const DataCell(Text(''))
                                        ],
                                      ),
                                    ]
                                  : List.generate(reservationlist.length,
                                      (index) {
                                      var e = reservationlist[index];

                                      return DataRow(
                                          selected: e.isSelected,
                                          onSelectChanged: (bool? v) {
                                            setState(() {
                                              e.isSelected = v!;
                                            });
                                          },
                                          cells: [
                                            DataCell(SizedBox(
                                          width: e.isSelected ? screenWidth * 0.1 : 60,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(e.name),
                                               const SizedBox(
                                                width: 10, 
                                               
                                              ), 
                                             if(e.isSelected)
                                              SizedBox(
                                                width: screenWidth * 0.1 - 80,
                                                child: InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      context.read<StateManagement>().removeReservation(index);
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          behavior: SnackBarBehavior.floating,
                                                          margin: const EdgeInsets.symmetric(horizontal:590, vertical: 30),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(20)
                                                          ),
                                                          content: Text('${e.name} Reservation deleted Successfully')));
                                                    });
                                                  },
                                                  child: const Card(
                                                    child: Center(child: Text('Delete'))),
                                                ),
                                              )
                                            ],
                                          ),
                                        ) ),
                                            DataCell(Text(DateFormat('dd/MM/yyyy').format(e.from))),
                                            DataCell(Text(DateFormat('dd/MM/yyyy').format(e.to))),
                                            DataCell(Text('${e.duration} Days')),
                                            DataCell(Text(e.user)),
                                            DataCell(Text(e.items))
                                          ]);
                                    })))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
