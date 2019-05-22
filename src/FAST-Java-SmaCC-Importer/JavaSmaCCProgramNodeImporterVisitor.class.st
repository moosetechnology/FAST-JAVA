Class {
	#name : #JavaSmaCCProgramNodeImporterVisitor,
	#superclass : #JavaProgramNodeVisitor,
	#instVars : [
		'model',
		'currentFASTEntity',
		'parentFASTVisitor'
	],
	#classInstVars : [
		'hello'
	],
	#category : #'FAST-Java-SmaCC-Importer'
}

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> addToModel: anEntity [
	self model silentlyAdd: anEntity.
	^ anEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> clone [
	^ self class new
			model: self model ;
			parentFASTVisitor: self ; 
			yourself.
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> createExpression: aFASTExp [
	currentFASTEntity := self addToModel: aFASTExp.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> currentFASTEntity [
	^ currentFASTEntity 
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> generalVisitActionForNodeEntity: aNodeEntity [
	self parentFASTVisitor ifNotNil: [  ] ifNil: [ currentFASTEntity source: aNodeEntity completeSource asString ].
	currentFASTEntity startPos: aNodeEntity startPosition.
	currentFASTEntity endPos: aNodeEntity stopPosition
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> initialize [
	super initialize.
	model := MooseModel new metamodel: FASTJavaMetamodelGenerator metamodel; yourself
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> model [
	^ model
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> model: aModel [
	model := aModel
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parentFASTEntity [
	
	^ parentFASTVisitor currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parentFASTVisitor [
	
	^ parentFASTVisitor
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parentFASTVisitor: anObject [
	
	parentFASTVisitor := anObject
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parseCodeMethodString: aCodeString [
	| ast |
	ast := JavaParser
		parse: aCodeString
		startingAt: JavaParser startingStateForclass_body_declaration.
	self accept: ast.
	^ self model
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parseCodeString: aCodeString [
	| ast |
	ast := JavaParser parse: aCodeString.
	self visitSmaCCParseNode: ast.
	^self  model
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitArrayAccess: anArrayAccess [
	currentFASTEntity := self addToModel: FASTJavaArrayAccess new.
	self generalVisitActionForNodeEntity: anArrayAccess.
	currentFASTEntity array: (self clone accept: anArrayAccess array).
	currentFASTEntity
		expression: (self clone accept: anArrayAccess expression).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitArrayInitializer: anArrayInitializer [
	currentFASTEntity := self addToModel: FASTJavaArrayInitializer new.
	self generalVisitActionForNodeEntity: anArrayInitializer.
	anArrayInitializer initializers do: [ :initializer | currentFASTEntity initializers add: (self clone accept: initializer) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitArrayType: anArrayType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaArrayType new
				baseType: (self clone accept: anArrayType baseType);
				yourself).
	self generalVisitActionForNodeEntity: anArrayType.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitArrayVariableName: anArrayVariableName [
	^ self accept: anArrayVariableName variable
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitAssignment: aVariableDeclaration [
	currentFASTEntity := self
		addToModel: FASTJavaAssignementExpression new.
	self generalVisitActionForNodeEntity: aVariableDeclaration.
	currentFASTEntity
		variable: (self clone accept: aVariableDeclaration variable).
	currentFASTEntity
		expression: (self clone accept: aVariableDeclaration value).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitBinaryExpression: aBinaryExpression [
	currentFASTEntity := self addToModel: FASTJavaInfixOperation new.
	self generalVisitActionForNodeEntity: aBinaryExpression.
	currentFASTEntity
		leftOperand: (self clone accept: aBinaryExpression leftExpression).
	currentFASTEntity
		rightOperand: (self clone accept: aBinaryExpression rightExpression).
	currentFASTEntity operator: aBinaryExpression op value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitBlock: aBlock [
	currentFASTEntity := self addToModel: FASTStatementBlock new.
	self generalVisitActionForNodeEntity: aBlock.
	aBlock statements
		do: [ :each | currentFASTEntity statements add: (self clone accept: each) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitBooleanLiteral: aBooleanLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTBooleanLiteral new
				value: aBooleanLiteral token value;
				yourself).
	self generalVisitActionForNodeEntity: aBooleanLiteral.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitBreakStatement: aBreakStatement [
	currentFASTEntity := self addToModel: FASTJavaContinueStatement new.
	self generalVisitActionForNodeEntity: aBreakStatement.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitCastExpression: aCastExpression [
	currentFASTEntity := self addToModel: FASTJavaCastExpression new.
	self generalVisitActionForNodeEntity: aCastExpression.
	currentFASTEntity type: (self clone accept: aCastExpression type).
	currentFASTEntity
		expression: (self clone accept: aCastExpression expression).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitCatchClause: aCatchClause [
	currentFASTEntity := self addToModel: FASTJavaCatchPartStatement new.
	self generalVisitActionForNodeEntity: aCatchClause.
	self clone accept: aCatchClause parameter.
	currentFASTEntity body: (self clone accept: aCatchClause block).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitCatchParameter: aCatchParameter [
	| param |
	param := self visitName: aCatchParameter variable.
	self parentFASTEntity parameter: param.
	^ param
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitCharacterLiteral: aCharacterLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaCharacterLiteral new
				value: aCharacterLiteral token value;
				yourself).
	self generalVisitActionForNodeEntity: aCharacterLiteral.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitClassExpression: aClassExpression [
	currentFASTEntity := self addToModel: FASTJavaClassProperty new.
	self generalVisitActionForNodeEntity: aClassExpression.
	currentFASTEntity type: (self clone accept: aClassExpression type).
	currentFASTEntity fieldName: aClassExpression classToken value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitClassType: aClassType [
	currentFASTEntity := self addToModel: FASTVariableExpression new.
	currentFASTEntity name: aClassType name name value.
	self generalVisitActionForNodeEntity: aClassType.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitConditionalExpression: aConditionalExpression [
	currentFASTEntity := self
		addToModel: FASTJavaConditionalExpression new.
	self generalVisitActionForNodeEntity: aConditionalExpression.
	currentFASTEntity
		condition: (self clone accept: aConditionalExpression testExpression).
	currentFASTEntity
		thenPart: (self clone accept: aConditionalExpression trueExpression).
	aConditionalExpression falseExpression
		ifNotNil: [ currentFASTEntity
				elsePart: (self clone accept: aConditionalExpression falseExpression) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitContinueStatement: aContinueStatement [
	currentFASTEntity := self addToModel: FASTJavaContinueStatement new.
	self generalVisitActionForNodeEntity: aContinueStatement.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitDeclaration: aConstructorDeclaration [
	currentFASTEntity := FASTJavaMethodEntity new
		name: aConstructorDeclaration name name value;
		yourself.
	aConstructorDeclaration parameters
		do: [ :parameter | self clone accept: parameter ].
	currentFASTEntity
		statementBlock: (self clone accept: aConstructorDeclaration body).
	self addToModel: currentFASTEntity.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitEmptyDeclaration: anEmptyDeclaration [
	currentFASTEntity := self addToModel: FASTJavaEmptyMethodDeclaration new.
	self generalVisitActionForNodeEntity: anEmptyDeclaration.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitEmptyStatement: anEmptyStatement [
	currentFASTEntity := self addToModel: FASTStatement new.
	self generalVisitActionForNodeEntity: anEmptyStatement.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitExpressionStatement: anExpressionStatement [
	currentFASTEntity := self addToModel: FASTExpressionStatement new.
	self generalVisitActionForNodeEntity: anExpressionStatement.
	currentFASTEntity
		expression: (self clone accept: anExpressionStatement expression).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitFieldAccess: aFieldAccess [
	currentFASTEntity := self addToModel: FASTJavaFieldAccess new.
	self generalVisitActionForNodeEntity: aFieldAccess.
	currentFASTEntity fieldName: aFieldAccess name value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitFieldDeclaration: aFieldDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	self generalVisitActionForNodeEntity: aFieldDeclaration.
	aFieldDeclaration variableDeclarations
		do: [ :each | currentFASTEntity declarators add: (self clone accept: each) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitFloatLiteral: aFloatLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaFloatLiteral new
				value: aFloatLiteral token value;
				yourself).
		self generalVisitActionForNodeEntity: aFloatLiteral.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitForEachStatement: aForEachStatement [
	currentFASTEntity := self addToModel: FASTJavaForEachStatement new.
	self generalVisitActionForNodeEntity: aForEachStatement.
	currentFASTEntity
		body: (self clone accept: aForEachStatement statement).
	currentFASTEntity
		fieldname: (self clone accept: aForEachStatement name).
	currentFASTEntity type: (self clone accept: aForEachStatement type).
	currentFASTEntity
		list: (self clone accept: aForEachStatement expression).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitForStatement: aForStatement [
	currentFASTEntity := self addToModel: FASTJavaForStatement new.
	self generalVisitActionForNodeEntity: aForStatement.
	aForStatement test
		ifNotNil: [ :test | currentFASTEntity condition: (self clone accept: test) ].
	aForStatement _update
		ifNotNil:
			[ :_update | currentFASTEntity incrementor: (self clone accept: _update) ].
	aForStatement initial
		ifNotNil:
			[ :initial | currentFASTEntity initializer: (self clone accept: initial) ].
	aForStatement statement
		ifNotNil:
			[ :statement | currentFASTEntity body: (self clone accept: statement) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitIfElseStatement: anIfStatementNode [
	currentFASTEntity := self addToModel: FASTJavaIfStatement new.
	self generalVisitActionForNodeEntity: anIfStatementNode.
	currentFASTEntity
		condition: (self clone accept: anIfStatementNode expression).
	currentFASTEntity
		thenPart: (self clone accept: anIfStatementNode trueStatement).
	anIfStatementNode falseStatement
		ifNotNil: [ currentFASTEntity
				elsePart: (self clone accept: anIfStatementNode falseStatement) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitIfStatement: anIfStatementNode [
	currentFASTEntity := self addToModel: FASTJavaIfStatement new.
		self generalVisitActionForNodeEntity: anIfStatementNode.
	currentFASTEntity
		condition: (self clone accept: anIfStatementNode expression).
	currentFASTEntity
		thenPart: (self clone accept: anIfStatementNode trueStatement).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitInitializedVariableDeclaration: anInitializedVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVariableDeclarator new.
	self generalVisitActionForNodeEntity: anInitializedVariableDeclaration.
	currentFASTEntity
		variable: (self clone accept: anInitializedVariableDeclaration variable).
	currentFASTEntity
		expression: (self clone accept: anInitializedVariableDeclaration initializer).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitInitializer: aInitializer [
	currentFASTEntity := FASTJavaInitializer new.
self
		generalVisitActionForNodeEntity: aInitializer.
	currentFASTEntity
		statementBlock: (self clone accept: aInitializer block).
	self addToModel: currentFASTEntity.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitIntegerLiteral: anIntegerLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaIntegerLiteral new
				value: anIntegerLiteral token value;
				yourself).
	self generalVisitActionForNodeEntity: anIntegerLiteral.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitLambdaExpression: aLambdaExpression [
	currentFASTEntity := self
		addToModel: FASTJavaLambdaExpression new.
	self generalVisitActionForNodeEntity: aLambdaExpression.
	aLambdaExpression parameters do: [ :parameter | self clone accept: parameter ].
	currentFASTEntity
		expression: (self clone accept: aLambdaExpression value).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitLocalVariableDeclaration: aLocalVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	self generalVisitActionForNodeEntity: aLocalVariableDeclaration.
	aLocalVariableDeclaration variableDeclarations
		do: [ :each | currentFASTEntity declarators add: (self clone accept: each) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitLocalVariableDeclarationStatement: aLocalVariableDeclarationStatement [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	self generalVisitActionForNodeEntity: aLocalVariableDeclarationStatement.
	aLocalVariableDeclarationStatement declaration variableDeclarations
		do: [ :each | currentFASTEntity declarators add: (self clone accept: each) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitMethodDeclaration: aMethodDeclaration [
	currentFASTEntity := FASTJavaMethodEntity new
		name: aMethodDeclaration declarator name value;
		yourself.
	self generalVisitActionForNodeEntity: aMethodDeclaration.
	aMethodDeclaration declarator parameters
		do: [ :parameter | self clone accept: parameter ].
	currentFASTEntity
		statementBlock: (self clone accept: aMethodDeclaration body).
	self addToModel: currentFASTEntity.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitMethodInvocation: aMethodInvocation [
	currentFASTEntity := self addToModel: FASTJavaMethodInvocation new.
	self generalVisitActionForNodeEntity: aMethodInvocation.
	aMethodInvocation expressions do: [ :expression | currentFASTEntity arguments add: (self clone accept: expression) ].
	aMethodInvocation receiver
		ifNotNil: [ :receiver | 
			(receiver isMemberOf: JavaNameNode)
				ifTrue: [ "If the element is named. It is more than propably an Identifier and not just an named element. So you pass over the normal rules of the importer"
					currentFASTEntity
						receiver:
							(FASTJavaIdentifier new
								name: receiver name value;
								startPos: receiver startPosition;
								endPos: receiver stopPosition;
								yourself) ]
				ifFalse: [ currentFASTEntity receiver: (self clone accept: receiver) ] ]
		ifNil: [ aMethodInvocation superToken
				ifNotNil: [ :superToken | 
					currentFASTEntity
						receiver:
							(FASTJavaIdentifier new
								name: superToken value;
								startPos: superToken startPosition;
								endPos: superToken stopPosition;
								yourself) ] ].
	currentFASTEntity receiver ifNotNil: [ :receiver | self addToModel: receiver ].
	currentFASTEntity name: aMethodInvocation name value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitName: aName [
	currentFASTEntity := self addToModel: FASTVariableExpression new.
	currentFASTEntity name: aName name value.
	self generalVisitActionForNodeEntity: aName.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitNew: aNewNode [
	currentFASTEntity := self addToModel: FASTJavaNewExpression new.
	self generalVisitActionForNodeEntity: aNewNode.
	aNewNode expressions
		do:
			[ :expression | currentFASTEntity arguments add: (self clone accept: expression) ].
	currentFASTEntity type: (self clone accept: aNewNode type).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitNewArray: aNewArray [
	currentFASTEntity := self addToModel: FASTJavaNewArray new.
		self generalVisitActionForNodeEntity: aNewArray.

	currentFASTEntity type: (self clone accept: aNewArray type).
	aNewArray initializer
		ifNotNil: [ :initialize | 
			currentFASTEntity initializer: (self clone accept: initialize) ].
	aNewArray dimExpressions
		do: [ :dimExpression | 
			currentFASTEntity
				arguments add: (self clone accept: dimExpression expression) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitNewClass: aNewClass [
	currentFASTEntity := self addToModel: FASTJavaNewClassExpression new.
		self generalVisitActionForNodeEntity: aNewClass.
	aNewClass expressions
		do:
			[ :expression | currentFASTEntity arguments add: (self clone accept: expression) ].
	currentFASTEntity type: (self clone accept: aNewClass type).
	aNewClass declarations
		do: [ :method | currentFASTEntity declarations add: (self clone accept: method) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitNull: aNull [
	currentFASTEntity := self
		addToModel:
			(FASTJavaNullLiteral new
				value: aNull token value;
				yourself).
	self generalVisitActionForNodeEntity: aNull.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitOuterThis: aFASTJavaOuterThis [
	currentFASTEntity := FASTJavaOuterThis new.
	self generalVisitActionForNodeEntity: aFASTJavaOuterThis.
	currentFASTEntity type: (self clone accept: aFASTJavaOuterThis name).
	self addToModel: currentFASTEntity.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitParameter: aParameter [
	| param |
	param := self accept: aParameter variable.
	self parentFASTEntity parameters add: param.
	^ param
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitPostDecrementExpression: aPostDecrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: aPostDecrementExpression expression).
	currentFASTEntity operator: aPostDecrementExpression minusMinus value.
	currentFASTEntity isPrefixedUnaryExpression: false.
	self generalVisitActionForNodeEntity: aPostDecrementExpression.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitPostIncrementExpression: aPostIncrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: aPostIncrementExpression expression).
	currentFASTEntity operator: aPostIncrementExpression plusPlus value.
	currentFASTEntity isPrefixedUnaryExpression: false.
	self generalVisitActionForNodeEntity: aPostIncrementExpression.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitPreDecrementExpression: aPreDecrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: aPreDecrementExpression expression).
	currentFASTEntity operator: aPreDecrementExpression minusMinus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self generalVisitActionForNodeEntity: aPreDecrementExpression.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitPreIncrementExpression: aPreIncrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: aPreIncrementExpression expression).
	currentFASTEntity operator: aPreIncrementExpression plusPlus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self generalVisitActionForNodeEntity: aPreIncrementExpression.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitPrimitiveType: aPrimitiveType [
	currentFASTEntity := self
		addToModel:
			(FASTVariableExpression new
				name: aPrimitiveType token value;
				yourself).
	self generalVisitActionForNodeEntity: aPrimitiveType.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitQualifiedName: aQualifiedName [
	currentFASTEntity := self addToModel: FASTJavaClassProperty new.
	self generalVisitActionForNodeEntity: aQualifiedName.
	currentFASTEntity type: (self clone accept: aQualifiedName nspace).
	currentFASTEntity fieldName: aQualifiedName name value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitReturnStatement: aReturnStatement [
	currentFASTEntity := self addToModel: FASTReturnStatement new.
	self generalVisitActionForNodeEntity: aReturnStatement.
	(aReturnStatement expression isKindOf: JavaNameNode)
		ifTrue: [ "If the element is named. It is more than propably an Identifier and not just an named element. So you pass over the normal rules of the importer"
			currentFASTEntity
				expression:
					(self addToModel: (FASTJavaIdentifier new
						name: aReturnStatement expression name value;
						yourself)) ]
		ifFalse: [ aReturnStatement expression ifNotNil: [ :expression | currentFASTEntity expression: (self clone accept: expression) ] ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitStatementExpressionList: aStatementExpressionList [
	currentFASTEntity := self addToModel: FASTExpressionStatement new.
	self generalVisitActionForNodeEntity: aStatementExpressionList.
	aStatementExpressionList expressions
		do:
			[ :expression | currentFASTEntity expression: (self clone accept: expression) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitStringLiteral: aStringLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaStringLiteral new
				value: ((aStringLiteral token value removePrefix: '"') removeSuffix: '"');
				yourself).
	self generalVisitActionForNodeEntity: aStringLiteral.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitSuperConstructorInvocation: aSuperConstructorInvocation [
	| expressionStatement |
	currentFASTEntity := self addToModel: FASTExpressionStatement new.
	expressionStatement := currentFASTEntity. 
	self generalVisitActionForNodeEntity: aSuperConstructorInvocation.
	"we encasulate the call inside a fast expression statement"
	currentFASTEntity expression: (self addToModel: FASTJavaMethodInvocation new).
	currentFASTEntity := currentFASTEntity expression.
	self generalVisitActionForNodeEntity: aSuperConstructorInvocation.
	aSuperConstructorInvocation expressions do: [ :expression | currentFASTEntity arguments add: (self clone accept: expression) ].
	currentFASTEntity name: aSuperConstructorInvocation superToken value.
	^ expressionStatement
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitSwitchBlockStatementGroup: aSwitchBlockStatementGroup [
	currentFASTEntity := self
		addToModel:
			(aSwitchBlockStatementGroup labels anyOne class = JavaSwitchLabelNode
				ifTrue: [ FASTJavaLabeledCaseStatement new
						label: (self clone accept: aSwitchBlockStatementGroup labels anyOne constant);
						yourself ]
				ifFalse: [ FASTJavaDefaultCaseStatement new ]).
	self generalVisitActionForNodeEntity: aSwitchBlockStatementGroup.
	aSwitchBlockStatementGroup statements do: [ :statement | currentFASTEntity statements add: (self clone accept: statement) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitSwitchStatement: aSwitchStatement [
	currentFASTEntity := self addToModel: FASTJavaSwitchStatement new.
	self generalVisitActionForNodeEntity: aSwitchStatement.
	aSwitchStatement block statementGroups do: [ :aStatementGroup |
		 currentFASTEntity cases add: (self clone accept: aStatementGroup) ].
	 
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitThisConstructorInvocation: aThisConstructorInvocation [
	| expressionStatement | 
	currentFASTEntity := self addToModel: FASTExpressionStatement new.
	expressionStatement := currentFASTEntity. 
	self generalVisitActionForNodeEntity: aThisConstructorInvocation.
	"we encasulate the call inside a fast expression statement"
	currentFASTEntity expression: (self addToModel: FASTJavaMethodInvocation new).
	currentFASTEntity := currentFASTEntity expression.
	self generalVisitActionForNodeEntity: aThisConstructorInvocation.
	aThisConstructorInvocation expressions
		do:
			[ :expression | currentFASTEntity arguments add: (self clone accept: expression) ].
	currentFASTEntity name: aThisConstructorInvocation thisToken value.
	^ expressionStatement
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitThrowStatement: aThrowStatement [
	currentFASTEntity := self addToModel: FASTJavaThrowStatement new.
	self generalVisitActionForNodeEntity: aThrowStatement.
	currentFASTEntity expression: (self clone accept: aThrowStatement expression).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitTryStatement: aTryStatement [
	currentFASTEntity := self addToModel: FASTJavaTryCatchStatement new.
	self generalVisitActionForNodeEntity: aTryStatement.
	currentFASTEntity try: (self clone accept: aTryStatement block).
	aTryStatement catches
		do:
			[ :aCatchBlock | currentFASTEntity catches add: (self clone accept: aCatchBlock) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitUnaryAddition: anUnaryAddition [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: anUnaryAddition expression).
	currentFASTEntity operator: anUnaryAddition plus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self generalVisitActionForNodeEntity: anUnaryAddition.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitUnaryBitInvert: anUnaryBitInvert [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: anUnaryBitInvert expression).
	currentFASTEntity operator: anUnaryBitInvert tilde value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self generalVisitActionForNodeEntity: anUnaryBitInvert.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitUnaryNot: aUnaryNotExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: aUnaryNotExpression expression).
	currentFASTEntity operator: aUnaryNotExpression bang value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self generalVisitActionForNodeEntity: aUnaryNotExpression.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitUnarySubtraction: anUnarySubtraction [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: anUnarySubtraction expression).
	currentFASTEntity operator: anUnarySubtraction minus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self generalVisitActionForNodeEntity: anUnarySubtraction.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitVariableDeclaration: aVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVariableDeclarator new.
	self generalVisitActionForNodeEntity: aVariableDeclaration.
	currentFASTEntity
		variable: (self clone accept: aVariableDeclaration variable).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitVariableName: aVariableName [
	currentFASTEntity := self addToModel: FASTVariableExpression new.
	currentFASTEntity name: aVariableName name value.
	self generalVisitActionForNodeEntity: aVariableName.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitWhileStatement: aWhileStatementNode [
	currentFASTEntity := self addToModel: FASTJavaWhileStatement new.
	self generalVisitActionForNodeEntity: aWhileStatementNode.
	currentFASTEntity
		condition: (self clone accept: aWhileStatementNode expression).
	currentFASTEntity
		body: (self clone accept: aWhileStatementNode statement).
	^ currentFASTEntity
]
