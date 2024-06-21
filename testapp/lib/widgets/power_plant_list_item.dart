import 'package:flutter/material.dart';
import '../models/power_plant.dart';

class PowerPlantListItem extends StatelessWidget {
  final PowerPlant powerPlant;

  const PowerPlantListItem({Key? key, required this.powerPlant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(powerPlant.name),
      ),
    );
  }
}
