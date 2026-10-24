Class {
	#name : 'JavaSmaCCForTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCForTest >> javaMethod [
	^ 'void forMethod() {
	for (int i = 0;i< 3;++i){
		i++;
	}
}'
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForEachBodyParentNode [
	self assert: fastMethod statements first body parentNode equals: fastMethod statements first
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForEachBodyType [
	self assert: fastMethod statements first body class equals: FASTJavaStatementBlock 
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForEachConditionParentNode [
	self assert: fastMethod statements first condition parentNode equals: fastMethod statements first
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForEachConditionType [
	self assert: fastMethod statements first condition class equals: FASTJavaInfixOperation 
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForEachIncrementorsType [
	self assert: fastMethod statements first incrementors first class equals: FASTJavaExpressionStatement
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForEachInitializersType [
	self assert: fastMethod statements first initializers first class equals: FASTJavaVarDeclStatement
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForHeaderKeepsEveryStatementItWrites [
	"JLS 14.14.1: the first and the last part of the header of a for are lists of statement
	expressions, so a for keeps every statement they write, not only the last."

	| loop |
	loop := ((self parseMethodString: 'void forMethod() {
	for (i = 0, j = 1; i < 3; i = i + 1, j = j + i) {
	}
}') allWithType: FASTJavaForStatement) anyOne.

	self
		assert: (loop initializers collect: [ :statement | statement expression variable name ]) asArray
		equals: #( 'i' 'j' ).
	self
		assert: (loop incrementors collect: [ :statement | statement expression variable name ]) asArray
		equals: #( 'i' 'j' )
]
