import 'package:flutter/cupertino.dart';
import 'package:onboarding/darkmode/config_model.dart';
import 'package:onboarding/darkmode/config_repo.dart';

class ConfigViewModel extends ChangeNotifier{
  final ConfigRepository _repository;

  late final ConfigModel _model = ConfigModel(
    darkMode: _repository.isDarkMode()
  );

  ConfigViewModel(this._repository);

  bool get darkMode => _model.darkMode;

  void setDarkMode(bool value){
    _repository.setDarkMode(value);
    _model.darkMode = value;
    notifyListeners();
  }
}