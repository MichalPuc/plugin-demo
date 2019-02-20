#!/bin/bash

# Execute this from the project root directory

nosetests --with-tap --tap-stream 2> output.tap
tcms-tap-plugin output.tap

nosetests --with-xunit
tcms-junit.xml-plugin nosetests.xml