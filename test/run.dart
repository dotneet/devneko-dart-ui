library run_impl;

import "package:unittest/unittest.dart";
import "package:unittest/vm_config.dart";
import "common_test.dart" as common_test;

void main() {
  useVmConfiguration();
  common_test.main();
}

