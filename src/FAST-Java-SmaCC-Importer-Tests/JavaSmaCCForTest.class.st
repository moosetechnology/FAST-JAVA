Class {
	#name : #JavaSmaCCForTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodFor'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCForTest >> methodFor [
	^ 'void forMethod() {
	for (int i = 0;i< 3;++i){
		i++;
	}
}'
]

{ #category : #running }
JavaSmaCCForTest >> setUp [
	super setUp.
	methodFor := (self parseMethod: 'for') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachBodyParentNode [
	self assert: methodFor statements first body parentNode equals: methodFor statements first
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachBodyType [
	self assert: methodFor statements first body class equals: FASTJavaStatementBlock 
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachConditionParentNode [
	self assert: methodFor statements first condition parentNode equals: methodFor statements first
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachConditionType [
	self assert: methodFor statements first condition class equals: FASTJavaInfixOperation 
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachIncrementorsType [
	self assert: methodFor statements first incrementor class equals: FASTJavaExpressionStatement 
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachInitializersType [
	self assert: methodFor statements first initializer class equals: FASTJavaVarDeclStatement
]
