Class {
	#name : 'JavaSmaCCClassCanBeParsedWithoutErrorTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCClassCanBeParsedWithoutErrorTest >> javaClass [
	^ 'package hello;

import java;
import patate;

class A {
	void hello() {
		int i = 0;
	}
}'
]

{ #category : 'running' }
JavaSmaCCClassCanBeParsedWithoutErrorTest >> setUp [
	"not doing anything because we want to call parsing in the test itself"
]

{ #category : 'tests' }
JavaSmaCCClassCanBeParsedWithoutErrorTest >> testAccessToClassSourceText [
	self shouldnt: [ self parseClassString: self javaClass ] raise: Error
]
