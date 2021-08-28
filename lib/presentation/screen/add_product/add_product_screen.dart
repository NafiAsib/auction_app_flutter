import 'dart:io';

import 'package:auction_app/core/utils/notifier_state.dart';
import 'package:auction_app/presentation/screen/add_product/add_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? img;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<AddProductProvider>(context, listen: false);
    return KeyboardDismisser(
      gestures: [
        GestureType.onVerticalDragDown,
        GestureType.onTap,
      ],
      child: GestureDetector(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add your product for ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'auction',
                  style: TextStyle(
                    color: Colors.red[200],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            // backgroundColor: Colors.transparent,
            // elevation: 0.0,
            actions: [
              GestureDetector(
                onTap: () {
                  notifier.name = nameController.text;
                  notifier.desc = descController.text;
                  notifier.minBidPrice = int.parse(priceController.text);
                  // notifier.bidStartDate =
                  // notifier.image = img;
                  notifier.upload();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.file_upload),
                ),
              ),
            ],
          ),
          body: Consumer<AddProductProvider>(
            builder: (context, value, child) {
              if (value.notifierState == NotifierState.LOADING) {
                return Center(child: CircularProgressIndicator());
              } else if (value.notifierState == NotifierState.LOADED) {
                return SimpleDialog(
                  title: Text('Your auction is submitted!'),
                  children: [
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashboard');
                      },
                      child: Text('Go to dashboard'),
                    ),
                  ],
                );
              } else {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            image = await _picker.pickImage(
                                source: ImageSource.gallery);

                            img = File(image!.path);
                            notifier.setimage(img);
                          },
                          child: notifier.image != null
                              ? Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.file(
                                      File(image!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(Icons.add_a_photo),
                                ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Product name',
                            border: OutlineInputBorder(),
                            errorText: validateName(nameController.text),
                          ),
                          textInputAction: TextInputAction.done,
                          // autofocus: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: descController,
                          decoration: InputDecoration(
                            labelText: 'Product Description',
                            border: OutlineInputBorder(),
                            errorText: validateDesc(descController.text),
                          ),
                          textInputAction: TextInputAction.done,
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: priceController,
                          decoration: InputDecoration(
                            labelText: 'Minimum bid price',
                            border: OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            pickDate(context);
                          },
                          child: notifier.bidStartDate == null
                              ? Text('Select auction start date')
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Bid starts from: '),
                                    Text(
                                        '${notifier.bidStartDate?.day}/${notifier.bidStartDate?.month}/${notifier.bidStartDate?.year}'),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                );
                ;
              }
            },
          ),
        ),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final notifier = Provider.of<AddProductProvider>(context, listen: false);
    // final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: notifier.bidStartDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 7)),
      lastDate: DateTime.now().add(Duration(days: 7)),
    );

    if (!(newDate == null)) {
      notifier.setDate(newDate);
    }
  }

  String? validateName(String value) {
    if (!(value.length > 4) && value.isNotEmpty) {
      return "Name should be atleast 4 character long";
    }
    return null;
  }

  String? validateDesc(String value) {
    if (!(value.length > 10) && value.isNotEmpty) {
      return "Name should be atleast 10 character long";
    }
    return null;
  }
}
