// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfirmController on _ConfirmControllerBase, Store {
  final _$commentControllerAtom =
      Atom(name: '_ConfirmControllerBase.commentController');

  @override
  TextEditingController get commentController {
    _$commentControllerAtom.context.enforceReadPolicy(_$commentControllerAtom);
    _$commentControllerAtom.reportObserved();
    return super.commentController;
  }

  @override
  set commentController(TextEditingController value) {
    _$commentControllerAtom.context.conditionallyRunInAction(() {
      super.commentController = value;
      _$commentControllerAtom.reportChanged();
    }, _$commentControllerAtom, name: '${_$commentControllerAtom.name}_set');
  }

  final _$changeControllerAtom =
      Atom(name: '_ConfirmControllerBase.changeController');

  @override
  TextEditingController get changeController {
    _$changeControllerAtom.context.enforceReadPolicy(_$changeControllerAtom);
    _$changeControllerAtom.reportObserved();
    return super.changeController;
  }

  @override
  set changeController(TextEditingController value) {
    _$changeControllerAtom.context.conditionallyRunInAction(() {
      super.changeController = value;
      _$changeControllerAtom.reportChanged();
    }, _$changeControllerAtom, name: '${_$changeControllerAtom.name}_set');
  }

  final _$addOrderAsyncAction = AsyncAction('addOrder');

  @override
  Future addOrder(dynamic context) {
    return _$addOrderAsyncAction.run(() => super.addOrder(context));
  }

  @override
  String toString() {
    final string =
        'commentController: ${commentController.toString()},changeController: ${changeController.toString()}';
    return '{$string}';
  }
}
