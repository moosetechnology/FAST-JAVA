Class {
	#name : #JavaSmaCCBlockCommentTest,
	#superclass : #JavaSmaCCCommentsTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCBlockCommentTest >> methodBlockComment [

	^ 
'void blah() {
  /* the following is a declaration */
  String someVar;
}'
]

{ #category : #running }
JavaSmaCCBlockCommentTest >> setUp [
	super setUp.
	fastModel := (self parseMethod: 'blockComment')
]

{ #category : #tests }
JavaSmaCCBlockCommentTest >> testCommentIsAttached [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.
	self assert: fastComment attachedTo isNotNil.
]

{ #category : #tests }
JavaSmaCCBlockCommentTest >> testCommentProperties [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.

	self assert: (fastModel allWithType: FASTJavaComment) first isBlockComment.
	self deny: (fastModel allWithType: FASTJavaComment) first isJavadocComment.
	self deny: (fastModel allWithType: FASTJavaComment) first isLineComment.

	self assert: fastComment content equals: '/* the following is a declaration */'.

	self assert: fastComment startPos equals: 17.
	self assert: fastComment endPos equals: 52
]

{ #category : #tests }
JavaSmaCCBlockCommentTest >> testModelHasComments [
	self assert: (fastModel allWithType: FASTJavaComment) size equals: 1.
]
