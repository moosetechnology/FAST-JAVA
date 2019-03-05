Extension { #name : #FASTJavaWhileStatement }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaWhileStatement >> body [
	<computed>
	<navigation: 'body'>
	^ (self childrenNode
		select: [ :childNode | childNode class = FASTJavaBodyStatement  ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaWhileStatement >> body: aFASTJavaBodyStatement [
	self childrenNode
		add:
			(aFASTJavaBodyStatement mooseModel
				silentlyAdd:
					(FASTJavaBodyStatement new
						addChild: aFASTJavaBodyStatement;
						yourself))
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaWhileStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode
		select: [ :childNode | childNode class = FASTJavaConditionStatement ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaWhileStatement >> condition: aFASTJavaConditionStatement [
	self childrenNode
		add:
			(aFASTJavaConditionStatement mooseModel
				silentlyAdd:
					(FASTJavaConditionStatement new
						addChild: aFASTJavaConditionStatement;
						yourself))
]
