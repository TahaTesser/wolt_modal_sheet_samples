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
                  modalTypeBuilder: (modalSheetContext) {
                    return WoltModalType.bottomSheet();
                  },
                  decorator: (Widget child) {
                    return ColoredBox(
                     color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.38),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: child,
                      ),
                    );
                  },
                  pageListBuilder: (modalSheetContext) {
                    final Widget stickyActionBar = Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FilledButton(
                            onPressed: Navigator.of(modalSheetContext).pop,
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                    final List<WoltModalSheetPage> pages = <WoltModalSheetPage>[
                      WoltModalSheetPage(
                        stickyActionBar: stickyActionBar,
                        child: const Column(
                          children: <Widget>[
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
