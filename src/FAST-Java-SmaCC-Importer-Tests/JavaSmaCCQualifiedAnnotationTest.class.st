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
JavaSmaCCQualifiedAnnotationTest >> testNameOfAnnotation [
	"JLS 6.5: the last of the names written is the name of what is named."

	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne name equals: 'Serial'
]

{ #category : 'tests' }
JavaSmaCCQualifiedAnnotationTest >> testQualifiedNameOfAnnotation [
	"JLS 9.7: an annotation names the type it is an instance of, and may write that name
	qualified."

	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne qualifiedName fullName
		equals: 'java.io.Serial'
]
