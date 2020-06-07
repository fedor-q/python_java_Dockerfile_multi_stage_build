# Python part
FROM python:3.7.7-alpine AS base
MAINTAINER FedorD fedord.qa@gmail.com

# Create folder for reports
RUN mkdir /reports

# Set WORKDIR
WORKDIR /python-test

# Copy project files to container
COPY . .

# Install python requirements
RUN pip install --no-cache-dir -r requirements.txt

# Run pytest and generate report
# Always return exit code as 0 to avoid container build interruption
RUN pytest -v --junitxml=/reports/python_tests_result.xml; exit 0


# Java part
FROM java:8-jdk-alpine

# Create folder for reports
RUN mkdir /reports

# Copy python tests result from base
COPY --from=base /reports/python_tests_result.xml /reports

# Go to java test directory and prepare test
WORKDIR /java-test
RUN mkdir jars
COPY --from=base /python-test/jars/test.jar jars/
WORKDIR jars

# Run main method of CreateAJarFile class
# And put output to test_jar_output.log file
RUN java -cp test.jar CreateAJarFile > /reports/test_jar_output.log

# Keep container alive after tests
CMD tail -f /dev/null
