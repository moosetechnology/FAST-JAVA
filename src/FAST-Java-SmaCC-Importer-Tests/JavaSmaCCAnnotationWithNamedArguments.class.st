Class {
	#name : #JavaSmaCCAnnotationWithNamedArguments,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCAnnotationWithNamedArguments >> javaClass [
	^'class AClass {
	@Useless(arg1="Argument 1",arg2=AClass.A_Constant)
	void mth() {
	}
}'
]

{ #category : #running }
JavaSmaCCAnnotationWithNamedArguments >> javaMethod [
	^self shouldNotImplement 
]

{ #category : #running }
JavaSmaCCAnnotationWithNamedArguments >> setUp [

	fastModel := self parseClassString: self javaClass
]

{ #category : #tests }
JavaSmaCCAnnotationWithNamedArguments >> testAnnotatedEntity [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne javaModifierOwner class
		equals: FASTJavaMethodEntity
]

{ #category : #tests }
JavaSmaCCAnnotationWithNamedArguments >> testNameOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne name equals: 'Useless'
]

{ #category : #tests }
JavaSmaCCAnnotationWithNamedArguments >> testNumberOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) size equals: 1
]

{ #category : #tests }
JavaSmaCCAnnotationWithNamedArguments >> testNumberOfArgumentsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne arguments size equals: 2
]
