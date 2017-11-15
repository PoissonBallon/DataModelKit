#!/bin/sh

dataModelPath=`cd Tests/Ressources/Sample.xcdatamodel;pwd`;
echo "$dataModelPath"
xcodebuild -scheme DataModelKit-Package -enableCodeCoverage YES test DATAMODEL_TEST_PATH=$dataModelPath | xcpretty;
