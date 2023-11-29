"
A visitor to export the AST as Java source code.
The export is based solely on the AST, so some information is missing
(comments, indentation, ...)

to use it:
```
FASTJavaExportVisitor new export: aFASTJavaNode
```
"
Class {
	#name : #FASTJavaExportVisitor,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'stream',
		'indent',
		'expressionContextOperator'
	],
	#classVars : [
		'OperatorsPrecedence'
	],
	#category : #'FAST-Java-Tools-export'
}

{ #category : #'class initialization' }
FASTJavaExportVisitor class >> initialize [
	"precedence of operators as defined in
	 https://web.archive.org/web/20110716213410/www.uni-bonn.de/%7Emanfear/javaoperators.php
	or
	https://www.javatpoint.com/java-operator-precedence
	also
	https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html"

	<script: 'FASTJavaExportVisitor initialize'>
	
	OperatorsPrecedence := Dictionary newFrom: {
		"arrayIndex/messageSend/memberAccess"
		#arrayIndex -> 17 .
		#messageSend -> 17 .
		#memberAccess -> 17 .
		"postfixOperator"
		#'unary++' -> 16 .
		#'unary--' -> 16 .
		"prefixOperator"
		#'++unary' -> 15 .
		#'--unary' -> 15 .
		#'+unary' -> 15 .
		#'-unary' -> 15 .
		#'~unary' -> 15 .
		#'!unary' -> 15 .
		"cast"
		#cast -> 14 .
		"multiplicativeOperator"
		#'*' -> 13 .
		#'/' -> 13 .
		#'%' -> 13 .
		"stringConcatenationOperator -- introduced to deal with: String+(i+1)"
		#stringConcatenation -> 12 .
		"additiveOperator"
		#'+' -> 11 .
		#'-' -> 11 .
		"shiftOperator"
		#'<<' -> 10 .
		#'>>' -> 10 .
		#'>>>' -> 10 .
		"relationalOperator"
		#'<' -> 9 .
		#'>' -> 9 .
		#'<=' -> 9 .
		#'>=' -> 9 .
		#instanceof -> 9 .
		"equalityOperator"
		#'==' -> 8 .
		#'!=' -> 8 .
		"bitwiseAndOperator"
		#'&' -> 7 .
		"bitwiseExclusiveOrOperator"
		#'^' -> 6 .
		"bitwiseInclusiveOrOperator"
		#'|' -> 5 .
		"logicalAndOperator"
		#'&&' -> 4 .
		"logicalOrOperator"
		#'||' -> 3 .
		"ternaryOperator"
		#'?:' -> 2 .
		"assignmentOperator"
		#'=' ->  1.
		#'+=' -> 1 .
		#'-=' -> 1 .
		#'*=' -> 1 .
		#'/=' -> 1 .
		#'%=' -> 1 .
		#'&=' -> 1 .
		#'^=' -> 1 .
		#'|=' -> 1 .
		#'<<=' -> 1 .
		#'>>=' -> 1 .
		#'>>>=' -> 1 .
		"topLevelExpression -- introduced to deal with an expression as argument of a method call
		 because we are using a global stack, it does not see the difference with a message send
		 on a sub-expression"
		#topLevelExpression -> -1
	}
]

{ #category : #precedence }
FASTJavaExportVisitor class >> operatorPrecedence: operator [
	^OperatorsPrecedence at: operator
]

{ #category : #outputting }
FASTJavaExportVisitor >> checkForComments: aNode andDo: exportingBlock [
	"checks whether the node as comments
	- if yes print block comments (/*...*/) before the node and line comments (//...) after the nodes
	- if no, just prints the node
	Comments are ordered in ascending order of their position"
	| allCmts |
	
	aNode ifNil:               [ ^exportingBlock value ].
	aNode isCollection ifTrue: [ ^exportingBlock value ].
	aNode hasComments ifFalse: [ ^exportingBlock value ].

	allCmts := aNode comments sorted: [:cmtA :cmtB | cmtA startPos < cmtB startPos].

	allCmts do: [ :cmt |
		cmt isBlockComment ifTrue: [ self outputBlockComment: cmt ] ].
	exportingBlock value.
	allCmts do: [ :cmt | cmt isLineComment ifTrue: [ self outputLineComment: cmt ] ]

]

{ #category : #outputting }
FASTJavaExportVisitor >> endOfStatement [
	self noIndent: $;.
	self newLine
]

{ #category : #api }
FASTJavaExportVisitor >> export: aFASTNode [
	^String streamContents: [ :st |
		stream := st.
		indent := 0.
		self accept: aFASTNode.
	]
]

{ #category : #precedence }
FASTJavaExportVisitor >> expression: aBlock needsParentheses: needsParentheses [

	needsParentheses ifTrue: [ self noIndent: $( ].
	aBlock value.
	needsParentheses ifTrue: [ self noIndent: $) ]
]

{ #category : #precedence }
FASTJavaExportVisitor >> expression: aBlock withOperator: operator [
	"execute aBlock possibly putting parenthesis around the result depending on the precedence of #operator
	 But before executing a block, we need to push the operator on the context stack so that 
	 precedence of possible sub-expressions be compared to it"

	self
		expression: [
			expressionContextOperator push: operator.
			aBlock value.
			expressionContextOperator pop
		]
		needsParentheses: (self needsParentheses: operator)
]

{ #category : #outputting }
FASTJavaExportVisitor >> goBack: aNumber [

	"go back aNumber characters in the output stream"

	(stream position <= aNumber)
		ifTrue:  [ stream position: 0 ]
		ifFalse: [ stream position: (stream position - aNumber) ]
]

{ #category : #outputting }
FASTJavaExportVisitor >> indent [
	indent := indent + 1
]

{ #category : #outputting }
FASTJavaExportVisitor >> indentPrefix [
	^(indent > 0)
		ifTrue: [ (String new: (indent * 2))
			atAllPut: Character space ]
		ifFalse: [ '' ]
	
]

{ #category : #initialization }
FASTJavaExportVisitor >> initialize [ 
	super initialize.

	expressionContextOperator := Stack new.
	indent := 0.
	stream := WriteStream on: ''
	
]

{ #category : #precedence }
FASTJavaExportVisitor >> isStringConcatenation: aFASTJavaInfixOperation [

	^(aFASTJavaInfixOperation operator = '+')
	and: [
		(self returnsAString: aFASTJavaInfixOperation leftOperand)
		or: [ self returnsAString: aFASTJavaInfixOperation rightOperand ]
	]
]

{ #category : #precedence }
FASTJavaExportVisitor >> needsParentheses: operator [
	"an expression containing #operator needs parentheses if it is inside another expression
	 with an operator of higher precedence"

	expressionContextOperator ifEmpty: [ ^false ].

	^(self class operatorPrecedence: operator asSymbol)
		<
		(self class operatorPrecedence: expressionContextOperator top asSymbol)
]

{ #category : #outputting }
FASTJavaExportVisitor >> newLine [
	stream cr
]

{ #category : #outputting }
FASTJavaExportVisitor >> noIndent: aPrintable [
	stream << aPrintable
]

{ #category : #outputting }
FASTJavaExportVisitor >> outputBlockComment: aComment [
	"assuming block comments need a new line afterTest This is not always true, but difficult to decide"
	self withIndent: aComment content.
	self newLine
]

{ #category : #outputting }
FASTJavaExportVisitor >> outputLineComment: aComment [
	"If there is a newline before the line comment, remove it
	 Then lineComment is always followed by a newline"

	(stream peekLast = Character cr)
	ifTrue: [ stream position: (stream position - 1)].

	self noIndent: aComment content.
	self newLine
]

{ #category : #precedence }
FASTJavaExportVisitor >> returnsAString: aFASTJavaExpression [
	"not a real type inference checking, just deals with the simplest cases which seem
	 to be the ones causing problem"

	(aFASTJavaExpression class = FASTJavaStringLiteral)
		ifTrue: [ ^true ].

	(aFASTJavaExpression class = FASTJavaInfixOperation)
		ifFalse: [ ^false ].

	^self isStringConcatenation: aFASTJavaExpression	
]

{ #category : #outputting }
FASTJavaExportVisitor >> space [
	stream space
]

{ #category : #precedence }
FASTJavaExportVisitor >> topLevelExpression: aBlock [

	expressionContextOperator push: #topLevelExpression.
	aBlock value.
	expressionContextOperator pop
]

{ #category : #outputting }
FASTJavaExportVisitor >> unindent [
	indent := indent - 1
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaAnnotation: aFASTJavaAnnotation [
	self checkForComments: aFASTJavaAnnotation andDo: [
		self
			withIndent: $@ ;
			noIndent: aFASTJavaAnnotation name.
		aFASTJavaAnnotation elements ifNotEmpty: [ :arguments |
			self noIndent: $(.
			self visitNodeListSeparatedByCommas: arguments.
			self noIndent: $)
		]
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArgumentsList: aFASTJavaArgumentList [
	self checkForComments: aFASTJavaArgumentList andDo: [
		self noIndent: $(.
		self visitNodeListSeparatedByCommas: aFASTJavaArgumentList.
		self noIndent: $)
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayAccess: aFASTJavaArrayAccess [
	self checkForComments: aFASTJavaArrayAccess andDo: [
	aFASTJavaArrayAccess array accept: self.
	self noIndent: '['.
	aFASTJavaArrayAccess expression accept: self.
	self noIndent: ']'.
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayAnnotationElement: aFASTJavaArrayAnnotationElement [

	self checkForComments: aFASTJavaArrayAnnotationElement andDo: [
		self noIndent: '{ '.
		self
			visitNodeListSeparatedByCommas: aFASTJavaArrayAnnotationElement values.
		self noIndent: ' }'.
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayInitializer: aFASTJavaArrayInitializer [
	self checkForComments: aFASTJavaArrayInitializer andDo: [
		self noIndent: '{ '.
		self
			visitNodeListSeparatedByCommas: aFASTJavaArrayInitializer initializers.
		self noIndent: ' }'.
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayTypeExpression: aFASTJavaArrayTypeExpression [
	self checkForComments: aFASTJavaArrayTypeExpression andDo: [
	aFASTJavaArrayTypeExpression baseType accept: self.
	self noIndent: '[]'.
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaAssertStatement: aFASTJavaAssertStatement [
	self checkForComments: aFASTJavaAssertStatement andDo: [
		self withIndent: 'assert '.
		aFASTJavaAssertStatement condition accept: self.

		aFASTJavaAssertStatement message
		ifNotNil: [ :message |
			self noIndent: ' : '.
			message accept: self
		].

		self endOfStatement
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaAssignmentExpression: aFASTJavaAssignmentExpression [

	self checkForComments: aFASTJavaAssignmentExpression andDo: [
		self
			expression: [
				aFASTJavaAssignmentExpression variable accept: self.
				self noIndent: ' ' , aFASTJavaAssignmentExpression operator , ' '.
				aFASTJavaAssignmentExpression expression accept: self
				]
			withOperator: aFASTJavaAssignmentExpression operator
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaBlockOrStatement: aFASTJavaStatement [
	self checkForComments: aFASTJavaStatement andDo: [
	"for 'then' and 'else' parts of the if-statement,
	if it's a simple statement (not a block), go to next line and indent
	Not very elegant solution but simple"
	(aFASTJavaStatement isKindOf: FASTJavaStatementBlock)
	ifFalse: [ self newLine ].

	aFASTJavaStatement accept: self
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaBooleanTypeExpression: aFASTJavaBooleanTypeExpression [
	self checkForComments: aFASTJavaBooleanTypeExpression andDo: [
	self noIndent: 'boolean'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaBreakStatement: aFASTJavaBreakStatement [

	self checkForComments: aFASTJavaBreakStatement andDo: [
		self
			withIndent: 'break' ;
			endOfStatement
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaByteTypeExpression: aFASTJavaByteTypeExpression [
	self checkForComments: aFASTJavaByteTypeExpression andDo: [
	self noIndent: 'byte'
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	self checkForComments: aFASTJavaCastExpression andDo: [
		self
			expression: [
				self
					expression: [ aFASTJavaCastExpression type accept: self ]
					needsParentheses: true.
				self space.
				aFASTJavaCastExpression expression accept: self
			]
			withOperator: #cast
	]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [

	self checkForComments: aFASTJavaCatchPartStatement andDo: [ 
		self withIndent: 'catch ('.

		aFASTJavaCatchPartStatement catchedTypes do: [ :catchType | catchType accept: self ]
			separatedBy: [ self noIndent: ' | ' ].
		self space.
		aFASTJavaCatchPartStatement parameter accept: self.
		self noIndent: ') '.

		aFASTJavaCatchPartStatement body accept: self
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCharTypeExpression: aFASTJavaCharTypeExpression [
	self checkForComments: aFASTJavaCharTypeExpression andDo: [
	self noIndent: 'char'
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCharacterLiteral: aFASTJavaCharacterLiteral [
	self checkForComments: aFASTJavaCharacterLiteral andDo: [
		self noIndent: $'.
		super visitFASTJavaCharacterLiteral: aFASTJavaCharacterLiteral.
		self noIndent: $'
	]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaClassDeclaration: aFASTJavaClassDeclaration [

	self checkForComments: aFASTJavaClassDeclaration andDo: [
		self visitFASTJavaModifiers: aFASTJavaClassDeclaration modifiers.
		self noIndent: 'class '.
		self noIndent: aFASTJavaClassDeclaration name.
		aFASTJavaClassDeclaration superclass ifNotNil: [ :superclass |
			self noIndent: ' extends '.
			superclass accept: self ].
		aFASTJavaClassDeclaration interfaces ifNotEmpty: [ :interfaces |
			self noIndent: ' implements '.
			interfaces
				do: [ :interface | interface accept: self ]
				separatedBy: [ self noIndent: ', ' ] ].

		aFASTJavaClassDeclaration declarations
			ifNotNil: [ :declarations | self visitJavaClassMemberDeclarations: declarations ].
		self newLine
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	self checkForComments: aFASTJavaClassProperty andDo: [
	aFASTJavaClassProperty type accept: self.
	stream
		<< $.
		<< aFASTJavaClassProperty fieldName
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaClassTypeExpression: aFASTJavaClassTypeExpression [
	self checkForComments: aFASTJavaClassTypeExpression andDo: [
		aFASTJavaClassTypeExpression typeName accept: self.
		aFASTJavaClassTypeExpression arguments
			ifNotEmpty: [ :typeArguments |
				self noIndent: $<.
				self visitNodeListSeparatedByCommas: typeArguments.
				self noIndent: $>.
			]
	]
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaCompilationUnit: aFASTJavaCompilationUnit [
	self checkForComments: aFASTJavaCompilationUnit andDo: [
	aFASTJavaCompilationUnit packageDeclaration ifNotNil: [ :decl | 
		self visitFASTJavaPackageDeclaration: decl.
		self newLine ].
	aFASTJavaCompilationUnit importDeclarations ifNotEmpty: [ :decls | 
		decls do: [ :decl | self visitFASTJavaImportDeclaration: decl ].
		self newLine ].
	aFASTJavaCompilationUnit interfaceDeclarations do: [ :decl | 
		self visitFASTJavaInterfaceDeclaration: decl ].
	aFASTJavaCompilationUnit classDeclarations do: [ :decl | 
		self visitFASTJavaClassDeclaration: decl ]
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaConditionalExpression: aFASTJavaConditionalExpression [
	self checkForComments: aFASTJavaConditionalExpression andDo: [
		self
			expression: [
				aFASTJavaConditionalExpression condition accept: self.
				self noIndent: ' ? '.
				self topLevelExpression: [
					aFASTJavaConditionalExpression thenPart accept: self
				].
				self noIndent: ' : '.
				aFASTJavaConditionalExpression elsePart accept: self
			]
			withOperator: '?:'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaContinueStatement: aFASTJavaContinueStatement [

	self checkForComments: aFASTJavaContinueStatement andDo: [
		self
			withIndent: 'continue' ;
			endOfStatement
	]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaDefaultCaseStatement: aFASTJavaDefaultCaseStatement [
	self checkForComments: aFASTJavaDefaultCaseStatement andDo: [ 
		self
			withIndent: 'default:' ;
			newLine ;
			indent.
		aFASTJavaDefaultCaseStatement statements do: [ :caseStatement |
			caseStatement accept: self
		].
		self unindent 
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaDoWhileStatement: aFASTJavaDoWhileStatement [
	self checkForComments: aFASTJavaDoWhileStatement andDo: [
		self withIndent: 'do '.
		aFASTJavaDoWhileStatement body accept: self.
		self withIndent: 'while ('.
		aFASTJavaDoWhileStatement condition accept: self.
		self
			noIndent: ')' ;
			endOfStatement.
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaDoubleTypeExpression: aFASTJavaDoubleTypeExpression [
	self checkForComments: aFASTJavaDoubleTypeExpression andDo: [
	self noIndent: 'double'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaElsePartStatement: aFASTJavaStatement [
	self checkForComments: aFASTJavaStatement andDo: [
	aFASTJavaStatement ifNil: [ ^self ].
	self withIndent: 'else '.
	self visitFASTJavaBlockOrStatement: aFASTJavaStatement
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaEmptyMethodDeclaration: aFASTJavaEmptyMethodDeclaration [
	"An emptyMethodDeclaration is a semicolon where a MethodDeclaration is expected
	eg: In this example, the class has a MethodDeclaration and an EmptyMethodDeclaration
	`class Blah {
	   void method() {
	   };
	}`
	 This is assumed probably a mistake of the but we keep it just in case"

	self endOfStatement
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaEnumConstant: aFASTJavaEnumConstant [

	self checkForComments: aFASTJavaEnumConstant andDo: [
		self noIndent: aFASTJavaEnumConstant name
	]
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaEnumDeclaration: aFASTJavaEnumDeclaration [

	self checkForComments: aFASTJavaEnumDeclaration andDo: [
		self visitFASTJavaModifiers: aFASTJavaEnumDeclaration modifiers.
		self
			noIndent: 'enum ' ;
			noIndent: aFASTJavaEnumDeclaration name.

		aFASTJavaEnumDeclaration interfaces ifNotEmpty: [ :interfaces |
			self noIndent: ' implements '.
			interfaces
				do: [ :interface | interface accept: self ]
				separatedBy: [ self noIndent: ', ' ] ].

		self
			noIndent: ' {' ;
			newLine ;
			indent.

		self withIndent: ''.
		self visitNodeListSeparatedByCommas: aFASTJavaEnumDeclaration constants.
		self noIndent: $;.
		self newLine.

		aFASTJavaEnumDeclaration declarations
			ifNotNil: [ :declarations |
				declarations do: [ :declaration | declaration accept: self ]. ].

		self
			unindent ;
			withIndent: $} ;
			newLine.
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [
	self checkForComments: aFASTJavaFieldAccess andDo: [
		self
			expression: [
				aFASTJavaFieldAccess receiver accept: self.
				self noIndent: $. .
				self noIndent: aFASTJavaFieldAccess fieldName
			]
			 withOperator: #memberAccess
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaFloatLiteral: aFASTJavaFloatLiteral [
	self checkForComments: aFASTJavaFloatLiteral andDo: [
		super visitFASTJavaFloatLiteral: aFASTJavaFloatLiteral
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaFloatTypeExpression: aFASTJavaFloatTypeExpression [
	self checkForComments: aFASTJavaFloatTypeExpression andDo: [
	self noIndent: 'float'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	self checkForComments: aFASTJavaForEachStatement andDo: [
		self withIndent: 'for ('.
		aFASTJavaForEachStatement type accept: self.
		self space.
		aFASTJavaForEachStatement fieldname accept: self.
		self noIndent: ' : '.
		aFASTJavaForEachStatement list accept: self.
		self noIndent: ') '.
		self indent.
		self visitFASTJavaBlockOrStatement: aFASTJavaForEachStatement body.
		self unindent.
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForStatement: aFASTJavaForStatement [

	self
		checkForComments: aFASTJavaForStatement
		andDo: [
			self withIndent: 'for ('.
			
			self visitFASTJavaForStatementInitializer: aFASTJavaForStatement initializer.
			self visitFASTJavaForStatementCondition:   aFASTJavaForStatement condition.
			self visitFASTJavaForStatementIncrementor: aFASTJavaForStatement incrementor.

			self noIndent: ') '.
			
			self indent.
			self visitFASTJavaBlockOrStatement: aFASTJavaForStatement body.
			self unindent
		]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForStatementCondition: aFASTJavaForStatementCondition [

	aFASTJavaForStatementCondition
		ifNil: [ self noIndent: $; ]
		ifNotNil: [
			aFASTJavaForStatementCondition accept: self.
			self noIndent: '; '
		]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForStatementIncrementor: aFASTJavaForStatementIncrementor [

	aFASTJavaForStatementIncrementor ifNil: [ ^self ].

	aFASTJavaForStatementIncrementor accept: self.
	"'incrementor' is a FASTJavaStatement that prints ';\n' "
	self goBack: 2
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForStatementInitializer: aFASTJavaForStatementInitializer [

	aFASTJavaForStatementInitializer
		ifNil: [ self noIndent: $; ]
		ifNotNil: [
			aFASTJavaForStatementInitializer accept: self.
			"'initializer' is a FASTJavaStatement that prints a \n"
			self goBack: 1.
			self space
		].

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	self checkForComments: aFASTJavaIdentifier andDo: [
		self noIndent: aFASTJavaIdentifier name
	]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	self checkForComments: aFASTJavaIfStatement andDo: [
	self withIndent: 'if ('.
	aFASTJavaIfStatement condition accept: self.
	self noIndent: ') '.
	self visitFASTJavaThenPartStatement: aFASTJavaIfStatement thenPart.
	self visitFASTJavaElsePartStatement: aFASTJavaIfStatement elsePart
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaImportDeclaration: aFASTJavaImportDeclaration [
	self checkForComments: aFASTJavaImportDeclaration andDo: [
	self noIndent: 'import '.
	aFASTJavaImportDeclaration isStatic ifTrue: [ self noIndent: 'static ' ].
	self visitFASTJavaQualifiedName: aFASTJavaImportDeclaration qualifiedName.
	aFASTJavaImportDeclaration isOnDemand ifTrue: [ self noIndent: '.*' ].
	self endOfStatement
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [

	| operator |

	operator := (self isStringConcatenation: aFASTJavaInfixOperation)
		ifTrue: [ #stringConcatenation ]
		ifFalse: [ aFASTJavaInfixOperation operator ].

	self checkForComments: aFASTJavaInfixOperation andDo: [
		self
			expression: [
				aFASTJavaInfixOperation leftOperand accept: self.
				(aFASTJavaInfixOperation operator = 'instanceof')
					ifTrue:  [ self space ; noIndent: aFASTJavaInfixOperation operator ; space ]
					ifFalse: [ self noIndent: aFASTJavaInfixOperation operator].
				aFASTJavaInfixOperation rightOperand accept: self.
			]
			withOperator: operator
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaIntTypeExpression: aFASTJavaIntTypeExpression [
	self checkForComments: aFASTJavaIntTypeExpression andDo: [
	self noIndent: 'int'
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaInterfaceDeclaration: aFASTJavaInterfaceDeclaration [

	self checkForComments: aFASTJavaInterfaceDeclaration andDo: [
		self visitFASTJavaModifiers: aFASTJavaInterfaceDeclaration modifiers.
		self noIndent: 'interface '.
		self noIndent: aFASTJavaInterfaceDeclaration name.
		aFASTJavaInterfaceDeclaration interfaces ifNotEmpty: [ :interfaces |
			self noIndent: ' extends '.
			interfaces
				do: [ :interface | interface accept: self ]
				separatedBy: [ self noIndent: ', ' ] ].

		aFASTJavaInterfaceDeclaration declarations
			ifNotNil: [ :declarations | self visitJavaClassMemberDeclarations: declarations ].
		self newLine
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaLabeledCaseStatement: aFASTJavaLabeledCaseStatement [
	self checkForComments: aFASTJavaLabeledCaseStatement andDo: [ 
		self withIndent: 'case '.
		aFASTJavaLabeledCaseStatement label accept: self.
		self
			noIndent: ' :' ;
			newLine ;
			indent.
		aFASTJavaLabeledCaseStatement statements do: [ :caseStatement |
			caseStatement accept: self
		].
		self unindent
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaLabeledStatement: aFASTJavaLabeledStatement [
	"Note on indentation: the 'inner statement' in aFASTJavaLabeledStatement
	 will be displayed with leading indentation except if it is a block statement
	 The result is not very consistent or pretty, but it will do for now"

	self checkForComments: aFASTJavaLabeledStatement andDo: [ 
		self
			withIndent: aFASTJavaLabeledStatement label ;
			noIndent: $:.
		aFASTJavaLabeledStatement labeledStatement accept: self
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaLambdaExpression: aFASTJavaLambdaExpression [
	self checkForComments: aFASTJavaLambdaExpression andDo: [
		self noIndent: $(.
		self visitNodeListSeparatedByCommas: aFASTJavaLambdaExpression parameters.
		self noIndent: ') -> '.
		aFASTJavaLambdaExpression expression accept: self
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaLongLiteral: aFASTJavaLongLiteral [
	self checkForComments: aFASTJavaLongLiteral andDo: [
		self visitFASTTLiteral: aFASTJavaLongLiteral
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaLongTypeExpression: aFASTJavaLongTypeExpression [
	self checkForComments: aFASTJavaLongTypeExpression andDo: [
	self noIndent: 'long'
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	self checkForComments: aFASTJavaMethodEntity andDo: [
		self withIndent: ''.
		self visitFASTJavaModifiers: aFASTJavaMethodEntity modifiers.

		aFASTJavaMethodEntity typeParameters ifNotEmpty: [ :typeParameters |
			self noIndent: $<.
			self visitNodeListSeparatedByCommas: typeParameters.
			self noIndent: '> '.
		].

		aFASTJavaMethodEntity type ifNotNil: [ :methodType |
			"not a constructor method"
			methodType accept: self.
			self space
		].

		self noIndent: aFASTJavaMethodEntity name.
		self visitFASTJavaParameters: aFASTJavaMethodEntity parameters.
		self visitFASTJavaMethodThrows: aFASTJavaMethodEntity throws.

		aFASTJavaMethodEntity statementBlock
			ifNil: [
				"an abstract method"
				self
					noIndent: $; ;
					newLine
			]
			ifNotNil: [ :statementBlock | statementBlock accept: self ]
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	self checkForComments: aFASTJavaMethodInvocation andDo: [
		self
			expression: [
				self visitFASTJavaMethodInvocationReceiver: aFASTJavaMethodInvocation receiver.
				self noIndent: aFASTJavaMethodInvocation name.

				self topLevelExpression: [
					self visitFASTJavaArgumentsList: aFASTJavaMethodInvocation arguments
				]
			]
			withOperator: #messageSend
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocationReceiver: aFASTJavaMethodInvocation [
	self checkForComments: aFASTJavaMethodInvocation andDo: [
		aFASTJavaMethodInvocation ifNil: [ ^ self ].
		aFASTJavaMethodInvocation accept: self.
		self noIndent: $.
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaMethodThrows: aFASTJavaThrownExceptionsCollection [
	self checkForComments: aFASTJavaThrownExceptionsCollection andDo: [
	aFASTJavaThrownExceptionsCollection ifEmpty: [ ^self ].
	self noIndent: ' throws '.
	self
		visitNodeListSeparatedByCommas: aFASTJavaThrownExceptionsCollection
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaModifier: aFASTJavaModifier [
	self checkForComments: aFASTJavaModifier andDo: [
	self noIndent: aFASTJavaModifier token
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaModifiers: aFASTJavaModifierCollection [
	self checkForComments: aFASTJavaModifierCollection andDo: [
	aFASTJavaModifierCollection
		select: [ :modifier | modifier isKindOf: FASTJavaAnnotation ]
		thenDo: [ :aFASTJavaAnnotation | 
			self visitFASTJavaAnnotation: aFASTJavaAnnotation.
			self newLine.
			self withIndent: '' ].
	aFASTJavaModifierCollection
		select: [ :modifier | modifier isKindOf: FASTJavaModifier ]
		thenDo: [ :aFASTJavaModifier | 
			self visitFASTJavaModifier: aFASTJavaModifier.
			self space ]
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNewArray: aFASTJavaNewArray [

	self checkForComments: aFASTJavaNewArray andDo: [
		self noIndent: 'new '.
		aFASTJavaNewArray type accept: self.
		aFASTJavaNewArray arguments do: [ :arg |
			self noIndent: $[.
			arg accept: self.
			self noIndent: $].
		].

		aFASTJavaNewArray initializer
		ifNotNil: [ :init |
			self noIndent: ' '.
			init accept: self
		]
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression [
	self checkForComments: aFASTJavaNewClassExpression andDo: [
		self noIndent: 'new '.
		aFASTJavaNewClassExpression type accept: self.
		self visitFASTJavaArgumentsList: aFASTJavaNewClassExpression arguments.

		self visitJavaClassMemberDeclarations: aFASTJavaNewClassExpression declarations
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	self checkForComments: aFASTJavaNewExpression andDo: [
		self noIndent: 'new '.
		aFASTJavaNewExpression type accept: self.
		self visitFASTJavaArgumentsList: aFASTJavaNewExpression arguments
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	self checkForComments: aFASTJavaNullLiteral andDo: [
		self noIndent: 'null'
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaOuterThis: aFASTJavaOuterThis [
	self checkForComments: aFASTJavaOuterThis andDo: [
		aFASTJavaOuterThis type accept: self.
		self noIndent: '.this'
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaPackageDeclaration: aFASTJavaPackageDeclaration [
	self checkForComments: aFASTJavaPackageDeclaration andDo: [
	self noIndent: 'package '.
	self visitFASTJavaQualifiedName: aFASTJavaPackageDeclaration qualifiedName.
	self endOfStatement
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	self checkForComments: aFASTJavaParameter andDo: [
		aFASTJavaParameter type 
			ifNotNil: [ :parameterType |
				"Lambda parameters may be typeless"
				parameterType accept: self.
				self space
			].
		aFASTJavaParameter variable accept: self
	]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaParameters: aFASTJavaParameterCollection [
	self checkForComments: aFASTJavaParameterCollection andDo: [
		self noIndent: $(.
		self visitNodeListSeparatedByCommas: aFASTJavaParameterCollection.
		self noIndent: ') '
	]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaQualifiedName: aFASTJavaQualifiedName [
	self checkForComments: aFASTJavaQualifiedName andDo: [
	self noIndent: aFASTJavaQualifiedName fullName
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaQualifiedTypeName: aFASTJavaQualifiedTypeName [

	aFASTJavaQualifiedTypeName namespace accept: self.
	self
		noIndent: $. ;
		noIndent: aFASTJavaQualifiedTypeName name .

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaShortTypeExpression: aFASTJavaShortTypeExpression [
	self checkForComments: aFASTJavaShortTypeExpression andDo: [
	self noIndent: 'short'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaStatement: aFASTJavaStatement [
	"empty statement ?"

	self checkForComments: aFASTJavaStatement andDo: [
		self withIndent: ''.
		self endOfStatement
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	self checkForComments: aFASTJavaStringLiteral andDo: [
		self noIndent: $".
		super visitFASTJavaStringLiteral: aFASTJavaStringLiteral.
		self noIndent: $"
	]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaSwitchStatement: aFASTJavaSwitchStatement [

	self checkForComments: aFASTJavaSwitchStatement andDo: [
		self withIndent: 'switch ('.
		aFASTJavaSwitchStatement condition accept: self.
		self
			noIndent: ') {' ;
			newLine ;
			indent.
		aFASTJavaSwitchStatement cases do: [ :switchCase |
			switchCase accept: self
		].
		self
			unindent ;
			withIndent: $} ;
			newLine
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaSynchronizedStatement: aFASTJavaSynchronizedStatement [

	self checkForComments: aFASTJavaSynchronizedStatement andDo: [
		self withIndent: 'synchronized('.
		aFASTJavaSynchronizedStatement expression accept: self.
		self noIndent: ') '.
		aFASTJavaSynchronizedStatement block accept: self.
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaThenPartStatement: aFASTJavaStatement [
	self checkForComments: aFASTJavaStatement andDo: [
		self visitFASTJavaBlockOrStatement: aFASTJavaStatement
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaThrowStatement: aFASTJavaThrowStatement [

	self checkForComments: aFASTJavaThrowStatement andDo: [
		self withIndent: 'throw '.
		aFASTJavaThrowStatement expression accept: self.
		self endOfStatement
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	self checkForComments: aFASTJavaTryCatchStatement andDo: [
		self withIndent: 'try '.

		aFASTJavaTryCatchStatement resources
			ifNotEmpty: [ :tryResources | self visitTryResources: tryResources ].

		aFASTJavaTryCatchStatement try accept: self.

		aFASTJavaTryCatchStatement catches do: [ :catchStatement |
			catchStatement accept: self
		].

		aFASTJavaTryCatchStatement finally
			ifNotNil: [ :finallyPart |
				self withIndent: 'finally '.
				finallyPart accept: self
		]
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaTypeName: aFASTJavaTypeName [
	self checkForComments: aFASTJavaTypeName andDo: [
	self noIndent: aFASTJavaTypeName name
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaTypeParameter: aFASTJavaTypeParameterExpression [
	self checkForComments: aFASTJavaTypeParameterExpression andDo: [
		self noIndent: aFASTJavaTypeParameterExpression name.
		aFASTJavaTypeParameterExpression types ifNotEmpty: [ :typeArgumentSuperclasses |
			self noIndent: ' extends '.
			self visitNodeListSeparatedByCommas: typeArgumentSuperclasses
		]
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaUnaryExpression: aFASTJavaUnaryExpression [
	"exports '++a' or 'a++'
	 if '++a' has a infixOperationRightOperandOwner (resp. 'a++' has a infixOperationLeftOperandOwner)
	 it could be in an addition 'x + ++a' to avoidhaving 'x+++a', we add an extra space."

	self checkForComments: aFASTJavaUnaryExpression andDo: [
		aFASTJavaUnaryExpression isPrefixedUnaryExpression
			ifTrue: [
				self
					expression: [
						aFASTJavaUnaryExpression infixOperationRightOperandOwner
							ifNotNil: [ self space ].
						self noIndent: aFASTJavaUnaryExpression operator.

						self visitFASTTExpression: aFASTJavaUnaryExpression ]
					withOperator: (aFASTJavaUnaryExpression operator , 'unary')
			]
			ifFalse: [ 
				self
					expression: [
						self visitFASTTExpression: aFASTJavaUnaryExpression.
						self noIndent: aFASTJavaUnaryExpression operator.
						aFASTJavaUnaryExpression infixOperationLeftOperandOwner
							ifNotNil: [ self space ].
					]
					withOperator: ('unary' , aFASTJavaUnaryExpression operator)
			]
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	self checkForComments: aFASTJavaVarDeclStatement andDo: [
		self withIndent: ''.
		aFASTJavaVarDeclStatement modifiers do: [:modifier |
			modifier accept: self.
			self space.
		].
		aFASTJavaVarDeclStatement type accept: self.
		self space.
		self visitNodeListSeparatedByCommas: aFASTJavaVarDeclStatement declarators.
		self endOfStatement
	]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	self checkForComments: aFASTJavaVariableDeclarator andDo: [
		aFASTJavaVariableDeclarator variable accept: self.
		aFASTJavaVariableDeclarator expression ifNil: [ ^ self ].
		self noIndent: ' = '.
		aFASTJavaVariableDeclarator expression accept: self
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	self checkForComments: aFASTJavaVariableExpression andDo: [
	self noIndent: aFASTJavaVariableExpression name
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaVoidTypeExpression: aFASTJavaBooleanTypeExpression [
	self checkForComments: aFASTJavaBooleanTypeExpression andDo: [
	self noIndent: 'void'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [
	
	self checkForComments: aFASTJavaWhileStatement andDo: [
		self withIndent: 'while ('.
		aFASTJavaWhileStatement condition accept: self.
		self noIndent: ') '.
		self indent.
		self visitFASTJavaBlockOrStatement: aFASTJavaWhileStatement body.
		self unindent.
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTTExpressionStatement: aFASTTExpressionStatement [
	self checkForComments: aFASTTExpressionStatement andDo: [
	self withIndent: ''.
	aFASTTExpressionStatement expression accept: self.
	self endOfStatement
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTTLiteral: aFASTTLiteral [
	self noIndent: aFASTTLiteral primitiveValue
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTTReturnStatement: aFASTTReturnStatement [
	self withIndent: 'return '.
	aFASTTReturnStatement expression
		ifNotNil: [ :returnedExpression | returnedExpression accept: self ].
	self endOfStatement
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	self topLevelExpression: [
		self noIndent: ${.
		self newLine.
		self indent.
		aFASTJavaStatementBlock statements do: [ :node |
			node accept: self
		].
		self unindent.
		self withIndent: $}.
		self newLine
	]
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitJavaClassMemberDeclarations: classDeclarationsList [

	self noIndent: ' {'.
	self newLine.

	self indent.
	classDeclarationsList do: [ :declaration |
		declaration accept: self ].
	self noIndent: $}.

	^ self unindent
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitNodeListSeparatedByCommas: aCollection [
	aCollection
		do: [ :node | node accept: self ]
		separatedBy: [ self noIndent: ', ' ]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitTryResources: tryResources [
	"we need to fiddle with indent and endOfStatement because resources are FASTJavaVarDeclStatement
	 #visitFASTJavaVariableDeclarator: ends with semicolon and newline (it's a statement), so:
	 - first #goBack:1 removes newline at the end of each resource declaration
	 - second #goBack:1 removes semicolon at the end of last resource declaration"

	| tmpIndent |
	tmpIndent := indent.
	indent := 0.

	self noIndent: $(.

	tryResources
		do: [ :aResource |
			aResource accept: self.
			self goBack: 1
		]
		separatedBy: [ self noIndent: Character space ].
		
	self
		goBack: 1 ;
		noIndent: ') '.
	
	indent := tmpIndent.
]

{ #category : #outputting }
FASTJavaExportVisitor >> withIndent: aPrintable [
	self noIndent: self indentPrefix.
	self noIndent: aPrintable
]
