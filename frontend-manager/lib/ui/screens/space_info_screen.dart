import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/ui/widgets/space_info/pending_reservations_card.dart';
import 'package:ucampus_lib/ui/widgets/space_info/space_info_card.dart';
import 'package:ucampus_manager/ui/widgets/space_info/edit_dial.dart';

class SpaceInfoScreen extends StatelessWidget {
  final Space space;

  SpaceInfoScreen({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                titleSpacing: 10,
                elevation: 3.0,
                forceElevated: true,
                title: Text('Información del espacio'),
                bottom: TabBar(
                  tabs: [
                    Tab(child: Text('RESUMEN')),
                    Tab(child: Text('RESERVAS')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Stack(
                children: <Widget>[
                  SpaceInfoCard(
                    space: space,
                  ),
                  Positioned(
                      bottom: 30,
                      right: 10,
                      left: 0,
                      child: EditDial(
                        space: space,
                      )),
                ],
              ),
              PendingReservationsCard(
                space: space,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
