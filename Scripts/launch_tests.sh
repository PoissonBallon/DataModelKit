#!/bin/sh

dataModelPath=`cd Tests/Ressources/Sample.xcdatamodel;pwd`;
echo "$dataModelPath"
DATAMODEL_TEST_PATH=$dataModelPath xcodebuild -scheme DataModelKit-Package -enableCodeCoverage YES test  -verbose
