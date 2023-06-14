import 'dart:math';
import 'dart:io';

void main() {
  print('Выберите режим\n1-Я угадываю\n2-Я загадываю\n3-Серивнование');
  String choose = stdin.readLineSync()!;
  if (choose == '1') {
    game();
  } else if (choose == '2') {
    player();
  } else if (choose == '3') {
    competition();
  }
}

//task1
void game() {
  int couter = 0;
  int randomNumber = Random().nextInt(100) + 1;
  print('Я загодал от 1 до 100,попробуй его отгадать');
  while (true) {
    print(couter);
    couter++;
    int number = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    if (couter <= 7) {
      if (randomNumber == number) {
        print('Вы угадали!!');
        break;
      } else if (randomNumber > number) {
        print('Число больше');
      } else if (randomNumber < number) {
        print('Число меньше');
      }
    } else {
      print('Вы проиграли попробуйте еще раз');
      break;
    }
  }
}

//task2
void player() {
  print('Загадайте число от 1 до 100.');

  int min = 1;
  int max = 100;
  int attempts = 0;

  while (attempts < 7) {
    int guess = ((max - min) / 2).ceil() + min;
    print('Компьютер предполагает, что вы загадали число: $guess');
    attempts++;

    print('Введите "1", если компьютер угадал число.');
    print('Введите "2", если загаданное число больше.');
    print('Введите "3", если загаданное число меньше.');

    String choose = stdin.readLineSync()!;
    if (choose == '1') {
      print('Компьютер угадал ваше число $guess за $attempts попыток.');
      break;
    } else if (choose == '2') {
      min = guess + 1;
    } else if (choose == '3') {
      max = guess - 1;
    } else {
      print('Некорректный ввод. Попробуйте еще раз.');
    }
  }
  if (attempts == 7) {
    print('Компьютер не смог угадать число за 7 попыток.');
  }
}

//task3
void competition() {
  print('Соревнование между компьютером и игроком.');
  print('Каждому дается по 7 попыток.');

  int playerAttempts = 0;
  int computerAttempts = 0;
  int randomNumber = Random().nextInt(100) + 1;

  print('Загадайте число от 1 до 100.');

  while (playerAttempts < 7 && computerAttempts < 7) {
    print('Ход игрока');
    int playerGuess = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    playerAttempts++;

    if (playerGuess == randomNumber) {
      print('Игрок угадал число $randomNumber за $playerAttempts попыток.');
      break;
    } else if (playerGuess < randomNumber) {
      print('Число больше.');
    } else {
      print('Число меньше.');
    }

    print(' Ход компьютера');
    int computerGuess = Random().nextInt(100) + 1;
    computerAttempts++;

    print('Компьютер предполагает, что вы загадали число: $computerGuess');

    if (computerGuess == randomNumber) {
      print(
          'Компьютер угадал ваше число $randomNumber за $computerAttempts попыток.');
      break;
    } else if (computerGuess < randomNumber) {
      print('Число больше.');
    } else {
      print('Число меньше.');
    }
  }

  if (playerAttempts == 7 && computerAttempts == 7) {
    print(
        'Соревнование завершилось вничью. Никто не угадал число $randomNumber.');
  } else if (playerAttempts == 7) {
    print(
        'Соревнование завершилось. Компьютер угадал число $randomNumber за $computerAttempts попыток.');
  } else if (computerAttempts == 7) {
    print(
        'Соревнование завершилось. Игрок угадал число $randomNumber за $playerAttempts попыток.');
  }
}
