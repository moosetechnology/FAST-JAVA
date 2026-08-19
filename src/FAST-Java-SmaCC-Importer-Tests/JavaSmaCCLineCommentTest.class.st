Class {
	#name : 'JavaSmaCCLineCommentTest',
	#superclass : 'JavaSmaCCCommentsAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCLineCommentTest >> javaMethod [
	^ 'void blah() {
	String someVar; // this is a declaration
}'
]

{ #category : 'tests' }
JavaSmaCCLineCommentTest >> testCommentIsAttached [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.

	self assert: fastComment container isNotNil.
	self assert: fastComment container class equals: FASTJavaVariableDeclarator.
]

{ #category : 'tests' }
JavaSmaCCLineCommentTest >> testCommentProperties [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.

	self deny: (fastModel allWithType: FASTJavaComment) first isBlockComment.
	self assert: (fastModel allWithType: FASTJavaComment) first isLineComment.

	self assert: fastComment content equals: '// this is a declaration'.

	self assert: fastComment startPos equals: 32.
	self assert: fastComment endPos equals: 55
]

{ #category : 'tests' }
JavaSmaCCLineCommentTest >> testModelHasComments [
	self assert: (fastModel allWithType: FASTJavaComment) size equals: 1
]
