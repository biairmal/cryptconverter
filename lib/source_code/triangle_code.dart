// TRIANGLE CIPHER

class TriangleCipher {
  //String key;
  //int availableBox;
  int floor;
  int height;
  TriangleCipher();

  int getHeight(String input) {
    height = 0;
    int temp = input.length;
    int j = 1;
    while (j < temp) {
      temp = temp - j;
      j += 2;
      height++;
    }
    return height;
  }

  int getFloor(int height) {
    floor = 0;
    for (int i = 0; i <= height; i++) {
      if (floor == 0) {
        floor++;
      } else {
        floor += 2;
      }
    }
    return floor;
  }

  String encrypt(String input) {
    input = input.replaceAll(' ', '');
    input = input.toUpperCase();
    height = getHeight(input);
    floor = getFloor(height);
    String output = "";
    int currentFloor = 1;
    int center = (floor ~/ 2);
    int goLeft = 0;
    int goUp = 0;
    int m = 0;
    var twoDList =
        new List.generate(height + 1, (i) => List(floor), growable: false);

    for (int j = 0; j <= height; j++) {
      int x = center - goLeft;
      for (int i = 0; i < currentFloor; i++) {
        if (m < input.length) {
          twoDList[j][x] = input[m];
          m++;
        } else {
          twoDList[j][x] = "X";
        }
        x++;
      }
      goLeft++;
      currentFloor += 2;
    }

    for (int i = 0; i < floor; i++) {
      //print(i);
      //print("^ INI I");
      for (int x = height - goUp; x <= height; x++) {
        //print(x);
        output += twoDList[x][i];
      }
      if (i >= center) {
        goUp--;
      } else {
        goUp++;
      }
    }
    return output;
  }

  String decrypt(String input) {
    input = input.replaceAll(' ', '');
    input = input.toUpperCase();
    height = getHeight(input);
    floor = getFloor(height);
    String output = "";
    int currentFloor = 1;
    int center = (floor ~/ 2);
    int goLeft = 0;
    int goUp = 0;
    int m = 0;
    var twoDList =
        new List.generate(height + 1, (i) => List(floor), growable: false);

    for (int i = 0; i < floor; i++) {
      for (int x = height - goUp; x <= height; x++) {
        //output += twoDList[x][i];
        if (m < input.length) {
          twoDList[x][i] = input[m];
          m++;
        } else {
          twoDList[x][i] = "X";
        }
      }
      if (i >= center) {
        goUp--;
      } else {
        goUp++;
      }
    }

    for (int j = 0; j <= height; j++) {
      int x = center - goLeft;
      for (int i = 0; i < currentFloor; i++) {
        output += twoDList[j][x];
        x++;
      }
      goLeft++;
      currentFloor += 2;
    }
    output = output.replaceAll('X', '');
    
    return output;
  }

}
