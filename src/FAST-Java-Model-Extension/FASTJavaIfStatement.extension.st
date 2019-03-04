Extension { #name : #FASTJavaIfStatement }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaIfStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class =  FASTJavaConditionStatement ]) at: 1 ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaIfStatement >> condition: aFASTJavaConditionStatement [
	self childrenNode
		add:
			(FASTJavaConditionStatement new
				addChild: aFASTJavaConditionStatement;
				yourself)
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaIfStatement >> elsePart [
	<computed>
	<navigation: 'elsePart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaElsePartStatement  ]) at: 1 ifAbsent: [ ^ nil ] 
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaIfStatement >> elsePart: aFASTJavaElsePartStatement [
	self childrenNode
		add:
			(FASTJavaElsePartStatement new
				addChild: aFASTJavaElsePartStatement;
				yourself)
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaIfStatement >> thenPart [
	<computed>
	<navigation: 'thenPart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaThenPartStatement  ]) anyOne
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaIfStatement >> thenPart: aFASTJavaThenPartStatement [
	self childrenNode add: (FASTJavaThenPartStatement new
				addChild: aFASTJavaThenPartStatement;
				yourself)
]
