Extension { #name : 'FASTJavaClassDeclaration' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaClassDeclaration >> sourceText [

	^ self source ifNil: [ self parentNode ifNil: [ '' ] ifNotNil: [ :parentNode | parentNode sourceText ] ]
]
