// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$selectedFormatsAtom =
      Atom(name: '_HomeControllerBase.selectedFormats');

  @override
  ObservableList<bool> get selectedFormats {
    _$selectedFormatsAtom.context.enforceReadPolicy(_$selectedFormatsAtom);
    _$selectedFormatsAtom.reportObserved();
    return super.selectedFormats;
  }

  @override
  set selectedFormats(ObservableList<bool> value) {
    _$selectedFormatsAtom.context.conditionallyRunInAction(() {
      super.selectedFormats = value;
      _$selectedFormatsAtom.reportChanged();
    }, _$selectedFormatsAtom, name: '${_$selectedFormatsAtom.name}_set');
  }

  final _$pizzaSizesAtom = Atom(name: '_HomeControllerBase.pizzaSizes');

  @override
  ObservableList<SizeModel> get pizzaSizes {
    _$pizzaSizesAtom.context.enforceReadPolicy(_$pizzaSizesAtom);
    _$pizzaSizesAtom.reportObserved();
    return super.pizzaSizes;
  }

  @override
  set pizzaSizes(ObservableList<SizeModel> value) {
    _$pizzaSizesAtom.context.conditionallyRunInAction(() {
      super.pizzaSizes = value;
      _$pizzaSizesAtom.reportChanged();
    }, _$pizzaSizesAtom, name: '${_$pizzaSizesAtom.name}_set');
  }

  final _$flavorsAtom = Atom(name: '_HomeControllerBase.flavors');

  @override
  ObservableList<FlavorModel> get flavors {
    _$flavorsAtom.context.enforceReadPolicy(_$flavorsAtom);
    _$flavorsAtom.reportObserved();
    return super.flavors;
  }

  @override
  set flavors(ObservableList<FlavorModel> value) {
    _$flavorsAtom.context.conditionallyRunInAction(() {
      super.flavors = value;
      _$flavorsAtom.reportChanged();
    }, _$flavorsAtom, name: '${_$flavorsAtom.name}_set');
  }

  final _$orderPizzasAtom = Atom(name: '_HomeControllerBase.orderPizzas');

  @override
  ObservableList<PizzaOrderModel> get orderPizzas {
    _$orderPizzasAtom.context.enforceReadPolicy(_$orderPizzasAtom);
    _$orderPizzasAtom.reportObserved();
    return super.orderPizzas;
  }

  @override
  set orderPizzas(ObservableList<PizzaOrderModel> value) {
    _$orderPizzasAtom.context.conditionallyRunInAction(() {
      super.orderPizzas = value;
      _$orderPizzasAtom.reportChanged();
    }, _$orderPizzasAtom, name: '${_$orderPizzasAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setFormat(int position) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setFormat(position);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementAmount(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.incrementAmount(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deincrementAmount(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.deincrementAmount(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addFlavor(int index, int indexFlavor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.addFlavor(index, indexFlavor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSize(String direction, int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changeSize(direction, index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'selectedFormats: ${selectedFormats.toString()},pizzaSizes: ${pizzaSizes.toString()},flavors: ${flavors.toString()},orderPizzas: ${orderPizzas.toString()}';
    return '{$string}';
  }
}
