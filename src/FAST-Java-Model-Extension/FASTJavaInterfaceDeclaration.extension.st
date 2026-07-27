Extension { #name : 'FASTJavaInterfaceDeclaration' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaInterfaceDeclaration >> sourceText [

	^ self source ifNil: [ self parentNode ifNil: [ '' ] ifNotNil: [ :parentNode | parentNode sourceText ] ]
]
