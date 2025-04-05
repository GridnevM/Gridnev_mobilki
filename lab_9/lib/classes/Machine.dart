class Machine {
  // Закрытые поля
  int _coffeeBeans = 0;
  int _milk = 0;
  int _water = 0;
  int _cash = 0;

  // Конструктор
  Machine({
    int coffeeBeans = 0,
    int milk = 0,
    int water = 0,
    int cash = 0,
  }) {
    _coffeeBeans = coffeeBeans;
    _milk = milk;
    _water = water;
    _cash = cash;
  }

  // Геттеры
  int get coffeeBeans => _coffeeBeans;
  int get milk => _milk;
  int get water => _water;
  int get cash => _cash;

  // Сеттеры
  set coffeeBeans(int value) => _coffeeBeans = value;
  set milk(int value) => _milk = value;
  set water(int value) => _water = value;
  set cash(int value) => _cash = value;

  // Проверка доступности ресурсов
  bool isAvailable() {
    return _coffeeBeans >= 50 && _water >= 100 && _water >= 100;
  }

  // Приватный метод: уменьшить ресурсы
  void _subtractResources() {
    _coffeeBeans -= 50;
    _water -= 100;
  }

  // Приготовление кофе
  void makingCoffee() {
    if (isAvailable()) {
      _subtractResources();
      _cash += 100; // условная цена
      print('Эспрессо готов! Баланс: $_cash');
    } else {
      print('Недостаточно ресурсов для приготовления эспрессо');
    }
  }

  // ===== Статус =====
  void showStatus() {
    print(' Статус машины:');
    print('  Кофе: $_coffeeBeans г');
    print('  Молоко: $_milk мл');
    print('  Вода: $_water мл');
    print('  Деньги: $_cash₽');
  }
}
