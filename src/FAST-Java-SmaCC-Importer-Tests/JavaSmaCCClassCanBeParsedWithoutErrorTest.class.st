Class {
	#name : #JavaSmaCCClassCanBeParsedWithoutErrorTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCClassCanBeParsedWithoutErrorTest >> classString [
	^ 'package hello;

import java;
import patate;
	
class A {
	void hello() {
		int i = 0;
	}
}' 
]

{ #category : #tests }
JavaSmaCCClassCanBeParsedWithoutErrorTest >> testAccessToClassSourceText [
	self shouldnt: [ self parseClassString: self classString ]  raise: Error
]
