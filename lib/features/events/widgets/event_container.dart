import 'package:checkin/core/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';

class EventContainer extends StatelessWidget {
  final String eventName;
  final String eventTime;
  final String eventLocation;
  final String eventDate;
  final String eventMonth;
  final String imageAsset;
  const EventContainer(
      {super.key,
      required this.eventName,
      required this.eventTime,
      required this.eventLocation,
      required this.eventDate,
      required this.eventMonth,
      required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 330,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: AppColors.primary)),
      child: Column(children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imageAsset, // Replace with your image asset
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      eventDate, // Example date
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      eventMonth, // Example month
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        // Event information
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width:230,
                    child: Text(
                      eventName,
                      maxLines: 2,// Event name
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // SizedBox(width: 70,),
                  Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Check in",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                  )
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16, color: AppColors.primary),
                  SizedBox(width: 4),
                  Text(
                    maxLines: 2,
                    eventTime, // Event time
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.location_on, size: 16, color: AppColors.primary),
                  SizedBox(width: 4),
                  Text(
                    eventLocation, // Event location
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
