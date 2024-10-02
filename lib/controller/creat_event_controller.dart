import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventController extends GetxController {
  var titleController = TextEditingController();
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;
  var isPrivate = false.obs;
  var categories = ['Conference', 'Sports', 'Food & Drinks'].obs;
  var selectedCategories = <String>[].obs;

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }
}