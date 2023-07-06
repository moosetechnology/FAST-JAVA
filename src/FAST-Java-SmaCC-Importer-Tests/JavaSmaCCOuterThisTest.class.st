Class {
	#name : #JavaSmaCCOuterThisTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCOuterThisTest >> javaMethod [
	^ 'void outerThis() {
	call(Hello.this);
}'
]

{ #category : #tests }
JavaSmaCCOuterThisTest >> testOuterThisAsChild [
	self assert: (fastModel allWithType: FASTJavaOuterThis) anyOne equals: fastMethod statements anyOne expression arguments anyOne
]

{ #category : #tests }
JavaSmaCCOuterThisTest >> testOuterThisParent [
	self assert: (fastModel allWithType: FASTJavaOuterThis) anyOne parentNode equals: fastMethod statements anyOne expression
]

{ #category : #tests }
JavaSmaCCOuterThisTest >> testOuterThisSize [
	self assert: (fastModel allWithType: FASTJavaOuterThis ) size equals: 1
]

{ #category : #tests }
JavaSmaCCOuterThisTest >> testOuterThisType [
	self assert: (fastModel allWithType: FASTJavaOuterThis) anyOne type name equals: 'Hello'
]
