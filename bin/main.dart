import 'dart:math';

// Challenge
// Matryoshka dolls are traditionally wooden dolls that can be nested by fitting
// smaller dolls into larger ones. Suppose arrays can be nested similarly,
// placing smaller arrays into larger ones, in the following sense:
//
//// Array A can be nested inside Array B if:
//// 1. min(array A) > min(array B)
//// 2. max(array A) < max(array B)

//// For example, if A = [2, 3, 9, 5] and B = [10, 2, 1], then A can be nested inside B, since:
////  - min(A) = 2 > 1 = min(B) and
////   - max(A) = 9 < 10 = max(B)

/// Create a function that returns true if every single sub-array inside an array
/// can be nested Matroyshka style, and false otherwise.
///
matryoshka(List<List<int>> dolls) {
  print(dolls);
  dolls.forEach((element) => element.sort());
  print("sorted List");
  print(dolls);
  List<List<int>> MaxMinList = findMaxMinOfEachSubList(dolls);
}

findMaxMinOfEachSubList(List<List<int>> dolls) {
  List<List<int>> tempList = [];
  dolls.forEach((e) {
    List<int> temp = [];
    temp.add(e[0]);
    temp.add(e[e.length - 1]);
    tempList.add(temp);
  });
  print(tempList); //prints each list with only the min and max element
  // arrange list with first element in ascending order
  int swap1;
  int swap2;
  for (int i = 0; i < tempList.length - 1; i++) {
    for (int j = i + 1; j < tempList.length; j++) {
      if (tempList[i][0] > tempList[j][0]) {
        swap1 = tempList[j][0];
        swap2 = tempList[j][1];
        tempList[j][0] = tempList[i][0];
        tempList[j][1] = tempList[i][1];
        tempList[i][0] = swap1;
        tempList[i][1] = swap2;
      }
    }
  }
  print(tempList);
  print(checkForSecondElementDescending(tempList));
}

checkForSecondElementDescending(List<List<int>> tempList) {
  for (int i = 0; i < tempList.length - 1; i++) {
    if (!(tempList[i][1] > tempList[i + 1][1])) {
      return false;
    }
  }
  return true;
}

main() {
  matryoshka([
    [1, 10],
    [2, 9],
    [3, 8],
    [7, 4],
  ]);
  matryoshka([
    [2, 3, 9, 5],
    [10, 2, 1]
  ]);
}
