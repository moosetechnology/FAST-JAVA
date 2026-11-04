Class {
	#name : 'JavaSmaCCQualifiedAnnotationTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCQualifiedAnnotationTest >> javaMethod [
	^ '@java.io.Serial
	void mth() {}'
]

{ #category : 'tests' }
JavaSmaCCQualifiedAnnotationTest >> testAnAnnotationMayWriteTheNameOfItsTypeQualified [
	"JLS 9.7: an annotation may write the name of its type qualified, and the whole of what
	it writes is one type name."

	| type |
	type := (fastModel allWithType: FASTJavaAnnotation) anyOne type.
	self assert: type class equals: FASTJavaQualifiedTypeName.
	self assert: type fullName equals: 'java.io.Serial'
]

{ #category : 'tests' }
JavaSmaCCQualifiedAnnotationTest >> testNameOfAnnotation [
	"JLS 6.5: the last of the names written is the name of what is named."

	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne type name equals: 'Serial'
]
