String generateNewTriangle(List<String> s){
  String temp = '';
  for(var i = 0 ; i < s.length ; i++){
    var zeroRepeat = '';
    var j = 0;
    while(j <= i){
      zeroRepeat += '0';
      j++;
    }
    temp += '${s[i]}$zeroRepeat\n';
  }
  return temp;
}

Future<String> generateListOdd(String s) async {
  int limit = int.parse(s);
  List<int> oddNumbers = [2];

  for (var i = 3; i <= limit; i += 2) {
    oddNumbers.add(i);
  }

  return oddNumbers.toString();
}

String generatePrimeNumber(String s){
  int limit = int.parse(s);
  List<int> primes = [];

  for (var i = 2; i <= limit; i++) {
    bool isPrime = true;

    //the mistake of the coding I forgot to add ~ before / which work like math floor
    for (var j = 2; j <= i ~/ 2; j++) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }

    if (isPrime) {
      primes.add(i);
    }
  }

  return primes.toString();
}


String generateNewTriangleFirst(List<String> s){
  String temp = '';
  for(var i = 0 ; i < s.length ; i++){
    var zeroRepeat = '';
    var j = 0;
    while(j <= i){
      zeroRepeat += '0';
      j++;
    }
    temp += '${s[i]}$zeroRepeat\n';
  }
  return temp;
}

String generateNewTriangle2(){
  String s = '';
  int temp = 5;
  for(int i = 5; i >0 ; i--){
    int j = 0;
    while(j <= 5){
      if(j<i){
        s +=' ';
      }else{
        s +='*';
      }
      j++;
    }
    s +='\n';
  }
  return s;
}



String returnNumberOfWord(){
  String s = '';
  List<String> arr = "saya makan nasi goreng dan adik makan nasi goreng spesial".split(' ');

  Map counts = <String, int>{};
  // for (var word in arr) {
  //   // counts[word] = (counts[word] ?? 0) + 1;
  //
  // }

  // var counts = <String, int>{};
  for (var word in arr) {
    if (counts.containsKey(word)) {
      counts[word] += 1;
    } else {
      counts[word] = 1;
    }
  }


  counts.forEach((key, value) {
    s += '$key : $value \n';
  });

  return s;
}