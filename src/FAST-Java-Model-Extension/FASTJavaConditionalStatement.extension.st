Extension { #name : #FASTJavaConditionalStatement }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaConditionalStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class =  FASTJavaConditionStatement ]) at: 1 ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaConditionalStatement >> condition: aFASTJavaConditionStatement [
	self childrenNode
		add:
			(aFASTJavaConditionStatement mooseModel
				silentlyAdd:
					(FASTJavaConditionStatement new
						addChild: aFASTJavaConditionStatement;
						yourself))
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaConditionalStatement >> elsePart [
	<computed>
	<navigation: 'elsePart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaElsePartStatement  ]) at: 1 ifAbsent: [ ^ nil ] 
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaConditionalStatement >> elsePart: aFASTJavaElsePartStatement [
	self childrenNode
		add:
			(aFASTJavaElsePartStatement mooseModel
				silentlyAdd:
					(FASTJavaElsePartStatement new
						addChild: aFASTJavaElsePartStatement;
						yourself))
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaConditionalStatement >> thenPart [
	<computed>
	<navigation: 'thenPart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaThenPartStatement  ]) anyOne
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaConditionalStatement >> thenPart: aFASTJavaThenPartStatement [
	self childrenNode
		add:
			(aFASTJavaThenPartStatement mooseModel
				silentlyAdd:
					(FASTJavaThenPartStatement new
						addChild: aFASTJavaThenPartStatement;
						yourself))
]
