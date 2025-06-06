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
JavaSmaCCForTest >> testForBodyParentNode [
	self assert: fastMethod statements first body parentNode equals: fastMethod statements first
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForBodyType [
	self assert: fastMethod statements first body class equals: FASTJavaStatementBlock 
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForConditionParentNode [
	self assert: fastMethod statements first condition parentNode equals: fastMethod statements first
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForConditionType [
	self assert: fastMethod statements first condition class equals: FASTJavaInfixOperation 
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForIncrementorsType [
	self assert: fastMethod statements first incrementor class equals: FASTJavaExpressionStatement 
]

{ #category : 'tests' }
JavaSmaCCForTest >> testForInitializersType [
	self assert: fastMethod statements first initializer class equals: FASTJavaVarDeclStatement
]
