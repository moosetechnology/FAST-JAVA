Class {
	#name : #JavaSmaCCAnnotationWithNamedElements,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCAnnotationWithNamedElements >> javaClass [
	^'class AClass {
	@Useless(arg1="Argument 1",arg2=AClass.A_Constant)
	void mth() {
	}
}'
]

{ #category : #running }
JavaSmaCCAnnotationWithNamedElements >> javaMethod [
	^self shouldNotImplement 
]

{ #category : #running }
JavaSmaCCAnnotationWithNamedElements >> setUp [

	fastModel := self parseClassString: self javaClass
]

{ #category : #tests }
JavaSmaCCAnnotationWithNamedElements >> testAnnotatedEntity [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne javaModifierOwner class
		equals: FASTJavaMethodEntity
]

{ #category : #tests }
JavaSmaCCAnnotationWithNamedElements >> testNameOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne name equals: 'Useless'
]

{ #category : #tests }
JavaSmaCCAnnotationWithNamedElements >> testNumberOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) size equals: 1
]

{ #category : #tests }
JavaSmaCCAnnotationWithNamedElements >> testNumberOfElementsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements size equals: 2
]
