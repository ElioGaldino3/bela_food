import 'package:bela_food/app/shared/models/flavor_model.dart';
import 'package:bela_food/app/shared/models/pizza_order_model.dart';
import 'package:bela_food/app/shared/models/size_model.dart';
import 'package:bela_food/app/shared/repositories/database/database_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  IDatabase _database = Modular.get();

  @observable
  ObservableList<bool> selectedFormats =
      [false, false, false, false].asObservable();
  @action
  setFormat(int position) {
    orderPizzas.add(PizzaOrderModel(
        amount: 1,
        format: position,
        pizzaSize: pizzaSizes[1],
        flavorPizzas: []));
  }

  @observable
  ObservableList<SizeModel> pizzaSizes;

  @observable
  ObservableList<FlavorModel> flavors;

  @observable
  ObservableList<PizzaOrderModel> orderPizzas =
      <PizzaOrderModel>[].asObservable();

  _HomeControllerBase() {
    initState();
  }

  initState() async {
    List<SizeModel> listSize = await _database.getPizzaSizes();
    List<FlavorModel> listFlavor = await _database.getFlavors();

    pizzaSizes = listSize.asObservable();
    flavors = listFlavor.asObservable();
  }

  @action
  incrementAmount(int index) {
    var newList = orderPizzas;
    newList[index].amount++;
    orderPizzas = newList;
  }

  @action
  deincrementAmount(int index) {
    var newList = orderPizzas;
    newList[index].amount--;
    orderPizzas = newList;
  }

  @action
  addFlavor(int index, int indexFlavor) {
    ObservableList<PizzaOrderModel> newList = orderPizzas;
    if (orderPizzas[index].flavorPizzas.length < orderPizzas[index].format) {
      if (newList[index].flavorPizzas.indexWhere((flavorPizza) =>
              flavorPizza.flavor.id == flavors[indexFlavor].id) !=
          -1) {
        newList[index].flavorPizzas.removeWhere(
            (flavorPizza) => flavorPizza.flavor.id == flavors[indexFlavor].id);
      } else {
        newList[index]
            .flavorPizzas
            .add(FlavorPizza(flavor: flavors[indexFlavor]));
      }
    } else if (newList[index].flavorPizzas.indexWhere((flavorPizza) =>
            flavorPizza.flavor.id == flavors[indexFlavor].id) !=
        -1) {
      newList[index].flavorPizzas.removeWhere(
          (flavorPizza) => flavorPizza.flavor.id == flavors[indexFlavor].id);
    }
    orderPizzas = newList;
  }

  @action
  changeSize(String direction, int index) {
    var newList = orderPizzas;

    int indexSize = pizzaSizes.indexOf(newList[index].pizzaSize);
    if (direction == 'left' && indexSize > 0) {
      indexSize--;
      newList[index].pizzaSize = pizzaSizes[indexSize];
    } else if (indexSize < pizzaSizes.length - 1 && direction == 'right') {
      indexSize++;
      newList[index].pizzaSize = pizzaSizes[indexSize];
    }

    orderPizzas = newList;
  }
}
