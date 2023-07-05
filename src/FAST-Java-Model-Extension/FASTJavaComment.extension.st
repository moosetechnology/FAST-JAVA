Extension { #name : #FASTJavaComment }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaComment >> isBlockComment [
	^self content beginsWith: '/*'
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaComment >> isJavadocComment [
	^self content beginsWith: '/**'
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaComment >> isLineComment [
	^self content beginsWith: '//'
]
