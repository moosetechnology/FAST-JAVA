Class {
	#name : #JavaSmaCC2BlockCommentsTest,
	#superclass : #JavaSmaCCCommentsTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCC2BlockCommentsTest >> javaMethod [

	^ 
'/* this is a useless method */
/* but it is usefull for testing */
void blah() {
}'
]

{ #category : #'as yet unclassified' }
JavaSmaCC2BlockCommentsTest >> testCommentIsAttached [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) first.

	self assert: fastComment container isNotNil.
	self assert: fastComment container class equals: FASTJavaMethodEntity.

	fastComment := (fastModel allWithType: FASTJavaComment) second.

	self assert: fastComment container isNotNil.
	self assert: fastComment container class equals: FASTJavaMethodEntity.
]

{ #category : #'as yet unclassified' }
JavaSmaCC2BlockCommentsTest >> testCommentProperties [
	| fastComment |
	fastComment := (fastModel allWithType: FASTJavaComment) first.

	self assert: (fastModel allWithType: FASTJavaComment) first isBlockComment.
	self assert: fastComment content equals: '/* this is a useless method */'.

	fastComment := (fastModel allWithType: FASTJavaComment) second.

	self assert: (fastModel allWithType: FASTJavaComment) first isBlockComment.
	self assert: fastComment content equals: '/* but it is usefull for testing */'.

]

{ #category : #'as yet unclassified' }
JavaSmaCC2BlockCommentsTest >> testModelHasComments [
	self assert: (fastModel allWithType: FASTJavaComment) size equals: 2
]
