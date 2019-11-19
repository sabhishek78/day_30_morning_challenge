import 'main.dart';

import 'package:test/test.dart';

void main() {
  test('Matryoshka', () {
    expect(matryoshka([[1,10],[2,9],[3,8],[7,4],]),true);
    expect(matryoshka([[2,3,9,5],[10,2,1]]),true);
    expect(matryoshka([[2,3,9,5],[10,2,3]]),false);
    expect(matryoshka([[2,3,9,5],[2,3,9,5]]),false);
    expect(matryoshka([[2],[3]]),false);
    expect(matryoshka([[1,10],[5,6],[8,4]]),true);
  });

}