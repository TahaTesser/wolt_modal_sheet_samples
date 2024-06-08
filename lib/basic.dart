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
                    final Widget stickyActionBar = Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilledButton(
                          onPressed: Navigator.of(modalSheetContext).pop,
                          child: const Text('Close'),
                        ),
                        FilledButton(
                          onPressed:
                              WoltModalSheet.of(modalSheetContext).showNext,
                          child: const Text('Next'),
                        ),
                      ],
                    );
                    final List<WoltModalSheetPage> pages = <WoltModalSheetPage>[
                      WoltModalSheetPage(
                        stickyActionBar: stickyActionBar,
                        child: Column(
                          children: <Widget>[
                            Image.network('https://i.imgur.com/3uuQ0Y0.jpeg'),
                            const Placeholder(fallbackHeight: 1000),
                          ],
                        ),
                      ),
                      WoltModalSheetPage(
                        stickyActionBar: stickyActionBar,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Page 2',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                            const Placeholder(fallbackHeight: 1000),
                          ],
                        ),
                      ),
                      WoltModalSheetPage(
                        stickyActionBar: stickyActionBar,
                        child: const Column(
                          children: <Widget>[
                            FlutterLogo(size: 400),
                            Placeholder(fallbackHeight: 1000),
                          ],
                        ),
                      ),
                    ];

                    return pages
                        .map((WoltModalSheetPage page) => page)
                        .toList();
                  },
                  onModalDismissedWithBarrierTap: () =>
                      Navigator.of(context).pop(),
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
