Run docker 

_cp $container_id:/python-test/reports/result.xml ~/ && docker cp e8072abeb5ba:/python-test/test_jar_output.log ~/_ 

to copy the test results into your home directory