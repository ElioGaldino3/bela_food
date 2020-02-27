import 'package:bela_food/app/shared/models/pizza_order_model.dart';

double getTotalFromPizzas(List<PizzaOrderModel> list) {
  double total = 0;
  list.forEach((PizzaOrderModel pizza) {
    total += pizza.pizzaSize.value * pizza.amount;
  });
  return total;
}
