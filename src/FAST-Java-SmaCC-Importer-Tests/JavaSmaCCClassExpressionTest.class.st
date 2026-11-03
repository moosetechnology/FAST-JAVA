Class {
	#name : 'JavaSmaCCClassExpressionTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCClassExpressionTest >> javaMethod [
	^ 'void arrayAccess() {
	int i = Hello.property;
}'
]

{ #category : 'tests' }
JavaSmaCCClassExpressionTest >> testClassExpressionFieldName [
	self assert: fastMethod statements anyOne declarators anyOne expression name equals: 'property' 
]

{ #category : 'tests' }
JavaSmaCCClassExpressionTest >> testClassExpressionParent [
	self assert: fastMethod statements anyOne declarators anyOne expression parentNode equals: fastMethod statements anyOne declarators anyOne 
]

{ #category : 'tests' }
JavaSmaCCClassExpressionTest >> testClassExpressionSize [
	"JLS 6.5: each part of a dotted name is a name of its own, so `Hello.property` is two of
	them, `property` qualified by `Hello`."

	| names |
	names := fastMethod mooseModel allWithType: FASTJavaQualifiedName.
	self assert: names size equals: 2.
	self assert: (names collect: [ :each | each name ] as: Set) equals: #( 'Hello' 'property' ) asSet
]

{ #category : 'tests' }
JavaSmaCCClassExpressionTest >> testClassExpressionType [
	self assert: fastMethod statements anyOne declarators anyOne expression class equals: FASTJavaQualifiedName 
]
