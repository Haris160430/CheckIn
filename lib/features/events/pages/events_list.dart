import 'package:checkin/features/events/controller/event_controller.dart';
import 'package:checkin/features/events/widgets/event_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsList extends StatefulWidget {
  const EventsList({super.key});

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  final controller=Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    print(">>>>> ${controller.listData.length}");
    return SafeArea(
        child: Scaffold(
            body: Obx(()=> SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Events",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(Icons.more_vert)
                      ],
                    ),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      //   scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      itemCount: controller.listData.length,
                      itemBuilder: (ctx, i) {
                        return Padding(
                            padding:
                            EdgeInsets.only(left: 16, right: 16, bottom: 10),
                            child:  EventContainer(
                                eventName:controller.listData[i].title,
                                eventTime: controller.listData[i].end.substring(10),
                                eventLocation:"   ",
                                eventDate:controller.listData[i].end.substring(2,4),
                                eventMonth: 'Jul',
                                imageAsset: 'assets/images/event.jpg'));
                      })
                ],
              ),
            ))
                
        )
    );
  }
}
