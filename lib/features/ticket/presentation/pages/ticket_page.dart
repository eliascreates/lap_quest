import 'package:flutter/material.dart';
import 'package:lap_quest/features/theme/theme.dart';

import '../widgets/widgets.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Tickets'),
        actions: const [ThemeToggleButton(), SizedBox(width: 10)],
      ),
      body: const TicketView(),
    );
  }
}

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        TicketList(),
      ],
    );
  }
}
