"
I check that an annotation written as the value of an element of another annotation (JLS 9.7.1), as JPA writes `joinColumns = @JoinColumn(...)`, is imported. The element is modeled as an assignment expression, so its value must be an expression.
"
Class {
	#name : 'JavaSmaCCAnnotationAsElementValueTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCAnnotationAsElementValueTest >> javaClass [

	^ 'class Student {

	@ManyToMany
	@JoinTable(name = "student_course",
		joinColumns = @JoinColumn(name = "student_id"),
		inverseJoinColumns = @JoinColumn(name = "course_id"))
	Set<Course> courses; // an annotation as the value of an element
}'
]

{ #category : 'accessing' }
JavaSmaCCAnnotationAsElementValueTest >> joinTable [

	^ (fastModel allWithType: FASTJavaAnnotation) detect: [ :annotation | annotation name = 'JoinTable' ]
]

{ #category : 'running' }
JavaSmaCCAnnotationAsElementValueTest >> parseClassString: aString [

	^ JavaSmaCCProgramNodeImporterVisitor new
		  withComments;
		  parseCodeString: aString
]

{ #category : 'tests' }
JavaSmaCCAnnotationAsElementValueTest >> testAnnotationKnowsTheElementItIsTheValueOf [

	| element |
	element := self joinTable elements second.
	self assert: element expression javaAssignmentExpressionOwner identicalTo: element
]

{ #category : 'tests' }
JavaSmaCCAnnotationAsElementValueTest >> testCommentIsAttached [

	| comments |
	comments := fastModel allWithType: FASTJavaComment.
	self assert: comments size equals: 1.
	self assert: comments anyOne container isNotNil
]

{ #category : 'tests' }
JavaSmaCCAnnotationAsElementValueTest >> testElementValueIsTheAnnotation [

	| value |
	value := self joinTable elements second expression.
	self assert: value class equals: FASTJavaAnnotation.
	self assert: value name equals: 'JoinColumn'.
	self assert: value elements size equals: 1.
	self assert: value elements first expression primitiveValue equals: 'student_id'
]

{ #category : 'tests' }
JavaSmaCCAnnotationAsElementValueTest >> testNumberOfAnnotations [

	self assert: (fastModel allWithType: FASTJavaAnnotation) size equals: 4
]

{ #category : 'tests' }
JavaSmaCCAnnotationAsElementValueTest >> testNumberOfElementsToJoinTable [

	self assert: self joinTable elements size equals: 3
]
