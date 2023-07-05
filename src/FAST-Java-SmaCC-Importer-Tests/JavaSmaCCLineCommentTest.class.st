Class {
	#name : #JavaSmaCCLineCommentTest,
	#superclass : #JavaSmaCCCommentsTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCLineCommentTest >> methodLineComment [

	^ 
'void blah() {
  String someVar; // this is a declaration
}'
]

{ #category : #running }
JavaSmaCCLineCommentTest >> setUp [
	super setUp.
	fastModel := (self parseMethod: 'lineComment')
]

{ #category : #tests }
JavaSmaCCLineCommentTest >> testCommentIsAttached [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.

	self assert: fastComment attachedTo isNotNil.
	self assert: fastComment attachedTo class equals: FASTJavaVariableDeclarator.
]

{ #category : #tests }
JavaSmaCCLineCommentTest >> testCommentProperties [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.

	self deny: (fastModel allWithType: FASTJavaComment) first isBlockComment.
	self assert: (fastModel allWithType: FASTJavaComment) first isLineComment.

	self assert: fastComment content equals: '// this is a declaration'.

	self assert: fastComment startPos equals: 33.
	self assert: fastComment endPos equals: 56.

]

{ #category : #tests }
JavaSmaCCLineCommentTest >> testModelHasComments [
	self assert: (fastModel allWithType: FASTJavaComment) size equals: 1
]
