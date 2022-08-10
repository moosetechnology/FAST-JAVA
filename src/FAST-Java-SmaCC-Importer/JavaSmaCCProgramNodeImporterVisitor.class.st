"
I parse a java method string and convert it into a FASTJava model.

API:

JavaSmaCCProgramNodeImporterVisitor parseCodeMethodString: 'TheString'
"
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

{ #category : #parsing }
JavaSmaCCProgramNodeImporterVisitor class >> parseCodeMethodString: aCodeString [
	^ self new parseCodeMethodString: aCodeString
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> addToModel: anEntity [
	self model silentlyAdd: anEntity.
	^ anEntity
]

{ #category : #copying }
JavaSmaCCProgramNodeImporterVisitor >> clone [
	^ self class new
			model: self model ;
			parentFASTVisitor: self ; 
			yourself.
]

{ #category : #creating }
JavaSmaCCProgramNodeImporterVisitor >> create: anEntity from: aNodeEntity [
	currentFASTEntity := self addToModel: anEntity new.
	self generalVisitActionForNodeEntity: aNodeEntity.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> createTypeName: aName [
	"I am a helper for visitNew"

	| classTypeExpression |
	classTypeExpression := self addToModel: FASTJavaClassTypeExpression new.
	currentFASTEntity := classTypeExpression.
	self generalVisitActionForNodeEntity: aName.
	currentFASTEntity
		typeName:
			((self addToModel: FASTJavaTypeName new)
				name: aName value;
				yourself).
	currentFASTEntity := currentFASTEntity typeName.
	self generalVisitActionForNodeEntity: aName.
	^ classTypeExpression
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> currentFASTEntity [
	^ currentFASTEntity 
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> generalVisitActionForNodeEntity: aNodeEntity [
	currentFASTEntity startPos: aNodeEntity startPosition.
	currentFASTEntity endPos: aNodeEntity stopPosition
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> initialize [
	super initialize.
	model := FASTJavaModel new
]

{ #category : #creating }
JavaSmaCCProgramNodeImporterVisitor >> isInDocumentContext [

	((self currentFASTEntity isKindOf: FASTJavaClassDeclaration) or: [ 
		 self currentFASTEntity isKindOf: FASTJavaMethodEntity ]) ifTrue: [ 
		^ false ].
	^ self parentFASTVisitor
		  ifNil: [ ^ true ]
		  ifNotNil: [ self parentFASTVisitor isInDocumentContext ]
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
	[ ast := JavaParser parse: aCodeString startingAt: JavaParser startingStateForclass_or_interface_body_declaration ]
		on: Error
		do: [ :err | 
			('SmaCC Err parsing: ' , String crlf , aCodeString) record.
			err signal ].

	[ (self accept: ast) source: ast completeSource asString ]
		on: Error
		do: [ :err | 
			('FAST Err parsing: ' , String crlf , aCodeString) record.
			err signal ].
	^ self model
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parseCodeString: aCodeString [

	| ast |
	[ ast := JavaParser parse: aCodeString ]
		on: Error
		do: [ :err | 
			('SmaCC Err parsing: ' , String crlf , aCodeString) record.
			err signal ].
	[ 
	self accept: ast.
	((self model allWithSubTypesOfAny: { 
			  FASTJavaClassDeclaration.
			  FASTJavaInterfaceDeclaration }) detect: [ :classDeclaration | 
		 classDeclaration parentNode isNil ]) source:
		ast completeSource asString ]
		on: Error
		do: [ :err | 
			('FAST Err parsing: ' , String crlf , aCodeString) record.
			err signal ].
	^ self model
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitAbstractMethodDeclaration: anAbstractMethodDeclaration [

	currentFASTEntity := (self
		                      create: FASTJavaMethodEntity
		                      from: anAbstractMethodDeclaration)
		                     name:
			                     anAbstractMethodDeclaration declarator name
				                     value;
		                     yourself.
	self generalVisitActionForNodeEntity: anAbstractMethodDeclaration.
	anAbstractMethodDeclaration declarator parameters do: [ :parameter | 
		currentFASTEntity addParameter: (self clone accept: parameter) ].
	anAbstractMethodDeclaration modifiers do: [ :modifier | 
		currentFASTEntity addModifier: (self clone accept: modifier) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitAnnotation: anAnnotation [
	self create: FASTJavaAnnotation from: anAnnotation.
	currentFASTEntity expression: (self clone accept: anAnnotation name).
	^ currentFASTEntity
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

	currentFASTEntity := self addToModel:
		                     (FASTJavaArrayTypeExpression new
			                      baseType:
				                      (self clone accept: anArrayType baseType);
			                      yourself).
	currentFASTEntity
		startPos: anArrayType startPosition;
		endPos: (anArrayType rightBrackets at: 1) stopPosition.

	"Arrays with more than one dimension are nested"
	2 to: anArrayType leftBrackets size do: [ :index | 
		currentFASTEntity := self addToModel:
			                     (FASTJavaArrayTypeExpression new
				                      baseType: currentFASTEntity;
				                      yourself).
		currentFASTEntity
			startPos: anArrayType startPosition;
			endPos: (anArrayType rightBrackets at: index) stopPosition ].

	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitArrayVariableName: anArrayVariableName [
	^ self accept: anArrayVariableName variable
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitAssertStatement: anAssertStatement [
	currentFASTEntity := self addToModel: FASTJavaAssertStatement new.
	self generalVisitActionForNodeEntity: anAssertStatement.
	currentFASTEntity condition: (self clone accept: anAssertStatement testExpression).
	currentFASTEntity message: (self clone accept: anAssertStatement messageExpression).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitAssignment: aVariableDeclaration [
	currentFASTEntity := self create: FASTJavaAssignementExpression from: aVariableDeclaration.
	currentFASTEntity variable: (self clone accept: aVariableDeclaration variable).
	currentFASTEntity expression: (self clone accept: aVariableDeclaration value).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitBinaryExpression: aBinaryExpression [

	currentFASTEntity := self addToModel: FASTJavaInfixOperation new.
	self generalVisitActionForNodeEntity: aBinaryExpression.
	currentFASTEntity leftOperand:
		(self clone accept: aBinaryExpression leftExpression).
	currentFASTEntity rightOperand:
		(self clone accept: aBinaryExpression rightExpression).
	currentFASTEntity operator: aBinaryExpression op value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitBlock: aBlock [
	currentFASTEntity := self addToModel: FASTJavaStatementBlock new.
	self generalVisitActionForNodeEntity: aBlock.
	aBlock statements
		do: [ :each | currentFASTEntity statements add: (self clone accept: each) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitBooleanLiteral: aBooleanLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaBooleanLiteral new
				primitiveValue: aBooleanLiteral token value;
				yourself).
	self generalVisitActionForNodeEntity: aBooleanLiteral.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitBooleanType: aBooleanType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaBooleanTypeExpression new
				name: aBooleanType token value;
				yourself).
	self generalVisitActionForNodeEntity: aBooleanType.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitBreakStatement: aBreakStatement [
	currentFASTEntity := self addToModel: FASTJavaContinueStatement new.
	self generalVisitActionForNodeEntity: aBreakStatement.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitByteType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaByteTypeExpression new
				name: aByteType token value;
				yourself).
	self generalVisitActionForNodeEntity: aByteType.
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
JavaSmaCCProgramNodeImporterVisitor >> visitCharType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaCharTypeExpression new
				name: aByteType token value;
				yourself).
	self generalVisitActionForNodeEntity: aByteType.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitCharacterLiteral: aCharacterLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaCharacterLiteral new
				primitiveValue: aCharacterLiteral token value;
				yourself).
	self generalVisitActionForNodeEntity: aCharacterLiteral.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitClassDeclaration: aClassDeclaration [
	self create: FASTJavaClassDeclaration from: aClassDeclaration.
	aClassDeclaration declarations do: [ :declaration | currentFASTEntity addDeclaration: (self clone accept: declaration) ].
	aClassDeclaration interfaces do: [ :interface | currentFASTEntity addInterface: (self clone accept: interface) ].
	aClassDeclaration superclass ifNotNil: [ :superclass | currentFASTEntity superclass: (self clone accept: superclass) ].
	aClassDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	currentFASTEntity name: aClassDeclaration name value.
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
	currentFASTEntity := self addToModel: FASTJavaClassTypeExpression new.
	self generalVisitActionForNodeEntity: aClassType.
	currentFASTEntity typeName: (self clone accept: aClassType name).
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
	currentFASTEntity := (self create: FASTJavaMethodEntity from: aConstructorDeclaration)
		name: aConstructorDeclaration name name value;
		yourself.
	self generalVisitActionForNodeEntity: aConstructorDeclaration.
	aConstructorDeclaration parameters do: [ :parameter | currentFASTEntity addParameter: (self clone accept: parameter) ].
	currentFASTEntity statementBlock: (self clone accept: aConstructorDeclaration body).
	aConstructorDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitDoWhileStatement: aDoWhileStatement [
	currentFASTEntity := self addToModel: FASTJavaDoWhileStatement new.
	self generalVisitActionForNodeEntity: aDoWhileStatement.
	currentFASTEntity
		condition: (self clone accept: aDoWhileStatement expression).
	currentFASTEntity
		body: (self clone accept: aDoWhileStatement statement).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitDoubleType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaDoubleTypeExpression new
				name: aByteType token value;
				yourself).
	self generalVisitActionForNodeEntity: aByteType.
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
	currentFASTEntity := self addToModel: FASTJavaStatement new.
	self generalVisitActionForNodeEntity: anEmptyStatement.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitEnumDeclaration: anEnumDeclaration [

	self create: FASTJavaEnumDeclaration from: anEnumDeclaration.
	anEnumDeclaration declarations do: [ :declaration | currentFASTEntity addDeclaration: (self clone accept: declaration) ].
	anEnumDeclaration interfaces do: [ :interface | currentFASTEntity addInterface: (self clone accept: interface) ].
	anEnumDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	currentFASTEntity name: anEnumDeclaration name value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitExpressionStatement: anExpressionStatement [
	currentFASTEntity := self addToModel: FASTJavaExpressionStatement new.
	self generalVisitActionForNodeEntity: anExpressionStatement.
	currentFASTEntity
		expression: (self clone accept: anExpressionStatement expression).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitFieldAccess: aFieldAccess [
	currentFASTEntity := self addToModel: FASTJavaFieldAccess new.
	self generalVisitActionForNodeEntity: aFieldAccess.
	aFieldAccess receiver ifNotNil: [ :receiver | currentFASTEntity receiver: (self clone accept: receiver) ].
	currentFASTEntity fieldName: aFieldAccess name value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitFieldDeclaration: aFieldDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	self generalVisitActionForNodeEntity: aFieldDeclaration.
	aFieldDeclaration type ifNotNil: [ currentFASTEntity type: (self clone accept: aFieldDeclaration type) ].
	aFieldDeclaration variableDeclarations do: [ :each | currentFASTEntity declarators add: (self clone accept: each) ].
		aFieldDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitFloatLiteral: aFloatLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaFloatLiteral new
				primitiveValue: aFloatLiteral token value;
				yourself).
		self generalVisitActionForNodeEntity: aFloatLiteral.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitFloatType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaFloatTypeExpression new
				name: aByteType token value;
				yourself).
	self generalVisitActionForNodeEntity: aByteType.
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
JavaSmaCCProgramNodeImporterVisitor >> visitIdentifier: aNameNode [
	currentFASTEntity := self addToModel: FASTJavaIdentifier new.
	self generalVisitActionForNodeEntity: aNameNode.
	currentFASTEntity name: aNameNode name value.
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
	self generalVisitActionForNodeEntity: aInitializer.
	currentFASTEntity statementBlock: (self clone accept: aInitializer block).
	self addToModel: currentFASTEntity.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitIntType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaIntTypeExpression new
				name: aByteType token value;
				yourself).
	self generalVisitActionForNodeEntity: aByteType.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitIntegerLiteral: anIntegerLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaIntegerLiteral new
				primitiveValue: anIntegerLiteral token value;
				yourself).
	self generalVisitActionForNodeEntity: anIntegerLiteral.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitInterfaceDeclaration: anInterfaceDeclaration [
	self create: FASTJavaInterfaceDeclaration from: anInterfaceDeclaration.
	anInterfaceDeclaration declarations do: [ :declaration | currentFASTEntity addDeclaration: (self clone accept: declaration) ].
	anInterfaceDeclaration interfaceTypes do: [ :interface | currentFASTEntity addInterface: (self clone accept: interface) ].
	anInterfaceDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	currentFASTEntity name: anInterfaceDeclaration name value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitLambdaExpression: aLambdaExpression [
	currentFASTEntity := self
		addToModel: FASTJavaLambdaExpression new.
	self generalVisitActionForNodeEntity: aLambdaExpression.
	aLambdaExpression parameters do: [ :parameter | currentFASTEntity addParameter: (self clone accept: parameter) ].
	currentFASTEntity
		expression: (self clone accept: aLambdaExpression value).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitLocalVariableDeclaration: aLocalVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	self generalVisitActionForNodeEntity: aLocalVariableDeclaration.
	aLocalVariableDeclaration type ifNotNil: [ currentFASTEntity type: (self clone accept: aLocalVariableDeclaration type) ].
	aLocalVariableDeclaration variableDeclarations
		do: [ :each | currentFASTEntity declarators add: (self clone accept: each) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitLocalVariableDeclarationStatement: aLocalVariableDeclarationStatement [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	self generalVisitActionForNodeEntity: aLocalVariableDeclarationStatement.
	aLocalVariableDeclarationStatement declaration type ifNotNil: [ currentFASTEntity type: (self clone accept: aLocalVariableDeclarationStatement declaration type) ].
	aLocalVariableDeclarationStatement declaration variableDeclarations
		do: [ :each | currentFASTEntity declarators add: (self clone accept: each) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitLongType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaLongTypeExpression new
				name: aByteType token value;
				yourself).
	self generalVisitActionForNodeEntity: aByteType.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitMethodDeclaration: aMethodDeclaration [
	| methodBody |
	self create: FASTJavaMethodEntity from: aMethodDeclaration.
	currentFASTEntity name: aMethodDeclaration declarator name value.
	aMethodDeclaration type
		ifNotNil:
			[ currentFASTEntity type: (self clone accept: aMethodDeclaration type) ].
	aMethodDeclaration declarator parameters
		do:
			[ :parameter | currentFASTEntity addParameter: (self clone accept: parameter) ].
	methodBody := self clone accept: aMethodDeclaration body.
	(methodBody isKindOf: JavaEmptyMethodBodyNode)
		ifFalse: [ currentFASTEntity statementBlock: (self clone accept: methodBody) ].
	aMethodDeclaration modifiers
		do:
			[ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitMethodInvocation: aMethodInvocation [
	currentFASTEntity := self addToModel: FASTJavaMethodInvocation new.
	self generalVisitActionForNodeEntity: aMethodInvocation.
	aMethodInvocation expressions do: [ :expression | currentFASTEntity addArgument: (self clone accept: expression) ].
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
								yourself).
					self addToModel: currentFASTEntity receiver ]
				ifFalse: [ currentFASTEntity receiver: (self clone accept: receiver) ] ]
		ifNil: [ aMethodInvocation superToken
				ifNotNil: [ :superToken | 
					currentFASTEntity
						receiver:
							(FASTJavaIdentifier new
								name: superToken value;
								startPos: superToken startPosition;
								endPos: superToken stopPosition;
								yourself).
					self addToModel: currentFASTEntity receiver ] ].
	currentFASTEntity name: aMethodInvocation name value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitMethodReference: aMethodReference [
	currentFASTEntity := self
		addToModel: FASTJavaMethodReference new.
	self generalVisitActionForNodeEntity: aMethodReference.
	currentFASTEntity
		receiver: (self clone accept: aMethodReference receiver).
	currentFASTEntity
		name: (aMethodReference name value).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitModifier: aModifier [
	self create: FASTJavaModifier from: aModifier.
	currentFASTEntity token: aModifier token value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitName: aName [

	self isInDocumentContext
		ifTrue: [ 
			currentFASTEntity := self addToModel: FASTJavaQualifiedName new.
			self generalVisitActionForNodeEntity: aName ]
		ifFalse: [ 
			currentFASTEntity := self
				                     create: FASTJavaVariableExpression
				                     from: aName ].
	currentFASTEntity name: aName name value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitNew: aNewNode [

	currentFASTEntity := self addToModel: FASTJavaNewExpression new.
	self generalVisitActionForNodeEntity: aNewNode.
	aNewNode expressions do: [ :expression | 
		currentFASTEntity arguments add: (self clone accept: expression) ].

	aNewNode primary ifNotNil: [ :primary | 
		currentFASTEntity receiver: (self clone accept: primary) ].
	"
in the following 'InnerClass' is considered as a Name in FAST but should be considered as a Type in FASTJava	
public void onClick(ClickEvent event) {
  view.setDisplayView(view.new InnerClass());
}"
	aNewNode type
		ifNotNil: [ 
		currentFASTEntity type: (self clone accept: aNewNode type) ]
		ifNil: [ 
		currentFASTEntity type: (self clone createTypeName: aNewNode name) ].
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
	aNewClass expressions do: [ :expression | 
		currentFASTEntity arguments add: (self clone accept: expression) ].
	aNewClass type
		ifNotNil: [ 
		currentFASTEntity type: (self clone accept: aNewClass type) ]
		ifNil: [ 
			currentFASTEntity type: (self clone createTypeName: aNewClass name).
			currentFASTEntity receiver: (self clone accept: aNewClass primary) ].
	aNewClass declarations do: [ :method | 
		currentFASTEntity declarations add: (self clone accept: method) ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitNull: aNull [
	currentFASTEntity := self
		addToModel:
			(FASTJavaNullLiteral new
				primitiveValue: aNull token value;
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
JavaSmaCCProgramNodeImporterVisitor >> visitPackageDeclaration: aPackageDeclaration [
	currentFASTEntity := self addToModel: FASTJavaPackageDeclaration new.
	self generalVisitActionForNodeEntity: aPackageDeclaration.
	currentFASTEntity declarationName: (self clone accept: aPackageDeclaration name).
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitParameter: aParameter [
	currentFASTEntity := self addToModel: FASTJavaParameter new.
	self generalVisitActionForNodeEntity: aParameter.
	currentFASTEntity variable: (self clone accept: aParameter variable).
	currentFASTEntity type: (self clone accept: aParameter type).
	^ currentFASTEntity
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
			(FASTJavaPrimitiveTypeExpression new
				name: aPrimitiveType token value;
				yourself).
	self generalVisitActionForNodeEntity: aPrimitiveType.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitQualifiedName: aQualifiedName [

	self isInDocumentContext
		ifTrue: [
			currentFASTEntity := self addToModel: FASTJavaQualifiedName new.
			self generalVisitActionForNodeEntity: aQualifiedName.
			currentFASTEntity namespace: (self clone accept: aQualifiedName nspace).
			currentFASTEntity name: aQualifiedName name value ]
		ifFalse: [ 
			currentFASTEntity := self addToModel: FASTJavaClassProperty new.
			self generalVisitActionForNodeEntity: aQualifiedName.
			currentFASTEntity type: (self clone accept: aQualifiedName nspace).
			currentFASTEntity fieldName: aQualifiedName name value ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitQualifiedTypeName: aQualifiedTypeName [
	currentFASTEntity := self addToModel: FASTJavaQualifiedTypeName new.
	self generalVisitActionForNodeEntity: aQualifiedTypeName.
	currentFASTEntity name: aQualifiedTypeName name value.
	currentFASTEntity namespace: (self clone accept: aQualifiedTypeName nspace).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitReturnStatement: aReturnStatement [
	currentFASTEntity := self addToModel: FASTJavaReturnStatement new.
	self generalVisitActionForNodeEntity: aReturnStatement.
	(aReturnStatement expression isKindOf: JavaNameNode)
		ifTrue:
			[ "If the element is named. It is more than propably an Identifier and not just an named element. So you pass over the normal rules of the importer" currentFASTEntity expression: (self addToModel: (self clone visitIdentifier: aReturnStatement expression)) ]
		ifFalse: [ aReturnStatement expression ifNotNil: [ :expression | currentFASTEntity expression: (self clone accept: expression) ] ].
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitShortType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaShortTypeExpression new
				name: aByteType token value;
				yourself).
	self generalVisitActionForNodeEntity: aByteType.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitSingleTypeImportDeclaration: aSingleTypeImportDeclaration [
	currentFASTEntity := self addToModel: FASTJavaImportDeclaration new.
	self generalVisitActionForNodeEntity: aSingleTypeImportDeclaration.
	currentFASTEntity declarationName: (self clone accept: aSingleTypeImportDeclaration name).
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitStatementExpressionList: aStatementExpressionList [
	currentFASTEntity := self addToModel: FASTJavaExpressionStatement new.
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
				primitiveValue: ((aStringLiteral token value removePrefix: '"') removeSuffix: '"');
				yourself).
	self generalVisitActionForNodeEntity: aStringLiteral.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitSuperConstructorInvocation: aSuperConstructorInvocation [
	| expressionStatement |
	currentFASTEntity := self addToModel: FASTJavaExpressionStatement new.
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
	currentFASTEntity condition: (self clone accept: aSwitchStatement expression).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitSynchronizedStatement: aSynchronizedStatement [
	currentFASTEntity := self
		addToModel: FASTJavaSynchronizedStatement new.
	self generalVisitActionForNodeEntity: aSynchronizedStatement.
	currentFASTEntity
		expression: (self clone accept: aSynchronizedStatement expression).
	currentFASTEntity
		block: (self clone accept: aSynchronizedStatement block).
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitThisConstructorInvocation: aThisConstructorInvocation [
	| expressionStatement | 
	currentFASTEntity := self addToModel: FASTJavaExpressionStatement new.
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
JavaSmaCCProgramNodeImporterVisitor >> visitTypeImportOnDemandDeclaration: aTypeImportOnDemandDeclaration [

	currentFASTEntity := self addToModel:
		                     FASTJavaMultiImportDeclaration new.
	self generalVisitActionForNodeEntity: aTypeImportOnDemandDeclaration.
	currentFASTEntity declarationName:
		(self clone accept: aTypeImportOnDemandDeclaration name)
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitTypeName: aTypeName [
	currentFASTEntity := self addToModel: FASTJavaTypeName new.
	currentFASTEntity name: aTypeName name value.
	self generalVisitActionForNodeEntity: aTypeName.
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
	currentFASTEntity := self create: FASTJavaVariableExpression from: aVariableName.
	currentFASTEntity name: aVariableName name value.
	^ currentFASTEntity
]

{ #category : #visitor }
JavaSmaCCProgramNodeImporterVisitor >> visitVoidType: aVoidType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaVoidTypeExpression new
				name: aVoidType voidToken value;
				yourself).
	self generalVisitActionForNodeEntity: aVoidType.
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
