import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tonomo/Provider/statemanage.dart';
import 'package:tonomo/Services/dummymodel.dart';
import 'package:tonomo/Widgets/labeltext_widget.dart';
import 'package:tonomo/Widgets/textfield_widget.dart';
import 'package:tonomo/main.dart';

class ItemAddWidget extends StatefulWidget {
  const ItemAddWidget({super.key});

  @override
  State<ItemAddWidget> createState() => _ReservationAddWidgetState();
}

class _ReservationAddWidgetState extends State<ItemAddWidget> {
  TextEditingController quantityText = TextEditingController();
  TextEditingController locationText = TextEditingController();
  TextEditingController userText = TextEditingController();
  TextEditingController itemText = TextEditingController();
  TextEditingController modelText = TextEditingController();
  TextEditingController brandText = TextEditingController();
  TextEditingController categoryText = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                height: screenHeight * 0.5,
                width: screenWidth * 0.7,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const LabelTextWidget(
                        title:
                            'Add Details of the Equipment \ne.g model, quantity etc',
                        textColor: Colors.black,
                        fontSize: 15),
                    SizedBox(
                      height: screenHeight,
                      child: const VerticalDivider(
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const LabelTextWidget(
                                    title: 'Brand',
                                    textColor: Colors.black54,
                                    fontSize: 17),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFieldWidget(
                                    textEditingController: brandText,
                                    hintText: 'e.g Dell, Apple',
                                    textFieldWidth: screenWidth * 0.2),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const LabelTextWidget(
                                    title: 'Model',
                                    textColor: Colors.black54,
                                    fontSize: 16),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFieldWidget(
                                    textEditingController: modelText,
                                    hintText: 'e.g 23141',
                                    textFieldWidth: screenWidth * 0.2),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                            title: 'Qunatity',
                            textColor: Colors.black54,
                            fontSize: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                            textEditingController: quantityText,
                            hintText: 'Quantity',
                            textFieldWidth: screenWidth * 0.2),
                        const SizedBox(
                          height: 10,
                        ),
                        const LabelTextWidget(
                            title: 'Location',
                            textColor: Colors.black54,
                            fontSize: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                            textEditingController: locationText,
                            hintText: 'Location',
                            textFieldWidth: screenWidth * 0.2),
                        const SizedBox(
                          height: 10,
                        ),
                        const LabelTextWidget(
                            title: 'Category',
                            textColor: Colors.black54,
                            fontSize: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                            textEditingController: categoryText,
                            hintText: 'Category',
                            textFieldWidth: screenWidth * 0.2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            setState(() {
              context.read<StateManagement>().addItem(DummyModel(
                  name: itemText.text,
                  category: categoryText.text,
                  brand: brandText.text,
                  model: int.parse(modelText.text),
                  quantity: quantityText.text,
                  location: locationText.text));
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                margin:
                    const EdgeInsets.symmetric(horizontal: 590, vertical: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                content: const Text('Item Saved Successfully')));
            Navigator.of(context).pop();
          },
          child: Container(
            height: screenHeight * 0.1 - 49,
            width: screenWidth * 0.6 - 25,
            decoration: BoxDecoration(
                color: Colors.indigo.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                'Add Item',
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
