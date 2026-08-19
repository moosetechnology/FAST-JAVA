Class {
	#name : 'JavaSmaCCAnnotationWithNamedElementsTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCAnnotationWithNamedElementsTest >> javaClass [
	^ 'class AClass {
	@Useless(arg1="Argument 1",arg2=AClass.A_Constant)
	void mth() {}
}'
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithNamedElementsTest >> testAnnotatedEntity [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne javaModifierOwner class
		equals: FASTJavaMethodEntity
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithNamedElementsTest >> testNameOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne name equals: 'Useless'
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithNamedElementsTest >> testNumberOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithNamedElementsTest >> testNumberOfElementsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements size equals: 2
]
