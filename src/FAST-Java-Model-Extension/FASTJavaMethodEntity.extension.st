Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> statementBlock [
	^ (self childrenNode select: [ :child | child class isKindOf: FASTStatementBlock class ] )first
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> statementBlock: aJavaStatementBlock [
	self childrenNode add: aJavaStatementBlock
]
