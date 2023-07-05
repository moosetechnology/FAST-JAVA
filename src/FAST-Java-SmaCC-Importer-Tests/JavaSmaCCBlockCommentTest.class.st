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
  /* block comment at the end */
}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCBlockCommentTest >> setUp [
	super setUp.
	fastModel := (self parseMethod: 'blockComment')
]

{ #category : #tests }
JavaSmaCCBlockCommentTest >> testCommentIsAttached [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) first.

	self assert: fastComment container isNotNil.
	self assert: fastComment container class equals: FASTJavaVarDeclStatement.

	fastComment := (fastModel allWithType: FASTJavaComment) second.

	self assert: fastComment container isNil.

]

{ #category : #tests }
JavaSmaCCBlockCommentTest >> testCommentProperties [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) first.

	self assert: (fastModel allWithType: FASTJavaComment) first isBlockComment.
	self deny: (fastModel allWithType: FASTJavaComment) first isJavadocComment.
	self deny: (fastModel allWithType: FASTJavaComment) first isLineComment.

	self assert: fastComment content equals: '/* the following is a declaration */'.

	self assert: fastComment startPos equals: 17.
	self assert: fastComment endPos equals: 52
]

{ #category : #tests }
JavaSmaCCBlockCommentTest >> testModelHasComments [
	self assert: (fastModel allWithType: FASTJavaComment) size equals: 2
]
