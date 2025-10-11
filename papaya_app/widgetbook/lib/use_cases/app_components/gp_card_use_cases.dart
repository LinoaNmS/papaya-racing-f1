import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// ✅ Import depuis l'app
import 'package:papaya_racing/features/gp/widgets/gp_card.dart';

// Use cases uniquement, le composant est dans l'app
@widgetbook.UseCase(name: 'Monaco', type: GpCard)
Widget gpCardMonaco(BuildContext context) {
  return GpCard(
    gpName: 'Monaco Grand Prix',
    country: 'Monaco',
    circuitName: 'Circuit de Monaco',
    date: '26 Mai 2024',
    onTap: () {},
  );
}

@widgetbook.UseCase(name: 'Silverstone', type: GpCard)
Widget gpCardSilverstone(BuildContext context) {
  return GpCard(
    gpName: 'British Grand Prix',
    country: 'United Kingdom',
    circuitName: 'Silverstone Circuit',
    date: '7 Juillet 2024',
    onTap: () {},
  );
}

@widgetbook.UseCase(name: 'Spa', type: GpCard)
Widget gpCardSpa(BuildContext context) {
  return GpCard(
    gpName: 'Belgian Grand Prix',
    country: 'Belgium',
    circuitName: 'Circuit de Spa-Francorchamps',
    date: '28 Juillet 2024',
    onTap: () {},
  );
}

@widgetbook.UseCase(name: 'Monza', type: GpCard)
Widget gpCardMonza(BuildContext context) {
  return GpCard(
    gpName: 'Italian Grand Prix',
    country: 'Italy',
    circuitName: 'Autodromo Nazionale di Monza',
    date: '1 Septembre 2024',
    onTap: () {},
  );
}
