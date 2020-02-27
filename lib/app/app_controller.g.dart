// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<Brightness> _$actualBrightnessComputed;

  @override
  Brightness get actualBrightness => (_$actualBrightnessComputed ??=
          Computed<Brightness>(() => super.actualBrightness))
      .value;
  Computed<String> _$actualRouterComputed;

  @override
  String get actualRouter =>
      (_$actualRouterComputed ??= Computed<String>(() => super.actualRouter))
          .value;

  final _$adressControllerAtom =
      Atom(name: '_AppControllerBase.adressController');

  @override
  TextEditingController get adressController {
    _$adressControllerAtom.context.enforceReadPolicy(_$adressControllerAtom);
    _$adressControllerAtom.reportObserved();
    return super.adressController;
  }

  @override
  set adressController(TextEditingController value) {
    _$adressControllerAtom.context.conditionallyRunInAction(() {
      super.adressController = value;
      _$adressControllerAtom.reportChanged();
    }, _$adressControllerAtom, name: '${_$adressControllerAtom.name}_set');
  }

  final _$brightnessAtom = Atom(name: '_AppControllerBase.brightness');

  @override
  Brightness get brightness {
    _$brightnessAtom.context.enforceReadPolicy(_$brightnessAtom);
    _$brightnessAtom.reportObserved();
    return super.brightness;
  }

  @override
  set brightness(Brightness value) {
    _$brightnessAtom.context.conditionallyRunInAction(() {
      super.brightness = value;
      _$brightnessAtom.reportChanged();
    }, _$brightnessAtom, name: '${_$brightnessAtom.name}_set');
  }

  final _$userUidAtom = Atom(name: '_AppControllerBase.userUid');

  @override
  String get userUid {
    _$userUidAtom.context.enforceReadPolicy(_$userUidAtom);
    _$userUidAtom.reportObserved();
    return super.userUid;
  }

  @override
  set userUid(String value) {
    _$userUidAtom.context.conditionallyRunInAction(() {
      super.userUid = value;
      _$userUidAtom.reportChanged();
    }, _$userUidAtom, name: '${_$userUidAtom.name}_set');
  }

  final _$userSettingsAtom = Atom(name: '_AppControllerBase.userSettings');

  @override
  UserSettings get userSettings {
    _$userSettingsAtom.context.enforceReadPolicy(_$userSettingsAtom);
    _$userSettingsAtom.reportObserved();
    return super.userSettings;
  }

  @override
  set userSettings(UserSettings value) {
    _$userSettingsAtom.context.conditionallyRunInAction(() {
      super.userSettings = value;
      _$userSettingsAtom.reportChanged();
    }, _$userSettingsAtom, name: '${_$userSettingsAtom.name}_set');
  }

  final _$initSettingsAsyncAction = AsyncAction('initSettings');

  @override
  Future initSettings() {
    return _$initSettingsAsyncAction.run(() => super.initSettings());
  }

  final _$saveSettingsAsyncAction = AsyncAction('saveSettings');

  @override
  Future saveSettings(dynamic context) {
    return _$saveSettingsAsyncAction.run(() => super.saveSettings(context));
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic changeBrightness() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.changeBrightness();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'adressController: ${adressController.toString()},brightness: ${brightness.toString()},userUid: ${userUid.toString()},userSettings: ${userSettings.toString()},actualBrightness: ${actualBrightness.toString()},actualRouter: ${actualRouter.toString()}';
    return '{$string}';
  }
}
