Class {
	#name : 'JavaSmaCCJavadocCommentTest',
	#superclass : 'JavaSmaCCCommentsTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'as yet unclassified' }
JavaSmaCCJavadocCommentTest >> javaMethod [

	^ 
'/** Blah ! Not doing much
*/
void blah() { }
'
]

{ #category : 'as yet unclassified' }
JavaSmaCCJavadocCommentTest >> testCommentIsAttached [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.

	self assert: fastComment container isNotNil.
	self assert: fastComment container class equals: FASTJavaMethodEntity.
]

{ #category : 'as yet unclassified' }
JavaSmaCCJavadocCommentTest >> testCommentProperties [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.

	self assert: (fastModel allWithType: FASTJavaComment) first isBlockComment.
	self assert: (fastModel allWithType: FASTJavaComment) first isJavadocComment.
	self deny: (fastModel allWithType: FASTJavaComment) first isLineComment.

	self assert: fastComment content equals: '/** Blah ! Not doing much
*/'.

	self assert: fastComment startPos equals: 1.
	self assert: fastComment endPos equals: 28
]

{ #category : 'as yet unclassified' }
JavaSmaCCJavadocCommentTest >> testModelHasComments [
	self assert: (fastModel allWithType: FASTJavaComment) size equals: 1

]
