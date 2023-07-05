Class {
	#name : #JavaSmaCCJavadocCommentTest,
	#superclass : #JavaSmaCCCommentsTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCJavadocCommentTest >> methodJavadocComment [

	^ 
'/** Blah ! Not doing much
*/
void blah() { }
'
]

{ #category : #running }
JavaSmaCCJavadocCommentTest >> setUp [
	super setUp.
	fastModel := (self parseMethod: 'javadocComment')
]

{ #category : #tests }
JavaSmaCCJavadocCommentTest >> testCommentIsAttached [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) anyOne.
	self assert: fastComment attachedTo isNotNil.
]

{ #category : #tests }
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

{ #category : #tests }
JavaSmaCCJavadocCommentTest >> testModelHasComments [
	self assert: (fastModel allWithType: FASTJavaComment) size equals: 1

]
