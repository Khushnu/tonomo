import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tonomo/Constants/colors.dart';
import 'package:tonomo/Provider/statemanage.dart';
import 'package:tonomo/Widgets/Items%20Screen%20Widgets/itemadd_widget.dart';
import 'package:tonomo/Widgets/buttons_widget.dart';
import 'package:tonomo/Widgets/calendarpagebuttons_widget.dart';
import 'package:tonomo/Widgets/labeltext_widget.dart';
import 'package:tonomo/Widgets/textfield_widget.dart';
import 'package:tonomo/main.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  String dropDownValue = 'name';
  int isvalue = 12345;
  bool isSelected = false;
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
    var itemList = context.watch<StateManagement>().itemList;
    return Scaffold(
        backgroundColor: AllColors.kDashboardBackground,
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.1 - 30,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All items',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                         showDialog(context: context, builder: (_)=> const ItemAddWidget());
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AllColors.kLeftMenuSelectionColor,
                      ),
                      child: const Text('New item'),
                    )
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
                              width: 190,
                              borderSide:
                                  Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButtonWidget(
                                      height: 40,
                                      width: 40,
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
                                    width: 65,
                                    border: Border(
                                        right: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                        left: BorderSide(
                                            color: Colors.grey.shade300)),
                                    child: Icon(
                                      Icons.grid_view_rounded,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  CustomButtonWidget(
                                    height: 40,
                                    width: 40,
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
                                  CustomButtonWidget(
                                      height: 40,
                                      width: 40,
                                      onTap: () {
                                        setState(() {});
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: Colors.grey.shade600,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                                      title: 'Quantity',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'Location',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'Category',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'Brand',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                 const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'Model',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                              ],
                              rows: itemList.isEmpty
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
                                  : List.generate(itemList.length, (index) {
                                var e = itemList[index];
                            
                                return DataRow(
                                    selected: e.isSelected,
                                    onSelectChanged: (bool? v){
                                    setState(() {
                                        e.isSelected = v!;
                                        if(v){
                                          setState(() {
                                          isSelected = true;  
                                          } );
                                          
                                        } else {
                                          isSelected = false;
                                        }
                                    });
                                    },
                                    cells: [
                                        DataCell(SizedBox(
                                          width: e.isSelected ? screenWidth * 0.1 : 40,
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
                                                      context.read<StateManagement>().removeItem(index);
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          behavior: SnackBarBehavior.floating,
                                                          margin: const EdgeInsets.symmetric(horizontal:590, vertical: 30),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(20)
                                                          ),
                                                          content: Text('${e.name} is Deleted')));
                                                    });
                                                  },
                                                  child: const Card(
                                                    child: Center(child: Text('Delete'))),
                                                ),
                                              )
                                            ],
                                          ),
                                        ) ),
                                        DataCell(Text(e.quantity)),
                                        DataCell(Text(e.location)),
                                        DataCell(Text(e.category)),
                                        DataCell(Text(e.brand)), 
                                        DataCell(Text(e.model.toString()))
                                      ]);
                              })
                                )
                         
                          )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
