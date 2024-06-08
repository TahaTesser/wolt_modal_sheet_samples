import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Center(
          child: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                WoltModalSheet.show<void>(
                  context: context,
                  pageListBuilder: (modalSheetContext) {
                    return List<SliverWoltModalSheetPage>.generate(
                      3,
                      (index) => WoltModalSheetPage(
                        child: Column(
                          children: <Widget>[
                            Image.network('https://i.imgur.com/3uuQ0Y0.jpeg'),
                            FilledButton(
                              onPressed: Navigator.of(modalSheetContext).pop,
                              child: const Text('Close Sheet'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  onModalDismissedWithBarrierTap: () =>  Navigator.of(context).pop(),
                );
              },
              child: const Text('Show Sheet'),
            );
          }),
        ),
      ),
    );
  }
}
