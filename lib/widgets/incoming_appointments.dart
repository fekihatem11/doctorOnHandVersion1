import 'package:booking_calendar/booking_calendar.dart';
import 'package:doctorppp/screens/HomePage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get/get.dart';

import '../Controllers/patientMeetingsController.dart';
import '../screens/video_calll/meet.dart';

class IncomingCard extends StatelessWidget {
  IncomingCard({
    Key? key,
  }) : super(key: key);

  final patientMeetingsController = Get.find<PatientMeetingsController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // BookingService? earliestMeet =
    //     patientMeetingsController.earliestMeeting.value;
    //get the earliest meeting in obx
    return Obx(() {
      BookingService? earliestMeet =
          patientMeetingsController.earliestMeeting.value;

      // if (earliestMeet == null) {
      //   return Center(
      //     child: Text(
      //         "You have no appointments right now! Find a doctor to book an appointment today!"),
      //   );
      // }

      if (earliestMeet == null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width * 1,
            height: height * 0.25,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  offset: Offset(3.0, 3.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Center(
              child: Text(
                "No upcoming appointments!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  height: 1.5,
                ),
              ),
            ),
          ),
        );
      }

      return InkWell(
        onTap: () {
          String doctorId = 'doctor1'; // Replace with the actual doctor ID
          String patientId = 'patient3'; // Replace with the actual patient ID
          Get.to(VideoCallScreen(doctorId: doctorId, patientId: patientId));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width * 1,
            height: height * 0.25,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
              //boxShadow: kElevationToShadow[6],
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  offset: Offset(3.0, 3.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 016),
                  child: Text(
                    "Upcoming Appointments",
                    style: TextStyle(
                      fontFamily: "Comic Sans",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/doctor.png',
                        width: width * 0.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. ${patientMeetingsController.earliestdoctor.value.fName} ${patientMeetingsController.earliestdoctor.value.lName} ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${patientMeetingsController.earliestdoctor.value.speciality}",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white70,
                                    ),
                          ),
                          SizedBox(
                            width: width * 0.61,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 8.0,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white10,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Ionicons.location_outline,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 6, right: 14),
                                          child: Text(
                                            "${patientMeetingsController.earliestdoctor.value.address}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.058),
                                const Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 8.0,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Icon(
                                  Ionicons.calendar_outline,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 6, right: 14),
                                  child: Text(
                                    earliestMeet!.bookingStart.year.toString() +
                                        "-" +
                                        earliestMeet!.bookingStart.month
                                            .toString() +
                                        "-" +
                                        earliestMeet!.bookingStart.day
                                            .toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(
                                    Ionicons.time_outline,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  earliestMeet.bookingStart.hour.toString() +
                                      ":" +
                                      earliestMeet.bookingStart.minute
                                          .toString() +
                                      " - " +
                                      earliestMeet.bookingEnd.hour.toString() +
                                      ":" +
                                      earliestMeet.bookingEnd.minute.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
