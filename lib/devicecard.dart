import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class DeviceCardWidget extends StatefulWidget {
  final String deviceName;
  final String deviceId;

  const DeviceCardWidget({Key? key, required this.deviceName, required this.deviceId}) : super(key: key);

  @override
  State<DeviceCardWidget> createState() => _DeviceCardWidgetState();
}

class _DeviceCardWidgetState extends State<DeviceCardWidget> {

  bool currState = false;
  final dbR = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        dbR
            .child(widget.deviceId)
            .update({"Switch": !currState});
        setState(() {
          currState = !currState;
        });
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currState ? const Color(0xffE98C00) : const Color(0xff000000),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currState
                      ? const Icon(
                    Icons.lightbulb,
                    size: 20,
                    color: Colors.white,
                  )
                      : const Icon(
                    Icons.lightbulb,
                    size: 20,
                    color: Colors.white,
                  ),
                  currState
                      ? const Icon(
                    Icons.toggle_on_rounded,
                    size: 30,
                    color: Colors.white,
                  )
                      : const Icon(
                    Icons.toggle_off_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.deviceName,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  currState
                      ? const Text(
                    'OPENED',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                      : const Text(
                    'CLOSED',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}