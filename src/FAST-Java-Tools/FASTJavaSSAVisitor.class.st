Class {
	#name : 'FASTJavaSSAVisitor',
	#superclass : 'FASTJavaVisitor',
	#instVars : [
		'variableVersions',
		'isBeingAssigned'
	],
	#category : 'FAST-Java-Tools',
	#package : 'FAST-Java-Tools'
}

{ #category : 'instance creation' }
FASTJavaSSAVisitor class >> on: anAST [

	^self new
		on: anAST 
]

{ #category : 'private - ssa' }
FASTJavaSSAVisitor >> assignmentVariableVersion: aFASTFortranVariable [

	^(self createVariableVersion: aFASTFortranVariable)
		newVersionNumber ;
		yourself
]

{ #category : 'private - ssa' }
FASTJavaSSAVisitor >> createVariableVersion: aFASTJavaVariable [

	| newSSA |
	newSSA := FASTSsaVariableVersion for: aFASTJavaVariable.
	aFASTJavaVariable localDeclaration activeVersion
		ifNotNil: [ :lastSSA | newSSA version: lastSSA version ].
	
	aFASTJavaVariable localDeclaration activeVersion: newSSA.
	
	variableVersions add: aFASTJavaVariable localDeclaration.

	^newSSA 
]

{ #category : 'initialization' }
FASTJavaSSAVisitor >> initialize [

	super initialize.

	isBeingAssigned := false
]

{ #category : 'instance creation' }
FASTJavaSSAVisitor >> on: anAST [

	| copy |
	copy := FASTJavaCopyVisitor on: anAST.
	
	FASTJavaLocalResolverVisitor new on: copy.

	variableVersions := Set new.

	copy accept: self.

	^ copy
]

{ #category : 'private - ssa' }
FASTJavaSSAVisitor >> useVariableVersion: aFASTJavaVariable [

	^aFASTJavaVariable localDeclaration activeVersion
		ifNil: [ self createVariableVersion: aFASTJavaVariable ]

]

{ #category : 'generated' }
FASTJavaSSAVisitor >> visitFASTJavaAssignmentExpression: aJavaAssignmentExpression [

	isBeingAssigned := true.
	aJavaAssignmentExpression variable accept: self.
	isBeingAssigned := false.

	aJavaAssignmentExpression expression accept: self.
]

{ #category : 'visiting' }
FASTJavaSSAVisitor >> visitFASTJavaExpressionStatement: aFASTJavaExpressionStatement [

	aFASTJavaExpressionStatement expression accept:self
	
	
]

{ #category : 'visiting' }
FASTJavaSSAVisitor >> visitFASTJavaStatementBlock: aFASTJavaStatementBlock [ 
	
	aFASTJavaStatementBlock statements do: [ :statment | statment accept: self  ].
	
]

{ #category : 'generated' }
FASTJavaSSAVisitor >> visitFASTJavaVariable: aFASTFortranVariable [

1halt.

	isBeingAssigned
		ifTrue: [ aFASTFortranVariable ssaVersion: (self assignmentVariableVersion: aFASTFortranVariable) ]
		ifFalse: [ aFASTFortranVariable ssaVersion: (self useVariableVersion: aFASTFortranVariable) ]
]

{ #category : 'generated' }
FASTJavaSSAVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [

	isBeingAssigned
		ifTrue: [ aFASTJavaVariableExpression ssaVersion: (self assignmentVariableVersion: aFASTJavaVariableExpression) ]
		ifFalse: [ aFASTJavaVariableExpression ssaVersion: (self useVariableVersion: aFASTJavaVariableExpression) ]
]
