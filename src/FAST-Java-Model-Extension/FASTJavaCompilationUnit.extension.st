Extension { #name : 'FASTJavaCompilationUnit' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaCompilationUnit >> sourceText [

	^ self source ifNil: [ '' ]
]
