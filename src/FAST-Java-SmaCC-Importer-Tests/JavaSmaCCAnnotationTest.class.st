Class {
	#name : 'JavaSmaCCAnnotationTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCAnnotationTest >> javaMethod [
	^ '@Useless
	void mth() {}'
]

{ #category : 'tests' }
JavaSmaCCAnnotationTest >> testAnAnnotationWritingNoQualifierHasAPlainTypeName [
	"JLS 9.7: an annotation names the type it is an instance of, and a name written with no
	qualifier is a type name with nothing before it."

	| type |
	type := (fastModel allWithType: FASTJavaAnnotation) anyOne type.
	self assert: type class equals: FASTJavaTypeName.
	self assert: type fullName equals: 'Useless'
]

{ #category : 'tests' }
JavaSmaCCAnnotationTest >> testAnnotatedEntity [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne javaAnnotationOwner class
		equals: FASTJavaMethodEntity
]

{ #category : 'tests' }
JavaSmaCCAnnotationTest >> testNameOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne type name equals: 'Useless'
]

{ #category : 'tests' }
JavaSmaCCAnnotationTest >> testNumberOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCAnnotationTest >> testNumberOfElementsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements size equals: 0
]
