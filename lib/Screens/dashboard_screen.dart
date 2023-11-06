import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:tonomo/Constants/colors.dart';
import 'package:tonomo/Provider/statemanage.dart';
import 'package:tonomo/Widgets/dashboard_widget_container.dart';
import 'package:tonomo/Widgets/labeltext_widget.dart';
import 'package:tonomo/main.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key, this.expandedWidth});
  final double? expandedWidth;
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  Map<String, double> dataMap = {'':0};
  
  Map<String, String> legend ={};

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
    var itemList = context.watch<StateManagement>().itemList;
    var reserVationList = context.watch<StateManagement>().reserVationList;
    dataMap={};
    for (var item in itemList) {
        // if(dataMap.keys.any((element) {
        // var a=element.split(' ');
        // return a.last==item.category;
        // })){
          
        // }else{
          var itemLength=
            itemList.where((element) => element.category==item.category).length;
          final mapd={
            '$itemLength  ${item.category}':itemLength.toDouble(),

          };
          dataMap.addEntries(mapd.entries);
        // }
// dataMap[item.name] = item.name.length.toDouble();
//       legend[item.name] = item.name.length.toString();
    }
    print(dataMap);

    return Container(
      height: screenHeight,
      width: widget.expandedWidth,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
          ),
          child: SingleChildScrollView(
            // padding: EdgeInsets.zero,
            child: Wrap(
              alignment: WrapAlignment.start,
              runSpacing: 15,
              spacing: 30,
              children: [
                DashBoardContainerWidget(
                  titleColor: AllColors.kStatusWidgetCOlor,
                  title: 'Items By Status',
                  height: screenHeight * 0.4 - 20,
                  width: screenWidth * 0.4 - 50,
                  child: Center(
                    child: itemList.isNotEmpty ? PieChart(
                      dataMap: dataMap,
                      legendOptions:  LegendOptions(legendLabels: legend, 
                      ),
                      chartRadius: 200,
                      ringStrokeWidth: 10,
                      chartValuesOptions: const ChartValuesOptions(
                          showChartValuesOutside: false,
                          showChartValuesInPercentage: false,
                          showChartValues: false,
                          showChartValueBackground: false),
                      centerText: '${itemList.length.toInt()} Available',
                      centerTextStyle: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontSize: 18),
                      colorList: AllColors.listofColors,
                      chartType: ChartType.ring,
                    ) : PieChart(
                      dataMap: const {
                        '0':0
                      },
                      legendOptions:  LegendOptions(legendLabels: legend, 
                      ),
                      chartRadius: 200,
                      ringStrokeWidth: 10,
                      chartValuesOptions: const ChartValuesOptions(
                          showChartValuesOutside: false,
                          showChartValuesInPercentage: false,
                          showChartValues: false,
                          showChartValueBackground: false),
                      centerText: '0 Available',
                      centerTextStyle: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontSize: 18),

                      chartType: ChartType.ring,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashBoardContainerWidget(
                      titleColor: AllColors.kReservationWidgetColor,
                      title: 'Reservations',
                      height: screenHeight * 0.4 - 20,
                      width: screenWidth * 0.2 - 50,
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 104),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const LabelTextWidget(
                                title: '2',
                                textColor: Colors.red,
                                fontSize: 40),
                            const LabelTextWidget(
                                title: 'Overdue',
                                textColor: Colors.black,
                                fontSize: 17),
                            const SizedBox(
                              height: 60,
                            ),
                            LabelTextWidget(
                                title: '${itemList.length.toInt() == 0 ? 0 : itemList.length.toInt()}',
                                textColor: Colors.black,
                                fontSize: 40),
                            const LabelTextWidget(
                                title: 'Booked',
                                textColor: Colors.black,
                                fontSize: 17),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DashBoardContainerWidget(
                      titleColor: AllColors.kCheckoutCOlor,
                      title: 'Check-Outs',
                      height: screenHeight * 0.4 - 20,
                      width: screenWidth * 0.2 - 50,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 104),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            LabelTextWidget(
                                title: '2',
                                textColor: Colors.red,
                                fontSize: 40),
                            LabelTextWidget(
                                title: 'Overdue',
                                textColor: Colors.black,
                                fontSize: 17),
                            SizedBox(
                              height: 60,
                            ),
                            LabelTextWidget(
                                title: '0',
                                textColor: Colors.black,
                                fontSize: 40),
                            LabelTextWidget(
                                title: 'Open',
                                textColor: Colors.black,
                                fontSize: 17),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                DashBoardContainerWidget(
                  titleColor: AllColors.kReserVationListColor,
                    title: 'Open Observation',
                    height: screenHeight * 0.4 - 20,
                    width: screenWidth * 0.4 - 50,
                    child: reserVationList.isEmpty ? const Center(child: Text('No Reservation Found'),) : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: reserVationList.length,
                        itemBuilder: (_, index) {
                         
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10).copyWith(top: 0),
                            child: ExpansionTile(
                              backgroundColor:AllColors.kExpansionTileCOlor ,
                              textColor: Colors.white, 
                              iconColor: Colors.white,
                              collapsedShape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))
                              ),
                              collapsedBackgroundColor: AllColors.kExpansionTileCOlor, 
                              collapsedTextColor: Colors.white, 
                              collapsedIconColor: Colors.white,
                              leading: CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                child:  Text(reserVationList[index].name.substring(0,1))) ,
                              title: Text(reserVationList[index].name),
                              children: [
                                Container(
                                  height: screenHeight * 0.1 - 20,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Item Name'),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  reserVationList[index].items),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('From '),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(DateFormat('dd/MM/yyyy').format(reserVationList[index].from)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('To'),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(DateFormat('dd/MM/yyyy').format(reserVationList[index].to)),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        })),
                DashBoardContainerWidget(
                  titleColor: AllColors.kOpenCheckoutColor,
                    title: 'Open Check-outs',
                    height: screenHeight * 0.4 - 20,
                    width: screenWidth * 0.4 - 90,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.exit_to_app,
                            size: 50,
                          ),
                          const Text('New upcoming check-outs '),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: const Center(
                              child: Text('New Check-outs'),
                            ),
                          )
                        ],
                      ),
                    )),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashBoardContainerWidget( 
                      titleColor: AllColors.kObservationColor,
                      title: 'Reservations',
                      height: screenHeight * 0.4 - 20,
                      width: screenWidth * 0.2 - 20,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 104),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            LabelTextWidget(
                                title: '2',
                                textColor: Colors.red,
                                fontSize: 40),
                            LabelTextWidget(
                                title: 'Overdue',
                                textColor: Colors.black,
                                fontSize: 17),
                            SizedBox(
                              height: 60,
                            ),
                            LabelTextWidget(
                                title: '0',
                                textColor: Colors.black,
                                fontSize: 40),
                            LabelTextWidget(
                                title: 'Booked',
                                textColor: Colors.black,
                                fontSize: 17),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DashBoardContainerWidget(
                      titleColor: AllColors.kOpenCheckoutColor,
                      title: 'Check-Outs',
                      height: screenHeight * 0.4 - 20,
                      width: screenWidth * 0.2 - 40,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 104),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            LabelTextWidget(
                                title: '2',
                                textColor: Colors.red,
                                fontSize: 40),
                            LabelTextWidget(
                                title: 'Overdue',
                                textColor: Colors.black,
                                fontSize: 17),
                            SizedBox(
                              height: 60,
                            ),
                            LabelTextWidget(
                                title: '0',
                                textColor: Colors.black,
                                fontSize: 40),
                            LabelTextWidget(
                                title: 'Open',
                                textColor: Colors.black,
                                fontSize: 17),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                DashBoardContainerWidget(
                  titleColor: AllColors.kObservationColor,
                    title: 'Open Observation',
                    height: screenHeight * 0.4 - 20,
                    width: screenWidth * 0.4 - 85,
                    child: const Text('ListView')),
              ],
            ),
          )),
    );
  }
}
