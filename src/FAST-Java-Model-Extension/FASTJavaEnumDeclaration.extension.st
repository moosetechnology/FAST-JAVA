Extension { #name : 'FASTJavaEnumDeclaration' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaEnumDeclaration >> sourceText [

	^ self source ifNil: [ self parentNode ifNil: [ '' ] ifNotNil: [ :parentNode | parentNode sourceText ] ]
]
