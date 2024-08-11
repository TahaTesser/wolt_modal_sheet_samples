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
                WoltModalSheet.show(
                  context: context,
                  modalDecorator: (child) {
                    return ColoredBox(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.38),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: child,
                      ),
                    );
                  },
                  pageContentDecorator: (child) {
                    return ColoredBox(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.38),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: child,
                      ),
                    );
                  },
                  modalTypeBuilder: (modalSheetContext) {
                    return WoltModalType.dialog();
                  },
                  pageListBuilder: (context) {
                    return <WoltModalSheetPage>[
                      WoltModalSheetPage(
                        child: const Center(child: Text('Wolt modal sheet page')),
                      ),
                    ];
                  },
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
