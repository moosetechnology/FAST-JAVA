Extension { #name : 'FASTJavaInitializer' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaInitializer >> sourceText [

	^ self source ifNil: [ self parentNode ifNil: [ '' ] ifNotNil: [ :parentNode | parentNode sourceText ] ]
]
