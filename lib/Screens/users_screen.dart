import 'package:flutter/material.dart';
import 'package:tonomo/Constants/colors.dart';
import 'package:tonomo/Services/dummyuser.dart';
import 'package:tonomo/Widgets/buttons_widget.dart';
import 'package:tonomo/Widgets/calendarpagebuttons_widget.dart';
import 'package:tonomo/Widgets/labeltext_widget.dart';
// import 'package:tonomo/Widgets/calendarpagebuttons_widget.dart';
import 'package:tonomo/Widgets/textfield_widget.dart';
import 'package:tonomo/main.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<UserScreen> {
  String dropDownValue = 'name';
  List dropDownItems = <String>[
    'name',
    'email',
    'blocked',
    'role',
    'Ascending',
    'Dscending'
  ];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;

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
                      'All User',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AllColors.kLeftMenuSelectionColor,
                      ),
                      child: const Text('Add User'),
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
                              width: 130,
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
                                    width: 45,
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
                              showCheckboxColumn: true,
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
                                      title: 'Email',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'Workspace',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'Role',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                const DataColumn(
                                  label: LabelTextWidget(
                                      title: 'User Group',
                                      textColor: Colors.grey,
                                      fontSize: 16),
                                ),
                                
                              ],
                              rows: List.generate(dumyUser.length , (index) {
                                var e = dumyUser[index];
                              

                                return DataRow(
                                  selected: e.isSelected,
                                    onSelectChanged: (bool? value){
                                      setState(() {
                                        e.isSelected = value!;
                                      });
                                    },
                                    cells: [
                                        DataCell(Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          
                                          children: [
                                            const CircleAvatar(
                                              child: Text('WA'),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(e.name),
                                          ],
                                        )),
                                        DataCell(Text(e.email)),
                                        DataCell(Text(e.workspaceacces)),
                                        DataCell(Text(e.rols)),
                                        DataCell(Text(e.occupation)), 
                                        
                                      ]);
                              })
                                  )
                  ),
                
              
            ],
          ),
                )
            
            )
            ] 
        )) );
  }
}