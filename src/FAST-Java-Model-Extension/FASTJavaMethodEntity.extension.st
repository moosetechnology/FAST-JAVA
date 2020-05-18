Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> sourceText [

	^ self source ifNil: [ self parentNode ifNil: [ '' ] ifNotNil: [ :existingParentNode | existingParentNode sourceText ] ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> statements [
	^ self statementBlock ifNotNil: [ :existingStatementBlock | existingStatementBlock statements ] ifNil: [ OrderedCollection new ]
]
