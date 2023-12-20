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
	#traits : 'FASTTExporter',
	#classTraits : 'FASTTExporter classTrait',
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
	self unindented: ';'.
	self newLine
]

{ #category : #api }
FASTJavaExportVisitor >> export: aFASTNode [
	^String streamContents: [ :st |
		outputStream := st.
		self accept: aFASTNode.
	]
]

{ #category : #outputting }
FASTJavaExportVisitor >> goBack: aNumber [

	"go back aNumber characters in the output stream"

	(self outputStream position <= aNumber)
		ifTrue:  [ self outputStream position: 0 ]
		ifFalse: [ self outputStream position: (self outputStream position - aNumber) ]
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
FASTJavaExportVisitor >> languageOperatorsPrecedence [
	"redefined to introduce Java specific operators
	
	precedence of operators as defined in
	https://web.archive.org/web/20110716213410/www.uni-bonn.de/%7Emanfear/javaoperators.php
	or
	https://www.javatpoint.com/java-operator-precedence
	also
	https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html"

	"arrayIndex/messageSend/memberAccess"
	operatorsPrecedence at: #arrayIndex put: 120.
	operatorsPrecedence at: #messageSend put: 120.
	operatorsPrecedence at: #memberAccess put: 120.

	"unary operators"
	operatorsPrecedence at: #'~unary' put: 110.
	
	"shift operators, between additive and relational"
	operatorsPrecedence at: #'<<' put: 65.
	operatorsPrecedence at: #'>>' put: 65.
	operatorsPrecedence at: #'>>>' put: 65.

	"instanceof = relational operator"
	operatorsPrecedence at: #instanceof put: 60.

	"bitwise operators between equality and logicalAnd operators"
	operatorsPrecedence at: #'&' put: 46.
	operatorsPrecedence at: #'^' put: 45.
	operatorsPrecedence at: #'|' put: 44.

	"assignment operators"
	operatorsPrecedence at: #'%=' put: 10.
	operatorsPrecedence at: #'&=' put: 10.
	operatorsPrecedence at: #'^=' put: 10.
	operatorsPrecedence at: #'|=' put: 10.
	operatorsPrecedence at: #'<<=' put: 10.
	operatorsPrecedence at: #'>>=' put: 10.
	operatorsPrecedence at: #'>>>=' put: 10.

]

{ #category : #outputting }
FASTJavaExportVisitor >> outputBlockComment: aComment [
	"assuming block comments need a new line afterTest This is not always true, but difficult to decide"

	self indented: aComment content.
	self newLine
]

{ #category : #outputting }
FASTJavaExportVisitor >> outputLineComment: aComment [
	"If there is a newline before the line comment, remove it
	 Then lineComment is always followed by a newline"

	(self outputStream peekLast = Character cr)
	ifTrue: [ self goBack: 1 ].

	self unindented: aComment content.
	self newLine
]

{ #category : #precedence }
FASTJavaExportVisitor >> returnsAString: aFASTJavaExpression [
	"used to decide whether a '+' is a String concatenation operator
	 not a real type inference checking, just deals with the simplest cases which seem
	 to be the ones causing problem"

	(aFASTJavaExpression class = FASTJavaStringLiteral)
		ifTrue: [ ^true ].

	(aFASTJavaExpression class = FASTJavaInfixOperation)
		ifFalse: [ ^false ].

	^self isStringConcatenation: aFASTJavaExpression	
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaAnnotation: aFASTJavaAnnotation [
	self checkForComments: aFASTJavaAnnotation andDo: [
		self
			unindented: $@ ;
			unindented: aFASTJavaAnnotation name.
		aFASTJavaAnnotation elements ifNotEmpty: [ :arguments |
			self unindented: $(.
			self visitNodeListSeparatedByCommas: arguments.
			self unindented: $)
		]
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArgumentsList: aFASTJavaArgumentList [
	self checkForComments: aFASTJavaArgumentList andDo: [
		self unindented: $(.
		self visitNodeListSeparatedByCommas: aFASTJavaArgumentList.
		self unindented: $)
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayAccess: aFASTJavaArrayAccess [
	self checkForComments: aFASTJavaArrayAccess andDo: [
	aFASTJavaArrayAccess array accept: self.
	self unindented: '['.
	aFASTJavaArrayAccess expression accept: self.
	self unindented: ']'.
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayAnnotationElement: aFASTJavaArrayAnnotationElement [

	self checkForComments: aFASTJavaArrayAnnotationElement andDo: [
		self unindented: '{ '.
		self
			visitNodeListSeparatedByCommas: aFASTJavaArrayAnnotationElement values.
		self unindented: ' }'.
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayInitializer: aFASTJavaArrayInitializer [
	self checkForComments: aFASTJavaArrayInitializer andDo: [
		self unindented: '{ '.
		self
			visitNodeListSeparatedByCommas: aFASTJavaArrayInitializer initializers.
		self unindented: ' }'.
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayTypeExpression: aFASTJavaArrayTypeExpression [
	self checkForComments: aFASTJavaArrayTypeExpression andDo: [
	aFASTJavaArrayTypeExpression baseType accept: self.
	self unindented: '[]'.
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaAssertStatement: aFASTJavaAssertStatement [
	self checkForComments: aFASTJavaAssertStatement andDo: [
		self indented: 'assert '.
		aFASTJavaAssertStatement condition accept: self.

		aFASTJavaAssertStatement message
		ifNotNil: [ :message |
			self unindented: ' : '.
			message accept: self
		].

		self endOfStatement
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaAssignmentExpression: aFASTJavaAssignmentExpression [

	self checkForComments: aFASTJavaAssignmentExpression andDo: [
		self
			outputExpression: [
				aFASTJavaAssignmentExpression variable accept: self.
				self unindented: ' ' , aFASTJavaAssignmentExpression operator , ' '.
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
	self unindented: 'boolean'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaBreakStatement: aFASTJavaBreakStatement [

	self checkForComments: aFASTJavaBreakStatement andDo: [
		self
			indented: 'break' ;
			endOfStatement
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaByteTypeExpression: aFASTJavaByteTypeExpression [
	self checkForComments: aFASTJavaByteTypeExpression andDo: [
	self unindented: 'byte'
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	self checkForComments: aFASTJavaCastExpression andDo: [
		self
			outputExpression: [
				self
					outputExpression: [ aFASTJavaCastExpression type accept: self ]
					inParentheses: true.
				self space.
				aFASTJavaCastExpression expression accept: self
			]
			withOperator: #cast
	]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [

	self checkForComments: aFASTJavaCatchPartStatement andDo: [ 
		self indented: 'catch ('.

		aFASTJavaCatchPartStatement catchedTypes do: [ :catchType | catchType accept: self ]
			separatedBy: [ self unindented: ' | ' ].
		self space.
		aFASTJavaCatchPartStatement parameter accept: self.
		self unindented: ') '.

		aFASTJavaCatchPartStatement body accept: self
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCharTypeExpression: aFASTJavaCharTypeExpression [
	self checkForComments: aFASTJavaCharTypeExpression andDo: [
	self unindented: 'char'
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCharacterLiteral: aFASTJavaCharacterLiteral [
	self checkForComments: aFASTJavaCharacterLiteral andDo: [
		self unindented: $'.
		super visitFASTJavaCharacterLiteral: aFASTJavaCharacterLiteral.
		self unindented: $'
	]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaClassDeclaration: aFASTJavaClassDeclaration [

	self checkForComments: aFASTJavaClassDeclaration andDo: [
		self visitFASTJavaModifiers: aFASTJavaClassDeclaration modifiers.
		self unindented: 'class '.
		self unindented: aFASTJavaClassDeclaration name.
		aFASTJavaClassDeclaration superclass ifNotNil: [ :superclass |
			self unindented: ' extends '.
			superclass accept: self ].
		aFASTJavaClassDeclaration interfaces ifNotEmpty: [ :interfaces |
			self unindented: ' implements '.
			interfaces
				do: [ :interface | interface accept: self ]
				separatedBy: [ self unindented: ', ' ] ].

		aFASTJavaClassDeclaration declarations
			ifNotNil: [ :declarations | self visitJavaClassMemberDeclarations: declarations ].
		self newLine
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	self checkForComments: aFASTJavaClassProperty andDo: [
	aFASTJavaClassProperty type accept: self.
	self
		<< '.' ;
		<< aFASTJavaClassProperty fieldName
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaClassTypeExpression: aFASTJavaClassTypeExpression [
	self checkForComments: aFASTJavaClassTypeExpression andDo: [
		aFASTJavaClassTypeExpression typeName accept: self.
		aFASTJavaClassTypeExpression arguments
			ifNotEmpty: [ :typeArguments |
				self unindented: $<.
				self visitNodeListSeparatedByCommas: typeArguments.
				self unindented: $>.
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
			outputExpression: [
				aFASTJavaConditionalExpression condition accept: self.
				self unindented: ' ? '.
				self outputTopLevelExpression: [
					aFASTJavaConditionalExpression thenPart accept: self
				].
				self unindented: ' : '.
				aFASTJavaConditionalExpression elsePart accept: self
			]
			withOperator: '?:'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaContinueStatement: aFASTJavaContinueStatement [

	self checkForComments: aFASTJavaContinueStatement andDo: [
		self
			indented: 'continue' ;
			endOfStatement
	]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaDefaultCaseStatement: aFASTJavaDefaultCaseStatement [
	self checkForComments: aFASTJavaDefaultCaseStatement andDo: [ 
		self
			indented: 'default:' ;
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
		self indented: 'do '.
		aFASTJavaDoWhileStatement body accept: self.
		self indented: 'while ('.
		aFASTJavaDoWhileStatement condition accept: self.
		self
			unindented: ')' ;
			endOfStatement.
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaDoubleTypeExpression: aFASTJavaDoubleTypeExpression [
	self checkForComments: aFASTJavaDoubleTypeExpression andDo: [
	self unindented: 'double'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaElsePartStatement: aFASTJavaStatement [
	self checkForComments: aFASTJavaStatement andDo: [
	aFASTJavaStatement ifNil: [ ^self ].
	self indented: 'else '.
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
		self unindented: aFASTJavaEnumConstant name
	]
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaEnumDeclaration: aFASTJavaEnumDeclaration [

	self checkForComments: aFASTJavaEnumDeclaration andDo: [
		self visitFASTJavaModifiers: aFASTJavaEnumDeclaration modifiers.
		self
			unindented: 'enum ' ;
			unindented: aFASTJavaEnumDeclaration name.

		aFASTJavaEnumDeclaration interfaces ifNotEmpty: [ :interfaces |
			self unindented: ' implements '.
			interfaces
				do: [ :interface | interface accept: self ]
				separatedBy: [ self unindented: ', ' ] ].

		self
			unindented: ' {' ;
			newLine ;
			indent.

		self indented: ''.
		self visitNodeListSeparatedByCommas: aFASTJavaEnumDeclaration constants.
		self unindented: $;.
		self newLine.

		aFASTJavaEnumDeclaration declarations
			ifNotNil: [ :declarations |
				declarations do: [ :declaration | declaration accept: self ]. ].

		self
			unindent ;
			indented: $} ;
			newLine.
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [
	self checkForComments: aFASTJavaFieldAccess andDo: [
		self
			outputExpression: [
				aFASTJavaFieldAccess receiver accept: self.
				self unindented: $. .
				self unindented: aFASTJavaFieldAccess fieldName
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
	self unindented: 'float'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	self checkForComments: aFASTJavaForEachStatement andDo: [
		self indented: 'for ('.
		aFASTJavaForEachStatement type accept: self.
		self space.
		aFASTJavaForEachStatement fieldname accept: self.
		self unindented: ' : '.
		aFASTJavaForEachStatement list accept: self.
		self unindented: ') '.
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
			self indented: 'for ('.
			
			self visitFASTJavaForStatementInitializer: aFASTJavaForStatement initializer.
			self visitFASTJavaForStatementCondition:   aFASTJavaForStatement condition.
			self visitFASTJavaForStatementIncrementor: aFASTJavaForStatement incrementor.

			self unindented: ') '.
			
			self indent.
			self visitFASTJavaBlockOrStatement: aFASTJavaForStatement body.
			self unindent
		]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForStatementCondition: aFASTJavaForStatementCondition [

	aFASTJavaForStatementCondition
		ifNil: [ self unindented: $; ]
		ifNotNil: [
			aFASTJavaForStatementCondition accept: self.
			self unindented: '; '
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
		ifNil: [ self unindented: $; ]
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
		self unindented: aFASTJavaIdentifier name
	]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	self checkForComments: aFASTJavaIfStatement andDo: [
	self indented: 'if ('.
	aFASTJavaIfStatement condition accept: self.
	self unindented: ') '.
	self visitFASTJavaThenPartStatement: aFASTJavaIfStatement thenPart.
	self visitFASTJavaElsePartStatement: aFASTJavaIfStatement elsePart
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaImportDeclaration: aFASTJavaImportDeclaration [
	self checkForComments: aFASTJavaImportDeclaration andDo: [
	self unindented: 'import '.
	aFASTJavaImportDeclaration isStatic ifTrue: [ self unindented: 'static ' ].
	self visitFASTJavaQualifiedName: aFASTJavaImportDeclaration qualifiedName.
	aFASTJavaImportDeclaration isOnDemand ifTrue: [ self unindented: '.*' ].
	self endOfStatement
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [

	| operator |

	operator := (self isStringConcatenation: aFASTJavaInfixOperation)
		ifTrue: [ #concat ]
		ifFalse: [ aFASTJavaInfixOperation operator ].

	self checkForComments: aFASTJavaInfixOperation andDo: [
		self
			outputExpression: [
				aFASTJavaInfixOperation leftOperand accept: self.
				(aFASTJavaInfixOperation operator = 'instanceof')
					ifTrue:  [ self space ; unindented: aFASTJavaInfixOperation operator ; space ]
					ifFalse: [ self unindented: aFASTJavaInfixOperation operator].
				aFASTJavaInfixOperation rightOperand accept: self.
			]
			withOperator: operator
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaIntTypeExpression: aFASTJavaIntTypeExpression [
	self checkForComments: aFASTJavaIntTypeExpression andDo: [
	self unindented: 'int'
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaInterfaceDeclaration: aFASTJavaInterfaceDeclaration [

	self checkForComments: aFASTJavaInterfaceDeclaration andDo: [
		self visitFASTJavaModifiers: aFASTJavaInterfaceDeclaration modifiers.
		self unindented: 'interface '.
		self unindented: aFASTJavaInterfaceDeclaration name.
		aFASTJavaInterfaceDeclaration interfaces ifNotEmpty: [ :interfaces |
			self unindented: ' extends '.
			interfaces
				do: [ :interface | interface accept: self ]
				separatedBy: [ self unindented: ', ' ] ].

		aFASTJavaInterfaceDeclaration declarations
			ifNotNil: [ :declarations | self visitJavaClassMemberDeclarations: declarations ].
		self newLine
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaLabeledCaseStatement: aFASTJavaLabeledCaseStatement [
	self checkForComments: aFASTJavaLabeledCaseStatement andDo: [ 
		self indented: 'case '.
		aFASTJavaLabeledCaseStatement label accept: self.
		self
			unindented: ' :' ;
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
			indented: aFASTJavaLabeledStatement label ;
			unindented: $:.
		aFASTJavaLabeledStatement labeledStatement accept: self
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaLambdaExpression: aFASTJavaLambdaExpression [
	self checkForComments: aFASTJavaLambdaExpression andDo: [
		self unindented: $(.
		self visitNodeListSeparatedByCommas: aFASTJavaLambdaExpression parameters.
		self unindented: ') -> '.
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
	self unindented: 'long'
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	self checkForComments: aFASTJavaMethodEntity andDo: [
		self indented: ''.
		self visitFASTJavaModifiers: aFASTJavaMethodEntity modifiers.

		aFASTJavaMethodEntity typeParameters ifNotEmpty: [ :typeParameters |
			self unindented: $<.
			self visitNodeListSeparatedByCommas: typeParameters.
			self unindented: '> '.
		].

		aFASTJavaMethodEntity type ifNotNil: [ :methodType |
			"not a constructor method"
			methodType accept: self.
			self space
		].

		self unindented: aFASTJavaMethodEntity name.
		self visitFASTJavaParameters: aFASTJavaMethodEntity parameters.
		self visitFASTJavaMethodThrows: aFASTJavaMethodEntity throws.

		aFASTJavaMethodEntity statementBlock
			ifNil: [
				"an abstract method"
				self
					unindented: $; ;
					newLine
			]
			ifNotNil: [ :statementBlock | statementBlock accept: self ]
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	self checkForComments: aFASTJavaMethodInvocation andDo: [
		self
			outputExpression: [
				self visitFASTJavaMethodInvocationReceiver: aFASTJavaMethodInvocation receiver.
				self unindented: aFASTJavaMethodInvocation name.

				self outputTopLevelExpression: [
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
		self unindented: $.
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaMethodThrows: aFASTJavaThrownExceptionsCollection [
	self checkForComments: aFASTJavaThrownExceptionsCollection andDo: [
	aFASTJavaThrownExceptionsCollection ifEmpty: [ ^self ].
	self unindented: ' throws '.
	self
		visitNodeListSeparatedByCommas: aFASTJavaThrownExceptionsCollection
]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaModifier: aFASTJavaModifier [
	self checkForComments: aFASTJavaModifier andDo: [
	self unindented: aFASTJavaModifier token
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
			self indented: '' ].
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
		self unindented: 'new '.
		aFASTJavaNewArray type accept: self.
		aFASTJavaNewArray arguments do: [ :arg |
			self unindented: $[.
			arg accept: self.
			self unindented: $].
		].

		aFASTJavaNewArray initializer
		ifNotNil: [ :init |
			self unindented: ' '.
			init accept: self
		]
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression [
	self checkForComments: aFASTJavaNewClassExpression andDo: [
		self unindented: 'new '.
		aFASTJavaNewClassExpression type accept: self.
		self visitFASTJavaArgumentsList: aFASTJavaNewClassExpression arguments.

		self visitJavaClassMemberDeclarations: aFASTJavaNewClassExpression declarations
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	self checkForComments: aFASTJavaNewExpression andDo: [
		self unindented: 'new '.
		aFASTJavaNewExpression type accept: self.
		self visitFASTJavaArgumentsList: aFASTJavaNewExpression arguments
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	self checkForComments: aFASTJavaNullLiteral andDo: [
		self unindented: 'null'
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaOuterThis: aFASTJavaOuterThis [
	self checkForComments: aFASTJavaOuterThis andDo: [
		aFASTJavaOuterThis type accept: self.
		self unindented: '.this'
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaPackageDeclaration: aFASTJavaPackageDeclaration [
	self checkForComments: aFASTJavaPackageDeclaration andDo: [
	self unindented: 'package '.
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
		self unindented: $(.
		self visitNodeListSeparatedByCommas: aFASTJavaParameterCollection.
		self unindented: ') '
	]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaQualifiedName: aFASTJavaQualifiedName [
	self checkForComments: aFASTJavaQualifiedName andDo: [
	self unindented: aFASTJavaQualifiedName fullName
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaQualifiedTypeName: aFASTJavaQualifiedTypeName [

	aFASTJavaQualifiedTypeName namespace accept: self.
	self
		unindented: $. ;
		unindented: aFASTJavaQualifiedTypeName name .

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaShortTypeExpression: aFASTJavaShortTypeExpression [
	self checkForComments: aFASTJavaShortTypeExpression andDo: [
	self unindented: 'short'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaStatement: aFASTJavaStatement [
	"empty statement ?"

	self checkForComments: aFASTJavaStatement andDo: [
		self indented: ''.
		self endOfStatement
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	self checkForComments: aFASTJavaStringLiteral andDo: [
		self unindented: $".
		super visitFASTJavaStringLiteral: aFASTJavaStringLiteral.
		self unindented: $"
	]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaSwitchStatement: aFASTJavaSwitchStatement [

	self checkForComments: aFASTJavaSwitchStatement andDo: [
		self indented: 'switch ('.
		aFASTJavaSwitchStatement condition accept: self.
		self
			unindented: ') {' ;
			newLine ;
			indent.
		aFASTJavaSwitchStatement cases do: [ :switchCase |
			switchCase accept: self
		].
		self
			unindent ;
			indented: $} ;
			newLine
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaSynchronizedStatement: aFASTJavaSynchronizedStatement [

	self checkForComments: aFASTJavaSynchronizedStatement andDo: [
		self indented: 'synchronized('.
		aFASTJavaSynchronizedStatement expression accept: self.
		self unindented: ') '.
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
		self indented: 'throw '.
		aFASTJavaThrowStatement expression accept: self.
		self endOfStatement
	]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	self checkForComments: aFASTJavaTryCatchStatement andDo: [
		self indented: 'try '.

		aFASTJavaTryCatchStatement resources
			ifNotEmpty: [ :tryResources | self visitTryResources: tryResources ].

		aFASTJavaTryCatchStatement try accept: self.

		aFASTJavaTryCatchStatement catches do: [ :catchStatement |
			catchStatement accept: self
		].

		aFASTJavaTryCatchStatement finally
			ifNotNil: [ :finallyPart |
				self indented: 'finally '.
				finallyPart accept: self
		]
	]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaTypeName: aFASTJavaTypeName [
	self checkForComments: aFASTJavaTypeName andDo: [
	self unindented: aFASTJavaTypeName name
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaTypeParameter: aFASTJavaTypeParameterExpression [
	self checkForComments: aFASTJavaTypeParameterExpression andDo: [
		self unindented: aFASTJavaTypeParameterExpression name.
		aFASTJavaTypeParameterExpression types ifNotEmpty: [ :typeArgumentSuperclasses |
			self unindented: ' extends '.
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
					outputExpression: [
						aFASTJavaUnaryExpression infixOperationRightOperandOwner
							ifNotNil: [ self space ].
						self unindented: aFASTJavaUnaryExpression operator.

						self visitFASTTExpression: aFASTJavaUnaryExpression ]
					withOperator: (aFASTJavaUnaryExpression operator , 'unary')
			]
			ifFalse: [ 
				self
					outputExpression: [
						self visitFASTTExpression: aFASTJavaUnaryExpression.
						self unindented: aFASTJavaUnaryExpression operator.
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
		self indented: ''.
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
		self unindented: ' = '.
		aFASTJavaVariableDeclarator expression accept: self
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	self checkForComments: aFASTJavaVariableExpression andDo: [
	self unindented: aFASTJavaVariableExpression name
]

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaVoidTypeExpression: aFASTJavaBooleanTypeExpression [
	self checkForComments: aFASTJavaBooleanTypeExpression andDo: [
	self unindented: 'void'
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [
	
	self checkForComments: aFASTJavaWhileStatement andDo: [
		self indented: 'while ('.
		aFASTJavaWhileStatement condition accept: self.
		self unindented: ') '.
		self indent.
		self visitFASTJavaBlockOrStatement: aFASTJavaWhileStatement body.
		self unindent.
]

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTTExpressionStatement: aFASTTExpressionStatement [

	self checkForComments: aFASTTExpressionStatement andDo: [
	  self indented: ''.
	  aFASTTExpressionStatement expression accept: self.
	  self endOfStatement
	]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTTLiteral: aFASTTLiteral [
	self unindented: aFASTTLiteral primitiveValue
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTTReturnStatement: aFASTTReturnStatement [
	self indented: 'return '.
	aFASTTReturnStatement expression
		ifNotNil: [ :returnedExpression | returnedExpression accept: self ].
	self endOfStatement
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	self outputTopLevelExpression: [
		self unindented: ${.
		self newLine.
		self indent.
		aFASTJavaStatementBlock statements do: [ :node |
			node accept: self
		].
		self unindent.
		self indented: $}.
		self newLine
	]
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitJavaClassMemberDeclarations: classDeclarationsList [

	self unindented: ' {'.
	self newLine.

	self indent.
	classDeclarationsList do: [ :declaration |
		declaration accept: self ].
	self unindented: $}.

	^ self unindent
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitNodeListSeparatedByCommas: aCollection [
	aCollection
		do: [ :node | node accept: self ]
		separatedBy: [ self unindented: ', ' ]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitTryResources: tryResources [
	"we need to fiddle with indent and endOfStatement because resources are FASTJavaVarDeclStatement
	 #visitFASTJavaVariableDeclarator: ends with semicolon and newline (it's a statement), so:
	 - first #goBack:1 removes newline at the end of each resource declaration
	 - second #goBack:1 removes semicolon at the end of last resource declaration"

	| tmpIndent |
	tmpIndent := self indentLevel.
	indentLevel := 0.

	self unindented: '('.

	tryResources
		do: [ :aResource |
			aResource accept: self.
			self goBack: 1
		]
		separatedBy: [ self space ].
		
	self
		goBack: 1 ;
		unindented: ') '.
	
	indentLevel := tmpIndent.
]
