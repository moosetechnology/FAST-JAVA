Class {
	#name : #JavaSmaCCAnnotation,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCAnnotation >> javaMethod [
	^'@Useless
	void mth() {
	}'
]

{ #category : #tests }
JavaSmaCCAnnotation >> testAnnotatedEntity [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne javaModifierOwner class
		equals: FASTJavaMethodEntity
]

{ #category : #tests }
JavaSmaCCAnnotation >> testNameOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne name equals: 'Useless'
]

{ #category : #tests }
JavaSmaCCAnnotation >> testNumberOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) size equals: 1
]

{ #category : #tests }
JavaSmaCCAnnotation >> testNumberOfArgumentsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements size equals: 0
]
