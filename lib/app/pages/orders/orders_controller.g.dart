// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrdersController on _OrdersControllerBase, Store {
  Computed<ObservableList<OrderModel>> _$myOrdersComputed;

  @override
  ObservableList<OrderModel> get myOrders => (_$myOrdersComputed ??=
          Computed<ObservableList<OrderModel>>(() => super.myOrders))
      .value;

  final _$_myOrdersStreamAtom =
      Atom(name: '_OrdersControllerBase._myOrdersStream');

  @override
  ObservableStream<List<OrderModel>> get _myOrdersStream {
    _$_myOrdersStreamAtom.context.enforceReadPolicy(_$_myOrdersStreamAtom);
    _$_myOrdersStreamAtom.reportObserved();
    return super._myOrdersStream;
  }

  @override
  set _myOrdersStream(ObservableStream<List<OrderModel>> value) {
    _$_myOrdersStreamAtom.context.conditionallyRunInAction(() {
      super._myOrdersStream = value;
      _$_myOrdersStreamAtom.reportChanged();
    }, _$_myOrdersStreamAtom, name: '${_$_myOrdersStreamAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'myOrders: ${myOrders.toString()}';
    return '{$string}';
  }
}
