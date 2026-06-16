import 'package:flutter/material.dart';

import '../../../core/common_widgets/common_components/app_bar_widget.dart';
import 'components/client_home_widget.dart';

class ClientHomesView extends StatefulWidget {
  const ClientHomesView({super.key});

  @override
  State<ClientHomesView> createState() => _ClientHomesViewState();
}

class _ClientHomesViewState extends State<ClientHomesView> {
  @override
  Widget build(BuildContext context) {
    //final colorTheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'My homes', trailingWidget: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ClientHomeWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
