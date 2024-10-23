Class {
	#name : 'JavaSmaCCLineCommentTest',
	#superclass : 'JavaSmaCCCommentsTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'as yet unclassified' }
JavaSmaCCLineCommentTest >> javaMethod [

	^ 
'void blah() {
  String someVar; // this is a declaration
}'
]

{ #category : 'as yet unclassified' }
JavaSmaCCLineCommentTest >> testCommentIsAttached [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.

	self assert: fastComment container isNotNil.
	self assert: fastComment container class equals: FASTJavaVariableDeclarator.
]

{ #category : 'as yet unclassified' }
JavaSmaCCLineCommentTest >> testCommentProperties [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.

	self deny: (fastModel allWithType: FASTJavaComment) first isBlockComment.
	self assert: (fastModel allWithType: FASTJavaComment) first isLineComment.

	self assert: fastComment content equals: '// this is a declaration'.

	self assert: fastComment startPos equals: 33.
	self assert: fastComment endPos equals: 56.

]

{ #category : 'as yet unclassified' }
JavaSmaCCLineCommentTest >> testModelHasComments [
	self assert: (fastModel allWithType: FASTJavaComment) size equals: 1
]
