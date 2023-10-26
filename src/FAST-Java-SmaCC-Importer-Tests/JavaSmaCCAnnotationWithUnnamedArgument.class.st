Class {
	#name : #JavaSmaCCAnnotationWithUnnamedArgument,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCAnnotationWithUnnamedArgument >> javaMethod [
	^'@Useless("Argument 1")
	void mth() {
	}'
]

{ #category : #tests }
JavaSmaCCAnnotationWithUnnamedArgument >> testAnnotatedEntity [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne javaModifierOwner class
		equals: FASTJavaMethodEntity
]

{ #category : #tests }
JavaSmaCCAnnotationWithUnnamedArgument >> testNameOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne name equals: 'Useless'
]

{ #category : #tests }
JavaSmaCCAnnotationWithUnnamedArgument >> testNumberOfAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) size equals: 1
]

{ #category : #tests }
JavaSmaCCAnnotationWithUnnamedArgument >> testNumberOfArgumentsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne arguments size equals: 1
]
