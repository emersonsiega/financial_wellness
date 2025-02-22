import 'package:financial_wellness/src/presentation/design_system/design_system.dart';
import 'package:financial_wellness/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.buildTheme(),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: AppAssets.kalshiLogo.build(
                height: 20,
                color: context.colors.foreground.ultraDark,
              ),
            ),
            body: FutureBuilder(
              future: GoogleFonts.pendingFonts([
                GoogleFonts.workSans,
                GoogleFonts.rubik,
              ]),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Center(
                  child: IntrinsicWidth(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: context.spacing.lg,
                      children: [
                        AppAssets.appIcon.build(height: 48, width: 48),
                        const Text('Hello World!', textAlign: TextAlign.center),
                        FilledButton(
                          onPressed: () {},
                          child: const Text('Continue'),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Return'),
                        ),
                        AppIcons.dollarSign.icon(),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
