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

main() {
  print(matryoshka([
    [1, 10],
    [2, 9],
    [3, 8],
    [7, 4],
  ]));
  print(matryoshka([
    [2, 3, 9, 5],
    [10, 2, 1]
  ]));
}

bool matryoshka(List<List<int>> dolls) {
  bool flag=true;
  dolls.forEach((element) => element.sort());
  for (int i = 0; i < dolls.length - 1; i++) {
    for (int j = i; j < dolls.length; j++) {
       if(dolls[i].first<dolls[j].first){
         if(dolls[i].last>dolls[j].last){
           flag=true;
         }
         else{
           return false;
         }
       }
       else if(dolls[i].first>dolls[j].first){
         if(dolls[i].last<dolls[j].last){
           flag=true;
         }
         else{
           return false;
         }
       }
    }
  }
  return flag;
}
