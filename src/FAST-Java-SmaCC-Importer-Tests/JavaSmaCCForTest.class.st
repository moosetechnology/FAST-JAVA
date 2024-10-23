Class {
	#name : 'JavaSmaCCForTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
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
	self assert: fastMethod statements first incrementor class equals: FASTJavaExpressionStatement 
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForEachInitializersType [
	self assert: fastMethod statements first initializer class equals: FASTJavaVarDeclStatement
]
