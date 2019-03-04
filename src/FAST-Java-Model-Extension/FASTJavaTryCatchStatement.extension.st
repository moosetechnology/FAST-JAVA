Extension { #name : #FASTJavaTryCatchStatement }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaTryCatchStatement >> addCatch: aFASTJavaCatchPartStatement [ 
	self childrenNode add: aFASTJavaCatchPartStatement
	
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaTryCatchStatement >> catches [
	<computed>
	<navigation: #catches>
	^ (self childrenNode select: [ :childNode | childNode isKindOf: FASTJavaCatchPartStatement ])
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaTryCatchStatement >> try [
	<computed>
	<navigation: 'try'>
	^ (self childrenNode
		select: [ :childNode | childNode class =  FASTJavaTryPartStatement ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaTryCatchStatement >> try: aFASTJavaTryPartStatement [
	self childrenNode add: (FASTJavaTryPartStatement new
				addChild: aFASTJavaTryPartStatement;
				yourself)
]
