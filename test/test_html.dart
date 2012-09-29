library run_impl;
import "package:unittest/unittest.dart";
import 'package:unittest/html_config.dart';

import "package:dn_ui/common.dart";
import "package:dn_ui/vwindow.dart";

void main() {
  useHtmlConfiguration();
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

