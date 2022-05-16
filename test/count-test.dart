import 'package:flutter_test/flutter_test.dart';
import 'package:q_event_scanner/test.dart';

void main()
{
  /*
  ////simple test
  test('check if increments work', (){
    final obj = Counter();
    ///test => use func want to test
       obj.increment();

       //actual => value is actual
      //matcher => value expect
       expect( obj.count , 1 );

  });*/


  //grouping with test

  group( ' check all cases in counter ', (){

      final obj = Counter();

      test('check increment done ', (){
        obj.increment();
        expect(obj.count, 1);

      });

      test('check decrement done', (){

        obj.decrement();
        expect(obj.count, 0);
      });
  });
}