import 'package:flutter/material.dart';

class StatusCheckpoint extends StatefulWidget {
  const StatusCheckpoint({super.key});

  @override
  State<StatusCheckpoint> createState() => _StatusCheckpointState();
}

class _StatusCheckpointState extends State<StatusCheckpoint> {
  @override
  int _index = 0;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // body: Stack(
        //   children: [
        //     Positioned(
        //       child: Container(
        //         height: size.height * 0.5,
        //         width: size.width * 0.001,
        //         color: Colors.blue,
        //       ),
        //     ),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Container(
        //           height: size.height * 0.1,
        //           width: size.width * 0.1,
        //           decoration:
        //               BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        //           child: Icon(
        //             Icons.done,
        //             color: Colors.white,
        //           ),
        //         ),
        //         Container(
        //           height: size.height * 0.1,
        //           width: size.width * 0.1,
        //           decoration:
        //               BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        //           child: Icon(
        //             Icons.done,
        //             color: Colors.white,
        //           ),
        //         ),
        //         Container(
        //           height: size.height * 0.1,
        //           width: size.width * 0.1,
        //           decoration:
        //               BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        //           child: Icon(
        //             Icons.done,
        //             color: Colors.white,
        //           ),
        //         ),
        //         Container(
        //           height: size.height * 0.1,
        //           width: size.width * 0.1,
        //           decoration:
        //               BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        //           child: Icon(
        //             Icons.done,
        //             color: Colors.white,
        //           ),
        //         ),
        //         Container(
        //           height: size.height * 0.1,
        //           width: size.width * 0.1,
        //           decoration:
        //               BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        //           child: Icon(
        //             Icons.done,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ],
        //     )
        //   ],
        // ),
        body: Stepper(
      currentStep: _index,
      onStepCancel: null,
      onStepContinue: null,
      onStepTapped: null,
      steps: <Step>[
        Step(
          title: const Text('Order Placed'),
          content:
              Container(alignment: Alignment.centerLeft, child: const Text('')),
        ),
        const Step(
          title: Text('Step 2 title'),
          content: Text(''),
        ),
      ],
    ));
  }
}
