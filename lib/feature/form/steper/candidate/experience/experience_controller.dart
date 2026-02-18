part of '../../../../../pages.dart';

class ExperienceController extends GetxController {
  final TextEditingController workingSince = TextEditingController();
  final selectedCurrentSituation = Rxn<CurrentSituation>();
  final currentSituation = <CurrentSituation>[
    CurrentSituation(id: '1', currentSituation: 'Actively looking for new opportunities'),
    CurrentSituation(id: '2', currentSituation: 'Open to work (Full-time / Contract)'),
    CurrentSituation(id: '3', currentSituation: 'Open for freelance projects'),
    CurrentSituation(id: '4', currentSituation: 'Currently employed, open to new roles'),
    CurrentSituation(id: '5', currentSituation: 'Available to start immediately'),
  ].obs;

}
