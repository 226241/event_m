import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/creat_event_controller.dart';





class CreateEventView extends StatelessWidget {
  final AddEventController controller = Get.put(AddEventController());

   CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
        actions: [
          TextButton(
            onPressed: () {
              // Logic to create event
            },
            child: const Text('Create', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Logic to pick image
                },
                child: Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text('Pick an Image!', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Choose a Catchy Title!', style: TextStyle(fontSize: 18)),
              TextField(
                controller: controller.titleController,
                decoration: const InputDecoration(
                  hintText: 'Event Title',
                ),
              ),
              const SizedBox(height: 16),
              const Text('Where can we find you?', style: TextStyle(fontSize: 18)),
              TextButton(
                onPressed: () {
                  // Logic to pick location
                },
                child: const Text('Pick Location', style: TextStyle(color: Colors.blue)),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Start date:', style: TextStyle(fontSize: 18)),
                        Obx(() {
                          return TextButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: controller.startDate.value,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                controller.startDate.value = pickedDate;
                              }
                            },
                            child: Text(DateFormat('dd MMM yyyy').format(controller.startDate.value)),
                          );
                        }),
                        Obx(() {
                          return TextButton(
                            onPressed: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: controller.startTime.value,
                              );
                              if (pickedTime != null) {
                                controller.startTime.value = pickedTime;
                              }
                            },
                            child: Text(controller.startTime.value.format(context)),
                          );
                        }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('End date:', style: TextStyle(fontSize: 18)),
                        Obx(() {
                          return TextButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: controller.endDate.value,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                controller.endDate.value = pickedDate;
                              }
                            },
                            child: Text(DateFormat('dd MMM yyyy').format(controller.endDate.value)),
                          );
                        }),
                        Obx(() {
                          return TextButton(
                            onPressed: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: controller.endTime.value,
                              );
                              if (pickedTime != null) {
                                controller.endTime.value = pickedTime;
                              }
                            },
                            child: Text(controller.endTime.value.format(context)),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Private', style: TextStyle(fontSize: 18)),
                  const Spacer(),
                  Obx(() {
                    return Switch(
                      value: controller.isPrivate.value,
                      onChanged: (value) {
                        controller.isPrivate.value = value;
                      },
                    );
                  }),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Categories', style: TextStyle(fontSize: 18)),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: controller.categories.map((category) {
                  return Obx(() {
                    return ChoiceChip(
                      label: Text(category),
                      selected: controller.selectedCategories.contains(category),
                      onSelected: (selected) {
                        controller.toggleCategory(category);
                      },
                    );
                  });
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}