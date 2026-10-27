"
I parse a java method string and convert it into a FASTJava model.

API:

JavaSmaCCProgramNodeImporterVisitor parseCodeMethodString: 'TheString'.

A stack of created entities (used to set the #parentNode) is created by cloning the visitor and calling the clone on child nodes
"
Class {
	#name : 'JavaSmaCCProgramNodeImporterVisitor',
	#superclass : 'JavaProgramNodeVisitor',
	#instVars : [
		'model',
		'currentFASTEntity',
		'parentFASTVisitor',
		'withComments',
		'parser'
	],
	#classInstVars : [
		'hello'
	],
	#category : 'FAST-Java-SmaCC-Importer',
	#package : 'FAST-Java-SmaCC-Importer'
}

{ #category : 'parsing' }
JavaSmaCCProgramNodeImporterVisitor class >> parseCodeMethodString: aCodeString [
	^ self new parseCodeMethodString: aCodeString
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> acceptAnnotationInterfaceMember: aMemberNode [
	"JLS 9.6.1: a member of an annotation interface that is a method declaration declares
	one of its elements. SmaCC gives such a declaration one node class when it has a
	default value and another when it has none, so both come here."

	(aMemberNode isKindOf: JavaAbstractMethodDeclarationNode) ifTrue: [ ^ self clone visitAnnotationElementDeclaration: aMemberNode ].

	^ self clone accept: aMemberNode
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> acceptComponentType: aTypeNode [
	"JLS 10.1: the component type of an array may itself be a parameterized type. Where a
	type stands on its own the grammar wraps its name in a class type, and the arguments
	are read from there; the component of an array type is the bare name, which carries
	them itself. Give it the class type they belong to, so that `Class<?>[]` keeps the
	arguments `Class<?>` keeps."

	| visitor classType |
	((aTypeNode isKindOf: JavaTypeNameNode) and: [ aTypeNode arguments isNotEmpty ]) ifFalse: [
		^ self clone accept: aTypeNode ].

	visitor := self clone.
	classType := visitor create: FASTJavaClassTypeExpression from: aTypeNode.
	classType typeName: (visitor clone accept: aTypeNode).
	aTypeNode arguments do: [ :typeArgument | classType addArgument: (visitor clone accept: typeArgument) ].
	^ classType
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> acceptStatement: aStatementNode [
	"A switch used as a statement is a switch statement (JLS 14.11.1) whatever form its
	block takes, but SmaCC types the node after the form, not the position. Only the
	places where a statement is expected can tell the two apart, so they come here."

	(aStatementNode isKindOf: JavaSwitchExpressionNode) ifTrue: [ ^ self clone visitSwitchExpressionAsStatement: aStatementNode ].

	^ self clone accept: aStatementNode
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> addThrowsOf: aDeclarationNode [

	aDeclarationNode throws ifNotNil: [ :throws |
		throws classTypes do: [ :classType | currentFASTEntity addThrow: (self clone accept: classType) ] ]
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> addToModel: anEntity [
	self model silentlyAdd: anEntity.
	^ anEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> addTypeParametersOf: aDeclarationNode [
	"JLS 4.4: class, interface, method and constructor declarations can be generic."

	aDeclarationNode typeParameters ifNotNil: [ :typeParameters |
		typeParameters parameters do: [ :typeParameter | currentFASTEntity addTypeParameter: (self clone accept: typeParameter) ] ]
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> arrayDimensionsOf: aVariableNode [
	"JLS 10.2: the brackets of an array type may be written after the variable instead of
	after the type, once per dimension."

	| dimensions node |
	dimensions := 0.
	node := aVariableNode.

	[ node isKindOf: JavaArrayVariableNameNode ] whileTrue: [
			dimensions := dimensions + 1.
			node := node variable ].

	^ dimensions
]

{ #category : 'private - comments' }
JavaSmaCCProgramNodeImporterVisitor >> attach: aFastComment [
	(aFastComment isBlockComment
		ifTrue: [ self closestNextNode: aFastComment ]
		ifFalse:  [ self closestPreviousNode: aFastComment ])
	ifNotNil: [ :node | aFastComment container: node ]
]

{ #category : 'private - comments' }
JavaSmaCCProgramNodeImporterVisitor >> attachComments: aCodeString [


	parser scanner comments do: [ :pos |
		| fastComment |
		fastComment := self
			               createComment: aCodeString
			               from: pos first
			               to: pos second.
		self attach: fastComment ]
]

{ #category : 'copying' }
JavaSmaCCProgramNodeImporterVisitor >> clone [
	^ self class new
			model: self model ;
			parentFASTVisitor: self ; 
			yourself.
]

{ #category : 'private - comments' }
JavaSmaCCProgramNodeImporterVisitor >> closestNextNode: aFastComment [
	^self closestNodeTo: aFastComment relation: #>
]

{ #category : 'private - comments' }
JavaSmaCCProgramNodeImporterVisitor >> closestNodeTo: aFastComment relation: comparator [
	| closest |
	closest := nil.
	aFastComment mooseModel entities do: [ :node |
		(self compare: node to: aFastComment comparator: comparator)
		ifTrue: [
			closest
				ifNil: [ closest := node ]
				ifNotNil: [ (self compare: closest to: node comparator: comparator)
					ifTrue: [ closest := node ]
				]
		]
	].
	^closest
]

{ #category : 'private - comments' }
JavaSmaCCProgramNodeImporterVisitor >> closestPreviousNode: aFastComment [
	^self closestNodeTo: aFastComment relation: #<
]

{ #category : 'private - comments' }
JavaSmaCCProgramNodeImporterVisitor >> compare: node1 to: node2 comparator: comparator [
	^node1 startPos perform: comparator with: node2 startPos
]

{ #category : 'creating' }
JavaSmaCCProgramNodeImporterVisitor >> create: anEntity from: aNodeEntity [
	currentFASTEntity := self addToModel: anEntity new.
	self setStartEndPos: aNodeEntity.
	^ currentFASTEntity
]

{ #category : 'creating' }
JavaSmaCCProgramNodeImporterVisitor >> createComment: aCodeString from: start to: end [
	| comment |
	comment := FASTJavaComment new
		content: (aCodeString copyFrom: start to: end) ;
		startPos: start ;
		endPos: end ;
		yourself.
	
	self addToModel: comment.
	^comment
]

{ #category : 'creating' }
JavaSmaCCProgramNodeImporterVisitor >> createQualifiedSuper: anExpression at: aSuperToken [
	"JLS 15.11.2 and 15.12.1: `T.super` is what a member of the superinterface T is reached
	through, and it names neither T nor the superclass. Its two parts make one receiver,
	written the way the model writes any other qualified name."

	^ self addToModel: (FASTJavaFieldAccess new
			   receiver: anExpression;
			   fieldName: aSuperToken value;
			   startPos: anExpression startPos;
			   endPos: aSuperToken stopPosition;
			   yourself)
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> createTypeName: aName [
	"I am a helper for visitNew"

	| classTypeExpression |
	classTypeExpression := self addToModel: FASTJavaClassTypeExpression new.
	currentFASTEntity := classTypeExpression.
	self setStartEndPos: aName.
	currentFASTEntity
		typeName:
			((self addToModel: FASTJavaTypeName new)
				name: aName value;
				yourself).
	currentFASTEntity := currentFASTEntity typeName.
	self setStartEndPos: aName.
	^ classTypeExpression
]

{ #category : 'creating' }
JavaSmaCCProgramNodeImporterVisitor >> createTypeName: aName withArguments: typeArguments [
	"I am a helper for visitNew, for the form qualified by a primary: there the name of
	the type instantiated is an identifier of its own, and the arguments written for it
	stand beside it rather than within it."

	| classTypeExpression |
	classTypeExpression := self createTypeName: aName.
	typeArguments do: [ :argument |
		classTypeExpression arguments add: (self clone accept: argument) ].
	^ classTypeExpression
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> currentFASTEntity [
	^ currentFASTEntity 
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> currentFASTEntity: anObject [

	currentFASTEntity := anObject 
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> expressionStatementOf: anExpressionNode [
	"JLS 14.8: an expression written where a statement is expected is a statement of its own."

	currentFASTEntity := self addToModel: FASTJavaExpressionStatement new.
	self setStartEndPos: anExpressionNode.
	currentFASTEntity expression: (self clone accept: anExpressionNode).
	^ currentFASTEntity
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> getExpressionAST: anExpressionString [
	"For the expression to be parser correctly, the Java importer must be set as being on a Class declaration
	then `clone` will create a sub-parser for the expression"

	^(self currentFASTEntity: (FASTJavaClassDeclaration new) ;
		clone) 
		parseCodeExpressionString: anExpressionString 
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> initialize [
	super initialize.
	model := FASTJavaModel new.
	withComments := false
]

{ #category : 'creating' }
JavaSmaCCProgramNodeImporterVisitor >> isOutsideTypeDeclaration [

	({ FASTJavaClassDeclaration . FASTJavaInterfaceDeclaration . FASTJavaEnumDeclaration . FASTJavaAnnotationInterfaceDeclaration . FASTJavaRecordDeclaration . FASTJavaMethodEntity }
		includes: currentFASTEntity class )
		ifTrue: [ ^ false ].

	^self parentFASTVisitor
		ifNil: [ true ]
		ifNotNil: [ self parentFASTVisitor isOutsideTypeDeclaration ]
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> isVarTypeNode: aClassType [
	"JLS 14.4.1: `var` is a reserved type name standing for an inferred type. It is
	never generic and never qualified, so a simple name is enough to tell."

	| name |
	name := aClassType name.
	^ (name isKindOf: JavaTypeNameNode) and: [ name arguments isEmpty and: [ name name value = 'var' ] ]
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> model [
	^ model
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> model: aModel [
	model := aModel
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> parentFASTEntity [
	
	^ parentFASTVisitor currentFASTEntity
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> parentFASTVisitor [
	
	^ parentFASTVisitor
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> parentFASTVisitor: anObject [
	
	parentFASTVisitor := anObject
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> parseCodeExpressionString: aCodeString [

	| ast |
	parser := JavaParser
		          createParserOnStream: (ReadStream on: aCodeString)
		          startingAt:
		          JavaParser
			          startingStateForexpression.

	[
	ast := parser parse.

	(ast isKindOf: SmaCCParseNode) ifTrue: [
		ast completeSource: aCodeString ] ]
		on: Error
		do: [ :err |
			('SmaCC Err parsing: ' , String crlf , aCodeString) record.
			err signal ].

	^self accept: ast.

]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> parseCodeMethodString: aCodeString [

	| ast |
	parser := JavaParser
		          createParserOnStream: (ReadStream on: aCodeString)
		          startingAt:
		          JavaParser
			          startingStateForclass_or_interface_body_declaration.

	[
	ast := parser parse.
	(ast isKindOf: SmaCCParseNode) ifTrue: [
		ast completeSource: aCodeString ] ]
		on: Error
		do: [ :err |
			('SmaCC Err parsing: ' , String crlf , aCodeString) record.
			err signal ].

	[ (self accept: ast) source: ast completeSource asString ]
		on: Error
		do: [ :err |
			('FAST Err parsing: ' , String crlf , aCodeString) record.
			err signal ].

	withComments ifTrue: [ self attachComments: aCodeString ].

	^ self model
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> parseCodeString: aCodeString [

	| ast |
	parser := JavaParser on: (ReadStream on: aCodeString).

	[ ast := parser parse. ast completeSource: aCodeString]
		on: Error
		do: [ :err |
			('SmaCC Err parsing: ' , String crlf , aCodeString) record.
			err signal ].
	[
	self accept: ast.
	((self model allWithSubTypesOfAny: {
			  FASTJavaCompilationUnit.
			  FASTJavaClassDeclaration.
			  FASTJavaInterfaceDeclaration.
			  FASTJavaEnumDeclaration }) detect: [ :classDeclaration |
		 classDeclaration parentNode isNil ]) source:
			ast completeSource asString ]
		on: Error
		do: [ :err |
			('FAST Err parsing: ' , String crlf , aCodeString) record.
			err signal ].

	withComments ifTrue: [ self attachComments: aCodeString ].

	^ self model
]

{ #category : 'creating' }
JavaSmaCCProgramNodeImporterVisitor >> qualifiedNameOf: aNameNode [
	"JLS 6.5: the parts written before the last one qualify a name, each of them a name of
	its own. The rule that reads a qualified name reads it as a field access wherever it
	stands inside a type declaration, which the name of an annotation is not, so a name
	that is a name whatever encloses it is built here."

	| qualifiedName |
	qualifiedName := (self addToModel: FASTJavaQualifiedName new)
		                 startPos: aNameNode startPosition;
		                 endPos: aNameNode stopPosition;
		                 name: aNameNode name value;
		                 yourself.

	(aNameNode isKindOf: JavaQualifiedNameNode) ifTrue: [
		qualifiedName namespace: (self qualifiedNameOf: aNameNode nspace) ].

	^ qualifiedName
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> setStartEndPos: aNodeEntity [
	currentFASTEntity startPos: aNodeEntity startPosition.
	currentFASTEntity endPos: aNodeEntity stopPosition
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> statementsOfForHeader: aNode [
	"JLS 14.14.1: the first and the last part of the header of a for write a list of
	statement expressions, each one a statement of its own; the first part may write one
	local variable declaration instead, which is a statement by itself."

	| imported |
	imported := self clone accept: aNode.

	^ imported isCollection
		  ifTrue: [ imported ]
		  ifFalse: [ OrderedCollection with: imported ]
]

{ #category : 'creating' }
JavaSmaCCProgramNodeImporterVisitor >> typePatternOf: aNode [
	"JLS 14.30.1: a type pattern names a type and declares the variable bound to what it
	matches. SmaCC writes the two into whichever node holds the pattern, an instanceof
	operation or a case label."

	^ (self addToModel: FASTJavaTypePattern new)
		  startPos: aNode type startPosition;
		  endPos: aNode variable stopPosition;
		  type: (self clone accept: aNode type);
		  variable: (self clone accept: aNode variable);
		  yourself
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitAbstractMethodDeclaration: anAbstractMethodDeclaration [

	currentFASTEntity := (self create: FASTJavaMethodEntity from: anAbstractMethodDeclaration)
		                     name: anAbstractMethodDeclaration declarator name value;
		                     yourself.

	anAbstractMethodDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	currentFASTEntity type: (self clone accept: anAbstractMethodDeclaration type).

	self addTypeParametersOf: anAbstractMethodDeclaration.

	anAbstractMethodDeclaration declarator parameters do: [ :parameter |
		currentFASTEntity addParameter: (self clone accept: parameter) ].

	self addThrowsOf: anAbstractMethodDeclaration.

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitAnnotation: anAnnotation [

	self create: FASTJavaAnnotation from: anAnnotation.
	currentFASTEntity name: anAnnotation name name value.

	"JLS 9.7: an annotation names the type it is an instance of, and that name may be
	written qualified."
	(anAnnotation name isKindOf: JavaQualifiedNameNode) ifTrue: [
		currentFASTEntity qualifiedName: (self qualifiedNameOf: anAnnotation name) ].

	anAnnotation values do: [ :expression |
		currentFASTEntity addElement: (self clone accept: expression) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitAnnotationElementDeclaration: anElementDeclaration [
	"JLS 9.6.1: an element of an annotation interface is declared as a method that takes no
	parameter and may have a default value."

	currentFASTEntity := (self create: FASTJavaAnnotationElementDeclaration from: anElementDeclaration)
		                     name: anElementDeclaration declarator name value;
		                     yourself.

	anElementDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	currentFASTEntity type: (self clone accept: anElementDeclaration type).

	(anElementDeclaration isKindOf: JavaAnnotationMethodDeclarationNode) ifTrue: [
		currentFASTEntity defaultValue: (self clone accept: anElementDeclaration value) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitAnnotationInterface: anAnnotationInterface [
	"JLS 9.6: an annotation interface declaration has no supertype and no type parameters."

	self create: FASTJavaAnnotationInterfaceDeclaration from: anAnnotationInterface.
	currentFASTEntity name: anAnnotationInterface name value.

	anAnnotationInterface modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	anAnnotationInterface declarations do: [ :declaration |
		currentFASTEntity addDeclaration: (self acceptAnnotationInterfaceMember: declaration) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitArrayAccess: anArrayAccess [
	currentFASTEntity := self addToModel: FASTJavaArrayAccess new.
	self setStartEndPos: anArrayAccess.
	currentFASTEntity array: (self clone accept: anArrayAccess array).
	currentFASTEntity
		expression: (self clone accept: anArrayAccess expression).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitArrayInitializer: anArrayInitializer [
	currentFASTEntity := self create: FASTJavaArrayInitializer from: anArrayInitializer.
	anArrayInitializer initializers do: [ :initializer | currentFASTEntity initializers add: (self clone accept: initializer) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitArrayType: anArrayType [

	currentFASTEntity := self addToModel:
		                     (FASTJavaArrayTypeExpression new
			                      baseType: (self acceptComponentType: anArrayType baseType);
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

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitArrayVariableName: anArrayVariableName [
	^ self accept: anArrayVariableName variable
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitAssertStatement: anAssertStatement [
	currentFASTEntity := self addToModel: FASTJavaAssertStatement new.
	self setStartEndPos: anAssertStatement.
	currentFASTEntity condition: (self clone accept: anAssertStatement testExpression).
	currentFASTEntity message: (self clone accept: anAssertStatement messageExpression).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitAssignment: anAssignmentExpression [
	currentFASTEntity := self create: FASTJavaAssignmentExpression from: anAssignmentExpression.
	currentFASTEntity operator: anAssignmentExpression op value.
	currentFASTEntity variable: (self clone accept: anAssignmentExpression variable).
	currentFASTEntity expression: (self clone accept: anAssignmentExpression value).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitBinaryExpression: aBinaryExpression [

	currentFASTEntity := self addToModel: FASTJavaInfixOperation new.
	self setStartEndPos: aBinaryExpression.
	currentFASTEntity leftOperand:
		(self clone accept: aBinaryExpression leftExpression).
	currentFASTEntity rightOperand:
		(self clone accept: aBinaryExpression rightExpression).
	currentFASTEntity operator: aBinaryExpression op value.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitBlock: aBlock [

	currentFASTEntity := self addToModel: FASTJavaStatementBlock new.
	self setStartEndPos: aBlock.
	aBlock statements do: [ :each | currentFASTEntity statements add: (self acceptStatement: each) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitBooleanLiteral: aBooleanLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaBooleanLiteral new
				primitiveValue: aBooleanLiteral token value;
				yourself).
	self setStartEndPos: aBooleanLiteral.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitBooleanType: aBooleanType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaBooleanTypeExpression new
				name: aBooleanType token value;
				yourself).
	self setStartEndPos: aBooleanType.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitBreakStatement: aBreakStatement [
	currentFASTEntity := self addToModel: FASTJavaBreakStatement new.
	self setStartEndPos: aBreakStatement.
	currentFASTEntity label: aBreakStatement identifier value.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitByteType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaByteTypeExpression new
				name: aByteType token value;
				yourself).
	self setStartEndPos: aByteType.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitCastExpression: aCastExpression [
	currentFASTEntity := self addToModel: FASTJavaCastExpression new.
	self setStartEndPos: aCastExpression.
	currentFASTEntity type: (self clone accept: aCastExpression type).
	currentFASTEntity
		expression: (self clone accept: aCastExpression expression).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitCatchClause: aCatchClause [
	currentFASTEntity := self addToModel: FASTJavaCatchPartStatement new.
	self setStartEndPos: aCatchClause.
	self clone accept: aCatchClause parameter.
	currentFASTEntity body: (self clone accept: aCatchClause block).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitCatchParameter: aCatchParameter [
	| param |
	param := self visitName: aCatchParameter variable.
	self parentFASTEntity parameter: param.
	aCatchParameter types do: [ :catchedType |
		self parentFASTEntity addCatchedType: (self clone accept: catchedType)
	].
	^ param
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitCharType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaCharTypeExpression new
				name: aByteType token value;
				yourself).
	self setStartEndPos: aByteType.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitCharacterLiteral: aCharacterLiteral [
	| tokenValue |
	tokenValue := aCharacterLiteral token value.

	currentFASTEntity := self create: FASTJavaCharacterLiteral from: aCharacterLiteral.
	currentFASTEntity primitiveValue: (tokenValue copyFrom: 2 to: (tokenValue size - 1)).

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitClassDeclaration: aClassDeclaration [

	self create: FASTJavaClassDeclaration from: aClassDeclaration.
	currentFASTEntity name: aClassDeclaration name value.

	aClassDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].

	self addTypeParametersOf: aClassDeclaration.

	aClassDeclaration superclass ifNotNil: [ :superclass | currentFASTEntity superclass: (self clone accept: superclass) ].
	aClassDeclaration interfaces do: [ :interface | currentFASTEntity addInterface: (self clone accept: interface) ].
	aClassDeclaration declarations do: [ :declaration | currentFASTEntity addDeclaration: (self clone accept: declaration) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitClassExpression: aClassExpression [
	currentFASTEntity := self addToModel: FASTJavaClassProperty new.
	self setStartEndPos: aClassExpression.

	currentFASTEntity type: (self clone accept: aClassExpression type).
	currentFASTEntity fieldName: aClassExpression classToken value.

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitClassType: aClassType [

	(self isVarTypeNode: aClassType) ifTrue: [
			currentFASTEntity := self addToModel: (FASTJavaVarTypeExpression new
					                      name: aClassType name name value;
					                      yourself).
			self setStartEndPos: aClassType.
			^ currentFASTEntity ].

	currentFASTEntity := self addToModel: FASTJavaClassTypeExpression new.
	self setStartEndPos: aClassType.
	currentFASTEntity typeName: (self clone accept: aClassType name).

	aClassType name arguments do: [ :typeArgument | currentFASTEntity addArgument: (self clone accept: typeArgument) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitConditionalExpression: aConditionalExpression [
	currentFASTEntity := self
		addToModel: FASTJavaConditionalExpression new.
	self setStartEndPos: aConditionalExpression.
	currentFASTEntity
		condition: (self clone accept: aConditionalExpression testExpression).
	currentFASTEntity
		thenPart: (self clone accept: aConditionalExpression trueExpression).
	aConditionalExpression falseExpression
		ifNotNil: [ currentFASTEntity
				elsePart: (self clone accept: aConditionalExpression falseExpression) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitContinueStatement: aContinueStatement [
	currentFASTEntity := self addToModel: FASTJavaContinueStatement new.
	self setStartEndPos: aContinueStatement.
	currentFASTEntity label: aContinueStatement identifier value.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitDeclaration: aConstructorDeclaration [

	currentFASTEntity := (self create: FASTJavaMethodEntity from: aConstructorDeclaration)
		                     name: aConstructorDeclaration name name value;
		                     yourself.
	self setStartEndPos: aConstructorDeclaration.

	self addTypeParametersOf: aConstructorDeclaration.

	aConstructorDeclaration parameters do: [ :parameter | currentFASTEntity addParameter: (self clone accept: parameter) ].

	self addThrowsOf: aConstructorDeclaration.

	currentFASTEntity statementBlock: (self clone accept: aConstructorDeclaration body).
	aConstructorDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitDefaultLabel: aDefaultLabel [

	currentFASTEntity := self addToModel: FASTJavaSwitchLabel new.
	self setStartEndPos: aDefaultLabel.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitDoWhileStatement: aDoWhileStatement [
	currentFASTEntity := self addToModel: FASTJavaDoWhileStatement new.
	self setStartEndPos: aDoWhileStatement.
	currentFASTEntity
		condition: (self clone accept: aDoWhileStatement expression).
	currentFASTEntity
		body: (self acceptStatement: aDoWhileStatement statement).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitDoubleType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaDoubleTypeExpression new
				name: aByteType token value;
				yourself).
	self setStartEndPos: aByteType.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitElementArrayInitializer: anElementArrayInitializer [

	currentFASTEntity := self create: FASTJavaArrayAnnotationElement from: anElementArrayInitializer.
	anElementArrayInitializer values do: [ :value |
		currentFASTEntity  addValue: (self clone accept: value) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitElementValuePair: anElementValuePair [
	"'key = value' as argument of an Annotation
	 treat it as an Assignment Expression"

	currentFASTEntity := self create: FASTJavaAssignmentExpression from: anElementValuePair.
	currentFASTEntity variable: (self clone visitVariableName: anElementValuePair).
	currentFASTEntity operator: '='.
	currentFASTEntity expression: (self clone accept: anElementValuePair value).

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitEmptyDeclaration: anEmptyDeclaration [
	currentFASTEntity := self addToModel: FASTJavaEmptyMethodDeclaration new.
	self setStartEndPos: anEmptyDeclaration.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitEmptyDimExpression: aToken [
	currentFASTEntity := self
		addToModel: FASTJavaEmptyDimExpression new.
	self setStartEndPos: aToken.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitEmptyStatement: anEmptyStatement [
	currentFASTEntity := self addToModel: FASTJavaStatement new.
	self setStartEndPos: anEmptyStatement.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitEnumConstant: anEnumConstant [
	"JLS 8.9.1: a constant writes the arguments the constructor of its enum takes, and may
	write a class body, which declares a class of its own extending that enum."

	currentFASTEntity := self addToModel: FASTJavaEnumConstant new.
	self setStartEndPos: anEnumConstant.
	currentFASTEntity
			name: anEnumConstant name value.
	anEnumConstant expressions do: [ :expression |
		currentFASTEntity arguments add: (self clone accept: expression) ].
	anEnumConstant declarations do: [ :declaration |
		currentFASTEntity declarations add: (self clone accept: declaration) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitEnumDeclaration: anEnumDeclaration [

	self create: FASTJavaEnumDeclaration from: anEnumDeclaration.
	currentFASTEntity name: anEnumDeclaration name value.

	anEnumDeclaration constants do: [ :constant | currentFASTEntity addConstant: (self clone accept: constant) ].
	anEnumDeclaration declarations do: [ :declaration | currentFASTEntity addDeclaration: (self clone accept: declaration) ].
	anEnumDeclaration interfaces do: [ :interface | currentFASTEntity addInterface: (self clone accept: interface) ].
	anEnumDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitExpressionStatement: anExpressionStatement [
	currentFASTEntity := self addToModel: FASTJavaExpressionStatement new.
	self setStartEndPos: anExpressionStatement.
	currentFASTEntity
		expression: (self clone accept: anExpressionStatement expression).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitFieldAccess: aFieldAccess [
	currentFASTEntity := self addToModel: FASTJavaFieldAccess new.
	self setStartEndPos: aFieldAccess.
	aFieldAccess receiver
		ifNotNil: [ :receiver |
			| expression |
			expression := self clone accept: receiver.
			currentFASTEntity receiver: (aFieldAccess superToken
					 ifNil: [ expression ]
					 ifNotNil: [ :superToken | self createQualifiedSuper: expression at: superToken ]) ]
		ifNil: [
			aFieldAccess superToken
				ifNotNil: [ currentFASTEntity receiver: (self clone visitSuperMemberAcessor: aFieldAccess) ]
		].
	currentFASTEntity fieldName: aFieldAccess name value.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitFieldDeclaration: aFieldDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	self setStartEndPos: aFieldDeclaration.
	aFieldDeclaration type ifNotNil: [ currentFASTEntity type: (self clone accept: aFieldDeclaration type) ].
	aFieldDeclaration variableDeclarations do: [ :each | currentFASTEntity declarators add: (self clone accept: each) ].
		aFieldDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitFinallyClause: aFinallyClause [
	^self accept: aFinallyClause block
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitFloatLiteral: aFloatLiteral [
	"JLS 3.10.2: a floating-point literal is of type float when an F suffixes it, of type
	double otherwise."

	| tokenValue |
	tokenValue := aFloatLiteral token value.

	currentFASTEntity := self
		                     create: (('Ff' includes: tokenValue last)
				                      ifTrue: [ FASTJavaFloatLiteral ]
				                      ifFalse: [ FASTJavaDoubleLiteral ])
		                     from: aFloatLiteral.
	currentFASTEntity primitiveValue: tokenValue.

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitFloatType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaFloatTypeExpression new
				name: aByteType token value;
				yourself).
	self setStartEndPos: aByteType.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitForEachStatement: aForEachStatement [

	currentFASTEntity := self addToModel: FASTJavaForEachStatement new.
	self setStartEndPos: aForEachStatement.
	currentFASTEntity body: (self acceptStatement: aForEachStatement statement).
	currentFASTEntity fieldname: (self clone visitIdentifier: aForEachStatement name).
	currentFASTEntity type: (self clone accept: aForEachStatement type).
	currentFASTEntity list: (self clone accept: aForEachStatement expression).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitForStatement: aForStatement [
	currentFASTEntity := self addToModel: FASTJavaForStatement new.
	self setStartEndPos: aForStatement.
	aForStatement test
		ifNotNil: [ :test | currentFASTEntity condition: (self clone accept: test) ].
	aForStatement _update
		ifNotNil: [ :_update |
			currentFASTEntity incrementors: (self statementsOfForHeader: _update) ].
	aForStatement initial
		ifNotNil: [ :initial |
			currentFASTEntity initializers: (self statementsOfForHeader: initial) ].
	aForStatement statement
		ifNotNil:
			[ :statement | currentFASTEntity body: (self acceptStatement: statement) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitIdentifier: aNameNode [
	currentFASTEntity := self addToModel: FASTJavaIdentifier new.
	self setStartEndPos: aNameNode.
	currentFASTEntity name: aNameNode name value.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitIfElseStatement: anIfStatementNode [

	currentFASTEntity := self addToModel: FASTJavaIfStatement new.
	self setStartEndPos: anIfStatementNode.
	currentFASTEntity condition: (self clone accept: anIfStatementNode expression).
	currentFASTEntity thenPart: (self acceptStatement: anIfStatementNode trueStatement).
	anIfStatementNode falseStatement ifNotNil: [
		currentFASTEntity elsePart: (self acceptStatement: anIfStatementNode falseStatement) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitIfStatement: anIfStatementNode [
	currentFASTEntity := self addToModel: FASTJavaIfStatement new.
		self setStartEndPos: anIfStatementNode.
	currentFASTEntity
		condition: (self clone accept: anIfStatementNode expression).
	currentFASTEntity
		thenPart: (self acceptStatement: anIfStatementNode trueStatement).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitInitializedVariableDeclaration: anInitializedVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVariableDeclarator new.
	self setStartEndPos: anInitializedVariableDeclaration.
	currentFASTEntity
		variable: (self clone accept: anInitializedVariableDeclaration variable);
		dimensions: (self arrayDimensionsOf: anInitializedVariableDeclaration variable).
	currentFASTEntity
		expression: (self clone accept: anInitializedVariableDeclaration initializer).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitInitializer: aInitializer [
	currentFASTEntity := FASTJavaInitializer new.
	self setStartEndPos: aInitializer.
	currentFASTEntity statementBlock: (self clone accept: aInitializer block).
	self addToModel: currentFASTEntity.
	^ currentFASTEntity
]

{ #category : 'generated' }
JavaSmaCCProgramNodeImporterVisitor >> visitInstanceofPatternExpression: anInstanceofPatternExpression [
	"SmaCC gives a single node representing both the instanceof operation and the type pattern.
	FAST splits it into an infix operation with the type pattern as the right operand."

	self
		create: FASTJavaInfixOperation
		from: anInstanceofPatternExpression.
	currentFASTEntity leftOperand:
		(self clone accept: anInstanceofPatternExpression object).
	currentFASTEntity rightOperand: (self typePatternOf: anInstanceofPatternExpression).
	currentFASTEntity operator: 'instanceof'.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitIntType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaIntTypeExpression new
				name: aByteType token value;
				yourself).
	self setStartEndPos: aByteType.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitIntegerLiteral: anIntegerLiteral [
	"JLS 3.10.1: an integer literal is of type long when an L suffixes it, of type int otherwise."

	| tokenValue |
	tokenValue := anIntegerLiteral token value.

	currentFASTEntity := self
		                     create: (('Ll' includes: tokenValue last)
				                      ifTrue: [ FASTJavaLongLiteral ]
				                      ifFalse: [ FASTJavaIntegerLiteral ])
		                     from: anIntegerLiteral.
	currentFASTEntity primitiveValue: tokenValue.

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitInterfaceDeclaration: anInterfaceDeclaration [

	self create: FASTJavaInterfaceDeclaration from: anInterfaceDeclaration.
	currentFASTEntity name: anInterfaceDeclaration name value.

	anInterfaceDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].

	self addTypeParametersOf: anInterfaceDeclaration.

	anInterfaceDeclaration interfaceTypes do: [ :interface | currentFASTEntity addInterface: (self clone accept: interface) ].
	anInterfaceDeclaration declarations do: [ :declaration | currentFASTEntity addDeclaration: (self clone accept: declaration) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitLabeledStatement: aLabeledStatement [

	currentFASTEntity := self addToModel: (FASTJavaLabeledStatement new
			                      label: aLabeledStatement identifier value;
			                      yourself).
	self setStartEndPos: aLabeledStatement.
	currentFASTEntity labeledStatement: (self acceptStatement: aLabeledStatement statement).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitLambdaExpression: aLambdaExpression [
	currentFASTEntity := self
		addToModel: FASTJavaLambdaExpression new.
	self setStartEndPos: aLambdaExpression.
	aLambdaExpression parameters do: [ :parameter | currentFASTEntity addParameter: (self clone accept: parameter) ].
	currentFASTEntity
		expression: (self clone accept: aLambdaExpression value).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitLocalVariableDeclaration: aLocalVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	self setStartEndPos: aLocalVariableDeclaration.
	aLocalVariableDeclaration type ifNotNil: [ currentFASTEntity type: (self clone accept: aLocalVariableDeclaration type) ].
	aLocalVariableDeclaration variableDeclarations
		do: [ :each | currentFASTEntity declarators add: (self clone accept: each) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitLocalVariableDeclarationStatement: aLocalVariableDeclarationStatement [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	self setStartEndPos: aLocalVariableDeclarationStatement.

	aLocalVariableDeclarationStatement declaration type ifNotNil: [ :declaredType |
		currentFASTEntity type: (self clone accept: declaredType) ].
	aLocalVariableDeclarationStatement declaration modifiers do: [ :modifier | 
		currentFASTEntity addModifier: (self clone accept: modifier) ].
	aLocalVariableDeclarationStatement declaration variableDeclarations
		do: [ :each | currentFASTEntity declarators add: (self clone accept: each) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitLongType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaLongTypeExpression new
				name: aByteType token value;
				yourself).
	self setStartEndPos: aByteType.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitMethodDeclaration: aMethodDeclaration [

	| methodBody |
	self create: FASTJavaMethodEntity from: aMethodDeclaration.
	currentFASTEntity name: aMethodDeclaration declarator name value.

	aMethodDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].

	aMethodDeclaration type ifNotNil: [ currentFASTEntity type: (self clone accept: aMethodDeclaration type) ].

	self addTypeParametersOf: aMethodDeclaration.

	aMethodDeclaration declarator parameters do: [ :parameter | currentFASTEntity addParameter: (self clone accept: parameter) ].

	self addThrowsOf: aMethodDeclaration.

	methodBody := self clone accept: aMethodDeclaration body.
	(methodBody isKindOf: JavaEmptyMethodBodyNode) ifFalse: [ currentFASTEntity statementBlock: (self clone accept: methodBody) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitMethodInvocation: aMethodInvocation [
	currentFASTEntity := self addToModel: FASTJavaMethodInvocation new.
	self setStartEndPos: aMethodInvocation.
	aMethodInvocation expressions do: [ :expression | currentFASTEntity addArgument: (self clone accept: expression) ].
	aMethodInvocation receiver
		ifNotNil: [ :receiver |
			| expression |
			expression := (receiver isMemberOf: JavaNameNode)
				              ifTrue: [ "If the element is named. It is more than propably an Identifier and not just an named element. So you pass over the normal rules of the importer"
					              self addToModel: (FASTJavaIdentifier new
							               name: receiver name value;
							               startPos: receiver startPosition;
							               endPos: receiver stopPosition;
							               yourself) ]
				              ifFalse: [ self clone accept: receiver ].
			currentFASTEntity receiver: (aMethodInvocation superToken
					 ifNil: [ expression ]
					 ifNotNil: [ :superToken | self createQualifiedSuper: expression at: superToken ]) ]
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
	"JLS 15.12: an invocation may write the type arguments of a generic method before
	its name, as `Collections.<String>emptyList()` does. They are types, a wildcard being
	no part of them."
	aMethodInvocation arguments do: [ :argument |
		| typeArgument |
		typeArgument := self clone accept: argument.
		typeArgument isTypeExpression ifTrue: [ currentFASTEntity addTypeArgument: typeArgument ] ].
	currentFASTEntity name: aMethodInvocation name value.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitMethodReference: aMethodReference [
	currentFASTEntity := self
		addToModel: FASTJavaMethodReference new.
	self setStartEndPos: aMethodReference.
	currentFASTEntity
		receiver: (self clone accept: aMethodReference receiver).
	currentFASTEntity
		name: (aMethodReference name value).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitModifier: aModifier [
	self create: FASTJavaModifier from: aModifier.
	currentFASTEntity token: aModifier token value.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitName: aName [

	self isOutsideTypeDeclaration
		ifTrue: [ 
			currentFASTEntity := self addToModel: FASTJavaQualifiedName new.
			self setStartEndPos: aName ]
		ifFalse: [ 
			currentFASTEntity := self
				                     create: FASTJavaVariableExpression
				                     from: aName ].
	currentFASTEntity name: aName name value.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitNew: aNewNode [

	currentFASTEntity := self addToModel: FASTJavaNewExpression new.
	self setStartEndPos: aNewNode.
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
		ifNotNil: [ currentFASTEntity type: (self clone accept: aNewNode type) ]
		ifNil: [
			currentFASTEntity type: (self clone createTypeName: aNewNode name withArguments: aNewNode arguments) ].
	currentFASTEntity isDiamond: (self writesDiamond: aNewNode).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitNewArray: aNewArray [
	| dimExprs emptyExprs |
	currentFASTEntity := self addToModel: FASTJavaNewArray new.
		self setStartEndPos: aNewArray.

	currentFASTEntity type: (self clone accept: aNewArray type).
	aNewArray initializer
		ifNotNil: [ :initialize | 
			currentFASTEntity initializer: (self clone accept: initialize) ].

	dimExprs := aNewArray dimExpressions
		collect: [ :dimExpression | self clone accept: dimExpression expression ].
	"for empty dim, no dimExpression is generated but tokens in 'leftBrackets' collection"
	emptyExprs := aNewArray leftBrackets
		collect: [ :emptyDimExpression | self clone visitEmptyDimExpression: emptyDimExpression ].

	"put them in correct order following their startPos"
	currentFASTEntity arguments:
		((dimExprs , emptyExprs) sorted: [ :a :b | a startPos < b startPos ]).

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitNewClass: aNewClass [

	currentFASTEntity := self addToModel: FASTJavaNewClassExpression new.
	self setStartEndPos: aNewClass.
	aNewClass expressions do: [ :expression | 
		currentFASTEntity arguments add: (self clone accept: expression) ].
	aNewClass type
		ifNotNil: [ currentFASTEntity type: (self clone accept: aNewClass type) ]
		ifNil: [
			currentFASTEntity type: (self clone createTypeName: aNewClass name withArguments: aNewClass arguments).
			currentFASTEntity receiver: (self clone accept: aNewClass primary) ].
	currentFASTEntity isDiamond: (self writesDiamond: aNewClass).
	aNewClass declarations do: [ :method | 
		currentFASTEntity declarations add: (self clone accept: method) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitNull: aNull [
	currentFASTEntity := self
		addToModel:
			(FASTJavaNullLiteral new
				primitiveValue: aNull token value;
				yourself).
	self setStartEndPos: aNull.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitOuterThis: aFASTJavaOuterThis [
	currentFASTEntity := FASTJavaOuterThis new.
	self setStartEndPos: aFASTJavaOuterThis.
	currentFASTEntity type: (self clone accept: aFASTJavaOuterThis name).
	self addToModel: currentFASTEntity.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitPackageDeclaration: aPackageDeclaration [
	currentFASTEntity := self addToModel: FASTJavaPackageDeclaration new.
	self setStartEndPos: aPackageDeclaration.
	currentFASTEntity qualifiedName: (self clone accept: aPackageDeclaration name).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitParameter: aParameter [
	"JLS 8.4.1: a parameter writes the modifiers it is declared with, an annotation
	(JLS 9.7.4) and `final` among them."

	currentFASTEntity := self addToModel: FASTJavaParameter new.
	self setStartEndPos: aParameter.
	currentFASTEntity variable: (self clone accept: aParameter variable).
	currentFASTEntity type: (self clone accept: aParameter type).
	currentFASTEntity dimensions: (self arrayDimensionsOf: aParameter variable).
	aParameter modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitPostDecrementExpression: aPostDecrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: aPostDecrementExpression expression).
	currentFASTEntity operator: aPostDecrementExpression minusMinus value.
	currentFASTEntity isPrefixedUnaryExpression: false.
	self setStartEndPos: aPostDecrementExpression.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitPostIncrementExpression: aPostIncrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: aPostIncrementExpression expression).
	currentFASTEntity operator: aPostIncrementExpression plusPlus value.
	currentFASTEntity isPrefixedUnaryExpression: false.
	self setStartEndPos: aPostIncrementExpression.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitPreDecrementExpression: aPreDecrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: aPreDecrementExpression expression).
	currentFASTEntity operator: aPreDecrementExpression minusMinus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self setStartEndPos: aPreDecrementExpression.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitPreIncrementExpression: aPreIncrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: aPreIncrementExpression expression).
	currentFASTEntity operator: aPreIncrementExpression plusPlus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self setStartEndPos: aPreIncrementExpression.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitPrimitiveType: aPrimitiveType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaPrimitiveTypeExpression new
				name: aPrimitiveType token value;
				yourself).
	self setStartEndPos: aPrimitiveType.
	^ currentFASTEntity
]

{ #category : 'generated' }
JavaSmaCCProgramNodeImporterVisitor >> visitProgramFile: aProgramFile [
	currentFASTEntity := self addToModel: FASTJavaCompilationUnit new.
	self setStartEndPos: aProgramFile.
	currentFASTEntity packageDeclaration: (self clone accept: aProgramFile packageDeclaration).
	aProgramFile imports do: [ :import | currentFASTEntity addImportDeclaration: (self clone accept: import) ].
	aProgramFile typeDeclarations do: [ :declaration | "Maybe CompilationUnit should use TWithDeclarations rather than having a relation for classes, interfaces, and enums"
			| entity |
			entity := self clone accept: declaration.
			entity isClassDeclaration ifTrue: [ currentFASTEntity addClassDeclaration: entity ].
			entity isInterfaceDeclaration ifTrue: [ currentFASTEntity addInterfaceDeclaration: entity ].
			entity isEnumDeclaration ifTrue: [ currentFASTEntity addEnumDeclaration: entity ].
			entity isAnnotationInterfaceDeclaration ifTrue: [ currentFASTEntity addAnnotationInterfaceDeclaration: entity ].
			entity isRecordDeclaration ifTrue: [ currentFASTEntity addRecordDeclaration: entity ] ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitQualifiedName: aQualifiedName [

	self isOutsideTypeDeclaration
		ifTrue: [
			currentFASTEntity := self addToModel: FASTJavaQualifiedName new.
			self setStartEndPos: aQualifiedName.
			currentFASTEntity namespace: (self clone accept: aQualifiedName nspace).
			currentFASTEntity name: aQualifiedName name value ]
		ifFalse: [ 
			currentFASTEntity := self addToModel: FASTJavaClassProperty new.
			self setStartEndPos: aQualifiedName.
			currentFASTEntity type: (self clone accept: aQualifiedName nspace).
			currentFASTEntity fieldName: aQualifiedName name value ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitQualifiedTypeName: aQualifiedTypeName [
	currentFASTEntity := self addToModel: FASTJavaQualifiedTypeName new.
	self setStartEndPos: aQualifiedTypeName.
	currentFASTEntity name: aQualifiedTypeName name value.
	currentFASTEntity namespace: (self clone accept: aQualifiedTypeName nspace).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitRecordDeclaration: aRecordDeclaration [
	"JLS 8.10: a record declares its components in its header. It can be generic and can
	implement interfaces, but it never extends."

	self create: FASTJavaRecordDeclaration from: aRecordDeclaration.
	currentFASTEntity name: aRecordDeclaration name value.

	aRecordDeclaration modifiers do: [ :modifier | currentFASTEntity addModifier: (self clone accept: modifier) ].

	self addTypeParametersOf: aRecordDeclaration.

	aRecordDeclaration parameters do: [ :component | currentFASTEntity addComponent: (self clone accept: component) ].
	aRecordDeclaration interfaces do: [ :interface | currentFASTEntity addInterface: (self clone accept: interface) ].
	aRecordDeclaration declarations do: [ :declaration | currentFASTEntity addDeclaration: (self clone accept: declaration) ].

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitReturnStatement: aReturnStatement [
	currentFASTEntity := self create: FASTJavaReturnStatement from: aReturnStatement.

	currentFASTEntity expression: (self clone accept: aReturnStatement expression).

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitShortType: aByteType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaShortTypeExpression new
				name: aByteType token value;
				yourself).
	self setStartEndPos: aByteType.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitSingleTypeImportDeclaration: aSingleTypeImportDeclaration [
	currentFASTEntity := self addToModel: FASTJavaImportDeclaration new.
	self setStartEndPos: aSingleTypeImportDeclaration.
	currentFASTEntity isStatic: aSingleTypeImportDeclaration staticToken isNotNil.
	currentFASTEntity qualifiedName: (self clone accept: aSingleTypeImportDeclaration name).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitStatementExpressionList: aStatementExpressionList [
	"JLS 14.14.1: a list of statement expressions writes one statement for each expression
	it holds, so they are all answered rather than one of them."

	^ aStatementExpressionList expressions collect: [ :expression |
		  self clone expressionStatementOf: expression ]
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitStaticInitializer: anInitializer [
	self visitInitializer: anInitializer.
	currentFASTEntity isStatic: true.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitStringLiteral: aStringLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaStringLiteral new
				primitiveValue: ((aStringLiteral token value removePrefix: '"') removeSuffix: '"');
				yourself).
	self setStartEndPos: aStringLiteral.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitSuperConstructorInvocation: aSuperConstructorInvocation [
	| expressionStatement |
	currentFASTEntity := self addToModel: FASTJavaExpressionStatement new.
	expressionStatement := currentFASTEntity. 
	self setStartEndPos: aSuperConstructorInvocation.
	"we encasulate the call inside a fast expression statement"
	currentFASTEntity expression: (self addToModel: FASTJavaMethodInvocation new).
	currentFASTEntity := currentFASTEntity expression.
	self setStartEndPos: aSuperConstructorInvocation.
	aSuperConstructorInvocation expressions do: [ :expression | currentFASTEntity arguments add: (self clone accept: expression) ].
	currentFASTEntity name: aSuperConstructorInvocation superToken value.
	^ expressionStatement
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitSuperMemberAcessor: aFieldAccess [
	currentFASTEntity := self create: FASTJavaVariableExpression from: aFieldAccess superToken.
	currentFASTEntity name: aFieldAccess superToken value.
	^ currentFASTEntity 
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitSwitchBlockExpressionGroup: aSwitchBlockExpressionGroup [

	| switchLabel |
	currentFASTEntity := self addToModel: FASTJavaSwitchRule new.
	self setStartEndPos: aSwitchBlockExpressionGroup.
	switchLabel := self addToModel: FASTJavaSwitchLabel new.
	aSwitchBlockExpressionGroup constants do: [ :constant | switchLabel caseExpressions add: (self clone accept: constant) ].
	"JLS 14.11.1: where a label writes no constant it may write a pattern, which the rule
	reads as a variable, and a guard the match must satisfy."
	aSwitchBlockExpressionGroup type ifNotNil: [
			switchLabel caseExpressions add: (self typePatternOf: aSwitchBlockExpressionGroup).
			aSwitchBlockExpressionGroup guard ifNotNil: [ :guard | switchLabel guard: (self clone accept: guard) ] ].
	currentFASTEntity label: switchLabel.
	currentFASTEntity body: (self clone accept: aSwitchBlockExpressionGroup value).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitSwitchBlockStatementGroup: aSwitchBlockStatementGroup [

	currentFASTEntity := self addToModel: (aSwitchBlockStatementGroup labels first class = JavaSwitchLabelNode
			                      ifTrue: [ FASTJavaLabeledCaseStatement new ]
			                      ifFalse: [ FASTJavaDefaultCaseStatement new ]).
	self setStartEndPos: aSwitchBlockStatementGroup.
	aSwitchBlockStatementGroup labels do: [ :label | currentFASTEntity labels add: (self clone accept: label) ].
	aSwitchBlockStatementGroup statements do: [ :statement | currentFASTEntity statements add: (self acceptStatement: statement) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitSwitchExpression: aSwitchExpression [

	currentFASTEntity := self addToModel: FASTJavaSwitchExpression new.
	self setStartEndPos: aSwitchExpression.
	currentFASTEntity condition: (self clone accept: aSwitchExpression expression).
	aSwitchExpression statementGroups do: [ :statementGroup | currentFASTEntity rules add: (self clone accept: statementGroup) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitSwitchExpressionAsStatement: aSwitchExpression [
	"JLS 14.11.1: a switch whose block is in arrow form is a switch statement when it is
	used as one."

	currentFASTEntity := self addToModel: FASTJavaSwitchStatement new.
	self setStartEndPos: aSwitchExpression.
	currentFASTEntity condition: (self clone accept: aSwitchExpression expression).
	aSwitchExpression statementGroups do: [ :statementGroup | currentFASTEntity rules add: (self clone accept: statementGroup) ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitSwitchLabel: aSwitchLabel [

	currentFASTEntity := self addToModel: FASTJavaSwitchLabel new.
	self setStartEndPos: aSwitchLabel.
	aSwitchLabel constants do: [ :constant | currentFASTEntity caseExpressions add: (self clone accept: constant) ].
	"JLS 14.11.1: where a label writes no constant it may write a pattern, which the
	labeled statements read as a variable, and a guard the match must satisfy."
	aSwitchLabel type ifNotNil: [
			currentFASTEntity caseExpressions add: (self typePatternOf: aSwitchLabel).
			aSwitchLabel guard ifNotNil: [ :guard | currentFASTEntity guard: (self clone accept: guard) ] ].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitSwitchStatement: aSwitchStatement [
	currentFASTEntity := self addToModel: FASTJavaSwitchStatement new.
	self setStartEndPos: aSwitchStatement.
	aSwitchStatement block statementGroups do: [ :aStatementGroup |
		 currentFASTEntity cases add: (self clone accept: aStatementGroup) ].
	currentFASTEntity condition: (self clone accept: aSwitchStatement expression).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitSynchronizedStatement: aSynchronizedStatement [
	currentFASTEntity := self
		addToModel: FASTJavaSynchronizedStatement new.
	self setStartEndPos: aSynchronizedStatement.
	currentFASTEntity
		expression: (self clone accept: aSynchronizedStatement expression).
	currentFASTEntity
		block: (self clone accept: aSynchronizedStatement block).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitThisConstructorInvocation: aThisConstructorInvocation [
	| expressionStatement | 
	currentFASTEntity := self addToModel: FASTJavaExpressionStatement new.
	expressionStatement := currentFASTEntity. 
	self setStartEndPos: aThisConstructorInvocation.
	"we encasulate the call inside a fast expression statement"
	currentFASTEntity expression: (self addToModel: FASTJavaMethodInvocation new).
	currentFASTEntity := currentFASTEntity expression.
	self setStartEndPos: aThisConstructorInvocation.
	aThisConstructorInvocation expressions
		do:
			[ :expression | currentFASTEntity arguments add: (self clone accept: expression) ].
	currentFASTEntity name: aThisConstructorInvocation thisToken value.
	^ expressionStatement
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitThrowStatement: aThrowStatement [
	currentFASTEntity := self addToModel: FASTJavaThrowStatement new.
	self setStartEndPos: aThrowStatement.
	currentFASTEntity expression: (self clone accept: aThrowStatement expression).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitTryStatement: aTryStatement [
	currentFASTEntity := self create: FASTJavaTryCatchStatement from: aTryStatement.

	aTryStatement resources do: [ :tryResource |
		currentFASTEntity addResource: (self clone accept: tryResource)
	].

	currentFASTEntity try: (self clone accept: aTryStatement block).

	aTryStatement catches
		do:
			[ :aCatchBlock | currentFASTEntity addCatch: (self clone accept: aCatchBlock) ].

	currentFASTEntity finally: (self clone accept: aTryStatement finally).

	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitTypeArgument: aTypeArgument [

	self flag: 'Would probably be better to introduce a FASTJavaTypeWildCardParameterExpression'.

	^aTypeArgument questionMark
		ifNil: [  self accept: aTypeArgument type ]
		ifNotNil: [
			currentFASTEntity := self create: FASTJavaTypeParameterExpression  from: aTypeArgument.
			currentFASTEntity name: '?'.

			"JLS 4.5.1: `? extends B` writes an upper bound, which is what the types of a
			type parameter are, and `? super B` writes a lower one. Both are class types
			here, so an array bound such as the one of `Class<? extends T[]>` has no place
			among them."
			aTypeArgument token ifNotNil: [ :keyword |
				(aTypeArgument type isKindOf: JavaClassTypeNode) ifTrue: [
					keyword value = 'extends' ifTrue: [
						currentFASTEntity addType: (self clone accept: aTypeArgument type) ].
					keyword value = 'super' ifTrue: [
						currentFASTEntity superType: (self clone accept: aTypeArgument type) ] ] ].

			currentFASTEntity
		]
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitTypeImportOnDemandDeclaration: aTypeImportOnDemandDeclaration [
	currentFASTEntity := self addToModel: FASTJavaImportDeclaration new.
	self setStartEndPos: aTypeImportOnDemandDeclaration.
	currentFASTEntity
		isStatic: aTypeImportOnDemandDeclaration staticToken isNotNil;
		isOnDemand: true;
		qualifiedName:
			(self clone accept: aTypeImportOnDemandDeclaration name).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitTypeName: aTypeName [
	currentFASTEntity := self addToModel: FASTJavaTypeName new.
	currentFASTEntity name: aTypeName name value.
	self setStartEndPos: aTypeName.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitTypeParameter: aTypeParameter [
	currentFASTEntity := self addToModel: FASTJavaTypeParameterExpression new.
	self setStartEndPos: aTypeParameter.
	currentFASTEntity name: aTypeParameter name value.
	aTypeParameter types do: [ :type |
		currentFASTEntity addType: (self clone accept: type)
	].
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitUnaryAddition: anUnaryAddition [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: anUnaryAddition expression).
	currentFASTEntity operator: anUnaryAddition plus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self setStartEndPos: anUnaryAddition.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitUnaryBitInvert: anUnaryBitInvert [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: anUnaryBitInvert expression).
	currentFASTEntity operator: anUnaryBitInvert tilde value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self setStartEndPos: anUnaryBitInvert.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitUnaryNot: aUnaryNotExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: aUnaryNotExpression expression).
	currentFASTEntity operator: aUnaryNotExpression bang value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self setStartEndPos: aUnaryNotExpression.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitUnarySubtraction: anUnarySubtraction [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity
		expression: (self clone accept: anUnarySubtraction expression).
	currentFASTEntity operator: anUnarySubtraction minus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	self setStartEndPos: anUnarySubtraction.
	^ currentFASTEntity
]

{ #category : 'generated' }
JavaSmaCCProgramNodeImporterVisitor >> visitVariableArgumentParameter: aVariableArgumentParameter [
	self visitParameter: aVariableArgumentParameter.
	currentFASTEntity hasVariableArguments: true.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitVariableDeclaration: aVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVariableDeclarator new.
	self setStartEndPos: aVariableDeclaration.
	currentFASTEntity
		variable: (self clone accept: aVariableDeclaration variable);
		dimensions: (self arrayDimensionsOf: aVariableDeclaration variable).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitVariableName: aVariableName [
	currentFASTEntity := self create: FASTJavaVariableExpression from: aVariableName.
	currentFASTEntity name: aVariableName name value.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitVoidType: aVoidType [
	currentFASTEntity := self
		addToModel:
			(FASTJavaVoidTypeExpression new
				name: aVoidType voidToken value;
				yourself).
	self setStartEndPos: aVoidType.
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitWhileStatement: aWhileStatementNode [
	currentFASTEntity := self addToModel: FASTJavaWhileStatement new.
	self setStartEndPos: aWhileStatementNode.
	currentFASTEntity
		condition: (self clone accept: aWhileStatementNode expression).
	currentFASTEntity
		body: (self acceptStatement: aWhileStatementNode statement).
	^ currentFASTEntity
]

{ #category : 'visitor' }
JavaSmaCCProgramNodeImporterVisitor >> visitYieldStatement: aYieldStatement [

	currentFASTEntity := self addToModel: FASTJavaYieldStatement new.
	self setStartEndPos: aYieldStatement.
	currentFASTEntity expression: (self clone accept: aYieldStatement expression).
	^ currentFASTEntity
]

{ #category : 'initialization' }
JavaSmaCCProgramNodeImporterVisitor >> withComments [
	withComments := true
]

{ #category : 'testing' }
JavaSmaCCProgramNodeImporterVisitor >> writesDiamond: aCreationNode [
	"JLS 15.9.1: a creation writes the diamond where it writes the two angle brackets with
	no type argument between them, asking for the arguments to be inferred. The brackets
	belong to the name of the type instantiated, except in the form qualified by a
	primary, where that name is an identifier and the creation holds them itself."

	aCreationNode type ifNotNil: [ :type |
		^ type name lt isNotNil and: [ type name arguments isEmpty ] ].

	^ aCreationNode typeArgLeft isNotNil and: [ aCreationNode arguments isEmpty ]
]
