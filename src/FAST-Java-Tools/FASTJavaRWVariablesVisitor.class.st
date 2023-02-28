Class {
	#name : #FASTJavaRWVariablesVisitor,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'variablesW',
		'variablesR'
	],
	#category : #'FAST-Java-Tools-resolver'
}

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> initStatement [

	variablesW := Set new.
	variablesR := Set new
]

{ #category : #'instance creation' }
FASTJavaRWVariablesVisitor >> on: aNode [
	aNode accept: self
]

{ #category : #accessing }
FASTJavaRWVariablesVisitor >> variablesR [

	^ variablesR
]

{ #category : #accessing }
FASTJavaRWVariablesVisitor >> variablesW [

	^ variablesW
]

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
	variablesW add: aFASTJavaAssignementExpression localDeclaration.
	aFASTJavaAssignementExpression expression accept: self
]

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> visitFASTJavaElsePartStatement: aFASTJavaStatement [
	aFASTJavaStatement ifNotNil: [ aFASTJavaStatement accept: self ]
]

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	variablesR add: aFASTJavaIdentifier localDeclaration
]

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	"this rule only handles the condition. It is visited last so that at the end of the visit,
	variablesW and variablesR are referent to this condition
	To deal with read/Write variables in THEN/ELSE parts use the specialized visit methods"
	self visitFASTJavaThenPartStatement: aFASTJavaIfStatement thenPart.
	self visitFASTJavaElsePartStatement: aFASTJavaIfStatement elsePart.

	self initStatement.
	aFASTJavaIfStatement condition accept: self.

]

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> visitFASTJavaThenPartStatement: aFASTJavaStatement [
	aFASTJavaStatement accept: self
]

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	self initStatement.
	super visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement

]

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	variablesW add: aFASTJavaVariableDeclarator localDeclaration.

	aFASTJavaVariableDeclarator expression ifNil: [ ^ self ].
	aFASTJavaVariableDeclarator expression accept: self
]

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	variablesR add: aFASTJavaVariableExpression localDeclaration
]

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> visitFASTTExpressionStatement: aFASTTExpressionStatement [

	self initStatement.
	super visitFASTTExpressionStatement: aFASTTExpressionStatement
]

{ #category : #visiting }
FASTJavaRWVariablesVisitor >> visitFASTTReturnStatement: aFASTTReturnStatement [
	self initStatement.
	super visitFASTTReturnStatement: aFASTTReturnStatement
]
