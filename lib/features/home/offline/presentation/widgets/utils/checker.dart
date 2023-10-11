import 'package:foodito/features/home/offline/domain/entities/order.dart';

class UserMap {
  final String user;
  final double payed;
  final double remaining;

  UserMap({
    required this.user,
    required this.payed,
    required this.remaining,
  });
}

class Checker {
  static Map<String, Map<int, List<UserMap>>> check(List<Order> orders) {
    return {
      "Fatta": {
        5: [
          UserMap(
            user: "Ahmed",
            payed: 40,
            remaining: 10,
          ),
          UserMap(
            user: "Ahmed",
            payed: 40,
            remaining: 10,
          ),
          UserMap(
            user: "Khaled",
            payed: 50,
            remaining: 25,
          ),
        ],
      },
      "Crip": {
        10: [
          UserMap(
            user: "Khaled",
            payed: 40,
            remaining: 10,
          ),
        ],
      },
      "Fries": {
        7: [
          UserMap(
            user: "Khaled",
            payed: 40,
            remaining: 10,
          ),
        ],
      },
    };
  }
}
