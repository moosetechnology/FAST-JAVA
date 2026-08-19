Class {
	#name : 'JavaSmaCCAnnotationWithUnnamedElement',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCAnnotationWithUnnamedElement >> javaMethod [
	^ '@Useless("Argument 1")
	void mth() {}'
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithUnnamedElement >> testAnnotatedEntity [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne javaModifierOwner class
		equals: FASTJavaMethodEntity
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithUnnamedElement >> testNameOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne name equals: 'Useless'
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithUnnamedElement >> testNumberOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithUnnamedElement >> testNumberOfElementsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements size equals: 1
]
