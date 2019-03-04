Extension { #name : #FASTJavaBodyStatement }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaBodyStatement >> addChild: child [
	self childrenNode add: child
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaBodyStatement >> statements [
	<computed>
	^ childrenNode flatCollect: #statements
]
