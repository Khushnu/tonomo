import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tonomo/Widgets/dashboard_widget_container.dart';
import 'package:tonomo/Widgets/labeltext_widget.dart';
import 'package:tonomo/main.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key,  this.expandedWidth});
  final double? expandedWidth;
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  Map<String, double> dataMap = {
    "6 Available": 6,
  };
  @override
  Widget build(BuildContext context) {
     screenHeight = MediaQuery.sizeOf(context).height; 
    screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      height: screenHeight , 
      width: widget.expandedWidth, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),
      child:  Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 80,  ),
        child: SingleChildScrollView(
          // padding: EdgeInsets.zero,
          child: Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 10,
            spacing: 30,
            children: [
               DashBoardContainerWidget(title: 'Items By Status', 
            height: screenHeight * 0.4 -20, 
            width: screenWidth * 0.4 - 50, 
            child: Center(
              child: PieChart(
                dataMap: dataMap, 
                chartRadius: 200, 
                ringStrokeWidth: 10,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesOutside: false, 
                  showChartValuesInPercentage: false, 
                  showChartValues: false, 
                  showChartValueBackground: false
                ),
              centerText: '6 Available',
              centerTextStyle: const TextStyle(fontFamily: 'Inter', color: Colors.black, fontSize: 18),
              colorList: const [Colors.purple],
              chartType: ChartType.ring, ),
            ),
            ), 
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 DashBoardContainerWidget(title: 'Reservations', 
            height: screenHeight * 0.4- 20, 
            width: screenWidth * 0.2 -50, 
            child: const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 104),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  LabelTextWidget(title: '2', textColor: Colors.red, fontSize: 40), 
                   LabelTextWidget(title: 'Overdue', textColor: Colors.black, fontSize: 17),  
                  SizedBox(
                    height: 60,
                  ),
                   LabelTextWidget(title: '0', textColor: Colors.black, fontSize: 40), 
                   LabelTextWidget(title: 'Booked', textColor: Colors.black, fontSize: 17), 
                 
                ],
              ),
            ),),
            const SizedBox(
              width: 10,
            ),
             DashBoardContainerWidget(title: 'Check-Outs', 
            height: screenHeight * 0.4-20, 
            width: screenWidth * 0.2 - 50,
            child: const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 104),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  LabelTextWidget(title: '2', textColor: Colors.red, fontSize: 40), 
                   LabelTextWidget(title: 'Overdue', textColor: Colors.black, fontSize: 17),  
                  SizedBox(
                    height: 60,
                  ),
                   LabelTextWidget(title: '0', textColor: Colors.black, fontSize: 40), 
                   LabelTextWidget(title: 'Open', textColor: Colors.black, fontSize: 17), 
                 
                ],
              ),
            ),),
              ],
            ), 
                 DashBoardContainerWidget(title: 'Open Observation', 
            height: screenHeight * 0.4 -20, 
            width: screenWidth * 0.4 - 50, 
            child: const Text('ListView')
            ), 
            DashBoardContainerWidget(title: 'Open Check-outs', 
            height: screenHeight * 0.4 -20, 
            width: screenWidth * 0.4 - 90, 
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.exit_to_app, size: 50,), 
                  const Text('New upcoming check-outs '),
                  const SizedBox(
                    height: 15,
                  ), 
                  Container(
                    height: 40, 
                    width: 150, 
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ), 
                    child: const Center(
                      child: Text('New Check-outs'),
                    ),
                  )
                ],
              ),
            )
            ), 
        
        
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 DashBoardContainerWidget(title: 'Reservations', 
            height: screenHeight * 0.4- 20, 
            width: screenWidth * 0.2 -20, 
            child: const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 104),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  LabelTextWidget(title: '2', textColor: Colors.red, fontSize: 40), 
                   LabelTextWidget(title: 'Overdue', textColor: Colors.black, fontSize: 17),  
                  SizedBox(
                    height: 60,
                  ),
                   LabelTextWidget(title: '0', textColor: Colors.black, fontSize: 40), 
                   LabelTextWidget(title: 'Booked', textColor: Colors.black, fontSize: 17), 
                 
                ],
              ),
            ),),
            const SizedBox(
              width: 10,
            ),
             DashBoardContainerWidget(title: 'Check-Outs', 
            height: screenHeight * 0.4-20, 
            width: screenWidth * 0.2 - 40,
            child: const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 104),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  LabelTextWidget(title: '2', textColor: Colors.red, fontSize: 40), 
                   LabelTextWidget(title: 'Overdue', textColor: Colors.black, fontSize: 17),  
                  SizedBox(
                    height: 60,
                  ),
                   LabelTextWidget(title: '0', textColor: Colors.black, fontSize: 40), 
                   LabelTextWidget(title: 'Open', textColor: Colors.black, fontSize: 17), 
                 
                ],
              ),
            ),),
              ],
            ), 
             DashBoardContainerWidget(title: 'Open Observation', 
            height: screenHeight * 0.4 -20, 
            width: screenWidth * 0.4 - 85, 
            child: const Text('ListView')
            ), 
           
            ],
          ),
        )
        ),
    );
  }
}


