library run_impl;
import "package:unittest/unittest.dart";

import "package:dn-ui/common.dart";

void main() {
  test( 'size', () {
    var s = new Size(1,2);
    expect( s.width, equals(1) );
    expect( s.height, equals(2) );
  } );

  test( 'UiLocation', () {
    var l = new UiLocation(1,2,3);
    expect( l.x, equals(1) );
    expect( l.y, equals(2) );
    expect( l.z, equals(3) );
  });
}

