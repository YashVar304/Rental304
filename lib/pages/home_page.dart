import 'package:app/pages/NavBar.dart';
import 'package:app/pages/login.dart';
import 'package:app/pages/payment.dart';
import 'package:app/pages/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/best_offer.dart';
import '../widgets/catagories.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/recomonded.dart';
import '../widgets/search.dart';
import '../widgets/welcome_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [HomePage(), Service(), Payment(), Login()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'R E N T A L',
          style: GoogleFonts.lato(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeText(),
            const SearchInput(),
            const Categories(),
            RecommendedHouse(),
            BestOffer(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
