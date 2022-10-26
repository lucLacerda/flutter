// import 'dart:async';
//
// import 'package:disable_screenshots/disable_screenshots.dart';
// import 'package:flutter/material.dart';
//
// class RootApp extends StatefulWidget {
//   @override
//   _RootAppState createState() => _RootAppState();
// }
//
// class _RootAppState extends State<RootApp> {
//
//   late StreamSubscription<void> _screenshotsSubscription;
//   int _screenshotsCount = 0;
//   bool _disableScreenshots = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _screenshotsSubscription = _plugin.onScreenShots.listen((event) {
//       setState(() {
//         _screenshotsCount++;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('texto 1'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Center(
//             child: Text("texto 2 $_screenshotsCount"),
//           ),
//           Center(
//             child: Text(_disableScreenshots ? "texto 3" : "texto 4"),
//           ),
//           RaisedButton(
//               onPressed: () {
//                 _plugin.addWatermark(context, "text 5",
//                     rowCount: 4, columnCount: 8);
//               },
//               child: Text("texto 6")),
//           // RaisedButton(
//           //     onPressed: () {
//           //       // 添加自定义widget当做水印
//           //       _plugin.addCustomWatermark(context,
//           //           Watarmark(rowCount: 3, columnCount: 10, text: "自定义水印"));
//           //     },
//           //     child: Text("添加自定义水印")),
//           RaisedButton(
//               onPressed: () {
//                 // 移除水印
//                 _plugin.removeWatermark();
//               },
//               child: Text("texto 7")),
//           RaisedButton(
//               onPressed: () async {
//                 bool flag = !_disableScreenshots;
//                 await _plugin.disableScreenshots(flag);
//                 setState(() {
//                   _disableScreenshots = flag;
//                 });
//               },
//               child: Text(_disableScreenshots ? "texto 8（android）" : "texto 9（android)")),
//           RaisedButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (_) => Scaffold(
//                       appBar: AppBar(
//                         title: Text("texto 10"),
//                       ),
//                       body: Center(child: Text("new page")),
//                     )));
//               },
//               child: Text("texto 11"))
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     if (_screenshotsSubscription != null) {
//       _screenshotsSubscription.cancel();
//     }
//   }
// }