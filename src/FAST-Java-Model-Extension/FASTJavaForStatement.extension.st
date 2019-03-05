Extension { #name : #FASTJavaForStatement }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaForStatement >> body [
	<computed>
	<navigation: 'body'>
	^ (self childrenNode
		select: [ :childNode | childNode class = FASTJavaBodyStatement ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaForStatement >> body: aBodyStatement [
	childrenNode
		add:
			(aBodyStatement mooseModel
				silentlyAdd:
					(FASTJavaBodyStatement new
						addChild: aBodyStatement;
						yourself))
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaForStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode
		select: [ :childNode | childNode class = FASTJavaConditionStatement ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaForStatement >> condition: aConditionStatement [
	self childrenNode
		add:
			(aConditionStatement mooseModel
				silentlyAdd:
					(FASTJavaConditionStatement new
						addChild: aConditionStatement;
						yourself))
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaForStatement >> incrementors [
	<computed>
	<navigation: 'incrementors'>
	^ self childrenNode
		select: [ :childNode | childNode class =  FASTJavaIncrementorsStatement ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaForStatement >> incrementors: aIncrementorStatement [
	self childrenNode
		add:
			(aIncrementorStatement mooseModel
				silentlyAdd:
					(FASTJavaIncrementorsStatement new
						addChild: aIncrementorStatement;
						yourself))
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaForStatement >> initializers [
	<computed>
	<navigation: 'initializers'>
	^ self childrenNode
		select:
			[ :childNode | childNode class =  FASTJavaInitializersStatement ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaForStatement >> initializers: aInitializerStatement [
	self childrenNode
		add:
			(aInitializerStatement mooseModel
				silentlyAdd:
					(FASTJavaInitializersStatement new
						addChild: aInitializerStatement;
						yourself))
]
