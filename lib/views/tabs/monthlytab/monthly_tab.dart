import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:todoapp/views/tabs/dailytab/bloc/daily_bloc.dart';

import '../../../core/colorconstant.dart';
import '../../taskdetails/taskdetails.dart';
import '../weeklytab/calendar.dart';

class MonthlyTab extends StatefulWidget {
  const MonthlyTab({Key? key}) : super(key: key);

  @override
  _MonthlyTabState createState() => _MonthlyTabState();
}

class _MonthlyTabState extends State<MonthlyTab> {

  DateTime? selectedDay;
  List <CleanCalendarEvent>? selectedEvent;

  final Map<DateTime,List<CleanCalendarEvent>> events = {
    DateTime (DateTime.now().year,DateTime.now().month,DateTime.now().day):
    [
      CleanCalendarEvent('Event A',
          startTime: DateTime(
              DateTime.now().year,DateTime.now().month,DateTime.now().day,10,0),
          endTime:  DateTime(
              DateTime.now().year,DateTime.now().month,DateTime.now().day,12,0),
          description: 'A special event',
          color: Colors.blue),
    ],

    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
    [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
  };

  void _handleData(date){
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        child: Calendar(
          startOnMonday: true,
          selectedColor: Colors.blue,
          todayColor: Colors.red,
          eventColor: Colors.green,
          eventDoneColor: Colors.amber,
          bottomBarColor: Colors.deepOrange,
          onRangeSelected: (range) {
            print('selected Day ${range.from},${range.to}');
          },
          onDateSelected: (date){
            return _handleData(date);
          },
          events: events,
          isExpanded: true,
          dayOfWeekStyle: TextStyle(
            fontSize: 15,
            color: ColorConstant.greyColor,
            fontWeight: FontWeight.w100,
          ),
          hideArrows: false,

          hideTodayIcon: true,
          weekDays: ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],
        ),
      )


    );
  }
}
