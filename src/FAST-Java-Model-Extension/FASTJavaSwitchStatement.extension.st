Extension { #name : #FASTJavaSwitchStatement }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaSwitchStatement >> addCase: aCase [
	^ self childrenNode add: aCase
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaSwitchStatement >> cases [
	<computed>
	<navigation: 'cases'>
	^ self childrenNode
		select: [ :childNode | childNode isKindOf: FASTJavaCaseStatement ]
]
