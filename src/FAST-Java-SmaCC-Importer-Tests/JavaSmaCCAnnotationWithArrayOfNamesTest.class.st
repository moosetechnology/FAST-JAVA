Class {
	#name : 'JavaSmaCCAnnotationWithArrayOfNamesTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCAnnotationWithArrayOfNamesTest >> array [

	^ (fastModel allWithType: FASTJavaArrayAnnotationElement) anyOne
]

{ #category : 'resources' }
JavaSmaCCAnnotationWithArrayOfNamesTest >> javaMethod [

	^ '@Target({ TYPE, METHOD })
void annotated() {}'
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithArrayOfNamesTest >> testArrayOfNamesIsExportedBack [

	self assert: (fastMethod asSourceCode beginsWith: '@Target({ TYPE, METHOD })')
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithArrayOfNamesTest >> testArrayValueKnowsTheArrayItIsIn [

	self assert: (self array values allSatisfy: [ :each | each arrayOwner == self array ])
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithArrayOfNamesTest >> testArrayValueNames [

	self assert: (self array values collect: [ :each | each name ]) asArray equals: #( 'TYPE' 'METHOD' )
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithArrayOfNamesTest >> testArrayValuesAreNames [

	self assert: self array values size equals: 2.
	self assert: (self array values allSatisfy: [ :each | each class = FASTJavaVariableExpression ])
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithArrayOfNamesTest >> testNamedElementHoldsAnArrayOfNames [

	| named |
	named := self parseMethodString: '@Target(value = { TYPE })
void annotated() {}'.

	self
		assert: ((named allWithType: FASTJavaArrayAnnotationElement) anyOne values collect: [ :each | each name ]) asArray
		equals: #( 'TYPE' )
]
