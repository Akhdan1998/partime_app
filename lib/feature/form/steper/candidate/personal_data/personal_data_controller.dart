part of '../../../../../pages.dart';

class PersonalDataController extends GetxController {
  final selectedGender = Rxn<Gender>();
  final gender = <Gender>[
    Gender(id: '1', gender: 'Male'),
    Gender(id: '2', gender: 'Female'),
    Gender(id: '3', gender: 'Unisex'),
  ].obs;
}