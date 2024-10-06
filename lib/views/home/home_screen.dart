import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/creat_event_controller.dart';

class HomeScreen extends StatelessWidget {
  final AddEventController controller = Get.find<AddEventController>();

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.03),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "What's Going on Today",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Display the list of events
              Expanded(
                child: Obx(() {
                  if (controller.events.isEmpty) {
                    return const Center(child: Text("No events yet."));
                  } else {
                    return ListView.builder(
                      itemCount: controller.events.length,
                      itemBuilder: (context, index) {
                        final event = controller.events[index];
                        return Card(
                          child: ListTile(
                            title: Text(event['title']),
                            subtitle: Text(event['date']),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
