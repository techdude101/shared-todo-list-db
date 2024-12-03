@ECHO ON

SET testScriptPath=%cd%
SET jmeterPath=%testScriptPath%\..\apache-jmeter-5.6.3\bin\jmeter

START %jmeterPath% -n -t manage_todos_test.jmx -q db.properties -q threads.properties
