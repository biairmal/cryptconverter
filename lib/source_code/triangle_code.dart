// TRIANGLE CIPHER

class TriangleCipher {

  //String key;
  //int availableBox;
  int floor;
  int height;
  TriangleCipher();

  int getHeight(String input){
    height = 0;
    int temp = input.length;
    int j = 1;
    while(j < temp){
      temp = temp-j;
      j+=2;
      height++;
    }
    return height;
  }

  int getFloor(int height){
    floor = 0;
    for(int i = 0; i<= height; i++){
      if (floor == 0){
        floor++;
      }
      else{
        floor+=2;
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
    int currentHeight = 1;
    int center = (floor~/2);
    int goLeft = 0;
    int goUp = 0;
    int m = 0;
    var twoDList = List.generate(height+1, (i) => List(floor), growable: false);
    
    for (int j = 0; j <= height; j++){
      int x = center-goLeft;
      for (int i = 0; i < currentFloor; i++){
        if(m < input.length){
            twoDList[j][x] = input[m];
            m++;
        }
        else{
            twoDList[j][x] = "X";
        }
        x++;
      }
      goLeft++;
      currentFloor+=2;      
    }

    for(int i = 0; i < floor; i++){
      int x = height-goUp;
      for(int j = 0; j < currentHeight; j++){
        output += twoDList[x][i];
        x--;
      }
      goUp++;
      currentHeight++;
    }
    
    
    // ini yang vignere
    // int j = 0;
    
    // for (int i = 0; i < input.length; i++) {
    //   if (input[i].isNotEmpty) {
    //     output += String.fromCharCode(
    //         (input.codeUnitAt(i) + key.codeUnitAt(j)) % 26 + 65);
    //   } else {
    //     output += input[i];
    //   }
    //   if (j < key.length - 1) {
    //     j++;
    //   } else {
    //     j = 0;
    //   }
    // }
    return output;
  }

  int mod(int val, int mod) {
    return (val % mod + mod) % mod;
  }

  // String decrypt(String input) {
  //   key = this.key;
  //   input = input.replaceAll(' ', '');
  //   key = key.replaceAll(' ', '');
  //   input = input.toUpperCase();
  //   key = key.toUpperCase();
  //   String output = "";
  //   int j = 0;

  //   for (int i = 0; i < input.length; i++) {
  //     if (input[i].isNotEmpty) {
  //       output += String.fromCharCode(
  //           mod((input.codeUnitAt(i) - key.codeUnitAt(j)), 26) + 65);
  //     } else {
  //       output += input[i];
  //     }

  //     if (j < key.length - 1)
  //       j++;
  //     else
  //       j = 0;
  //   }
  //   return output;
  // }
}
