Extension { #name : #FASTJavaNewClassMethodStatment }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaNewClassMethodStatment >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaNewClassMethodStatment: self
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaNewClassMethodStatment >> addChild: child [
	self childrenNode add: child
]
