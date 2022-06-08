import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/common/firebase.dart';

import '../../pages/dashboard/DisplayData/widgets/customFullScreenDialog.dart';
import '../../pages/dashboard/DisplayData/widgets/customSnackBar.dart';

class BookController extends GetxController {
  static BookController instance = Get.find();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var currentStep = 0.obs;
  late TextEditingController accessionNoController,
      titleController,
      editionController,
      yearController,
      pagesController,
      sourceController,
      billNoController,
      billDateController,
      costController,
      callNoController;

  late CollectionReference collectionReference;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    accessionNoController = TextEditingController();
    titleController = TextEditingController();
    editionController = TextEditingController();
    yearController = TextEditingController();
    pagesController = TextEditingController();
    sourceController = TextEditingController();
    billNoController = TextEditingController();
    billDateController = TextEditingController();
    costController = TextEditingController();
    callNoController = TextEditingController();

    collectionReference = firebaseFirestore.collection("books");
  }

  void saveBook(
      String docId,
      int addEditFlag,
      String accessionNo,
      String title,
      String edition,
      String year,
      String pages,
      String source,
      String billNo,
      String billDate,
      String cost,
      String callNo) {
    // final isValid = formkey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    // formkey.currentState!.save();

    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();

      collectionReference.add({
        'accessionNo': accessionNo,
        'title': title,
        'edition': edition,
        'year': year,
        'pages': pages,
        'source': source,
        'billNo': billNo,
        'billDate': billDate,
        'cost': cost,
        'callNo': callNo
      }).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Book Added",
            message: "Book Added successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.red);
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    accessionNoController.dispose();
    titleController.dispose();
    editionController.dispose();
    yearController.dispose();
    pagesController.dispose();
    sourceController.dispose();
    billNoController.dispose();
    billDateController.dispose();
    costController.dispose();
    callNoController.dispose();
  }

  void clearEditingControllers() {
    accessionNoController.clear();
    titleController.clear();
    editionController.clear();
    yearController.clear();
    pagesController.clear();
    sourceController.clear();
    billNoController.clear();
    billDateController.clear();
    costController.clear();
    callNoController.clear();
  }
}