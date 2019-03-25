Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> sourceText [

	^ self source ifNil: [ self parentNode ifNil: [ nil ] ifNotNil: [ :existingParentNode | existingParentNode sourceText ] ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> statements [
	^ self statementBlock statements
]
