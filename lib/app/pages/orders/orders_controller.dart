import 'package:bela_food/app/shared/models/order_model.dart';
import 'package:bela_food/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'orders_controller.g.dart';

class OrdersController = _OrdersControllerBase with _$OrdersController;

abstract class _OrdersControllerBase with Store {
  IDatabase _database = Modular.get();

  @computed
  ObservableList<OrderModel> get myOrders =>
      _myOrdersStream?.value?.asObservable();

  @observable
  ObservableStream<List<OrderModel>> _myOrdersStream;

  _OrdersControllerBase() {
    initController();
  }

  initController() {
    _myOrdersStream = _database.getStreamOrder().asObservable();
  }
}
