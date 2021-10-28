import 'package:device_preview/src/views/tool_panel/tool_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DervicePreviewLargeLayout extends StatefulWidget {
  const DervicePreviewLargeLayout({
    Key? key,
  }) : super(key: key);

  @override
  _DervicePreviewLargeLayoutState createState() =>
      _DervicePreviewLargeLayoutState();
}

class _DervicePreviewLargeLayoutState extends State<DervicePreviewLargeLayout> {
  @override
  void initState() {
    // Forcing rebuild to update absolute postion in `_overlayKey`
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) => setState(() {}),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Localizations(
        locale: const Locale('en', 'US'),
        delegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: ToolPanel.panelWidth,
              child: MediaQuery(
                data: mediaQuery.copyWith(
                  padding: mediaQuery.padding.copyWith(left: 0) +
                      const EdgeInsets.only(left: 40),
                ),
                child: Navigator(
                  onGenerateInitialRoutes: (navigator, initialRoute) {
                    return [
                      MaterialPageRoute(
                        builder: (context) => const ToolPanel(),
                      ),
                    ];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}