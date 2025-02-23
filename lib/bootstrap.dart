import 'package:financial_wellness/src/data/data.dart';
import 'package:financial_wellness/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> boostrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([setupFonts(), setupDI()]);
}

Future setupDI() async {
  setupDataDI();
  setupDomainDI();
}

Future setupFonts() async {
  await GoogleFonts.pendingFonts([GoogleFonts.workSans, GoogleFonts.rubik]);
}
