Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> sourceText [

	^ self source ifNil: [ self parentNode ifNil: [ nil ] ifNotNil: [ :existingParentNode | existingParentNode sourceText ] ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> statementBlock [
	^ (self childrenNode select: [ :child | child class isKindOf: FASTStatementBlock class ] )first
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> statementBlock: aJavaStatementBlock [
	self childrenNode add: aJavaStatementBlock
]
