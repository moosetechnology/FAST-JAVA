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
	#name : 'FASTJavaExportVisitor',
	#superclass : 'FASTJavaVisitor',
	#traits : 'FASTTExporter',
	#classTraits : 'FASTTExporter classTrait',
	#category : 'FAST-Java-Tools-export',
	#package : 'FAST-Java-Tools',
	#tag : 'export'
}

{ #category : 'outputting' }
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

{ #category : 'visiting' }
FASTJavaExportVisitor >> declarationsOf: aFASTJavaCompilationUnit do: aBlock [
	"JLS 7.3: the declarations a compilation unit writes, in the order it writes them: the
	type declarations of an ordinary unit, or the methods and fields of a compact one. The
	model holds one relation for each kind of declaration, so the order is read back from
	the positions they were imported at; a unit built rather than imported has none, and
	keeps the order of the relations."

	| declarations |
	declarations := OrderedCollection new.
	declarations
		addAll: aFASTJavaCompilationUnit interfaceDeclarations;
		addAll: aFASTJavaCompilationUnit annotationInterfaceDeclarations;
		addAll: aFASTJavaCompilationUnit classDeclarations;
		addAll: aFASTJavaCompilationUnit enumDeclarations;
		addAll: aFASTJavaCompilationUnit recordDeclarations;
		addAll: aFASTJavaCompilationUnit methodDeclarations;
		addAll: aFASTJavaCompilationUnit fieldDeclarations.

	(declarations allSatisfy: [ :declaration | declaration startPos isNotNil ]) ifTrue: [
		declarations sort: [ :one :another | one startPos <= another startPos ] ].

	declarations do: aBlock
]

{ #category : 'outputting' }
FASTJavaExportVisitor >> endOfStatement [
	self unindented: ';'.
	self newLine
]

{ #category : 'api' }
FASTJavaExportVisitor >> export: aFASTNode [
	^String streamContents: [ :st |
		outputStream := st.
		self accept: aFASTNode.
	]
]

{ #category : 'outputting' }
FASTJavaExportVisitor >> goBack: aNumber [

	"go back aNumber characters in the output stream"

	(self outputStream position <= aNumber)
		ifTrue:  [ self outputStream position: 0 ]
		ifFalse: [ self outputStream position: (self outputStream position - aNumber) ]
]

{ #category : 'precedence' }
FASTJavaExportVisitor >> isInfixOperation: anExpression withPrecedenceOf: anOperator [
	"JLS 15.17 to 15.24: a binary operator groups left to right, so an operation of the same
	precedence written as its right operand was written between parentheses, as `b + c` is
	in `a - (b + c)`. One of a lower precedence is parenthesized already."

	^ anExpression class = FASTJavaInfixOperation and: [
		  (self operatorPrecedence: (self operatorOf: anExpression)) = (self operatorPrecedence: anOperator) ]
]

{ #category : 'precedence' }
FASTJavaExportVisitor >> isStringConcatenation: aFASTJavaInfixOperation [

	^(aFASTJavaInfixOperation operator = '+')
	and: [
		(self returnsAString: aFASTJavaInfixOperation leftOperand)
		or: [ self returnsAString: aFASTJavaInfixOperation rightOperand ]
	]
]

{ #category : 'precedence' }
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

	"unary operators; JLS 15.15, 15.16: a cast is one, so a cast written as the operand of
	another needs no parentheses, as in `-(long) x`"
	operatorsPrecedence at: #'~unary' put: 110.
	operatorsPrecedence at: #cast put: 110.
	operatorsPrecedence at: #switch put: 110.
	
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

	"JLS 15.18: a + that concatenates strings is an additive operator like any other, and
	an operand of the same precedence written on its right was written between parentheses
	(see #isInfixOperation:withPrecedenceOf:)."
	operatorsPrecedence at: #concat put: 70.

	"assignment operators"
	operatorsPrecedence at: #'%=' put: 10.
	operatorsPrecedence at: #'&=' put: 10.
	operatorsPrecedence at: #'^=' put: 10.
	operatorsPrecedence at: #'|=' put: 10.
	operatorsPrecedence at: #'<<=' put: 10.
	operatorsPrecedence at: #'>>=' put: 10.
	operatorsPrecedence at: #'>>>=' put: 10.

]

{ #category : 'outputting' }
FASTJavaExportVisitor >> mergesWithLastWritten: anOperator [
	"JLS 3.5: a token is the longest run of characters that can make one, so a `-` written
	straight after another `-` stops being two negations and becomes the decrement
	operator, and `+` after `+` the increment. No other operator written here can merge
	with what precedes it."

	^ ('+-' includes: anOperator first) and: [ self outputStream peekLast = anOperator first ]
]

{ #category : 'outputting' }
FASTJavaExportVisitor >> outputBlockComment: aComment [
	"assuming block comments need a new line afterTest This is not always true, but difficult to decide"

	self indented: aComment content.
	self newLine
]

{ #category : 'outputting' }
FASTJavaExportVisitor >> outputLineComment: aComment [
	"If there is a newline before the line comment, remove it
	 Then lineComment is always followed by a newline"

	(self outputStream peekLast = Character cr)
	ifTrue: [ self goBack: 1 ].

	self unindented: aComment content.
	self newLine
]

{ #category : 'precedence' }
FASTJavaExportVisitor >> operatorOf: aFASTJavaInfixOperation [
	"A `+` that concatenates strings is told apart from one that adds numbers, although JLS
	15.18 gives both the same precedence."

	^ (self isStringConcatenation: aFASTJavaInfixOperation)
		  ifTrue: [ #concat ]
		  ifFalse: [ aFASTJavaInfixOperation operator ]
]

{ #category : 'precedence' }
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

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaAnnotation: aFASTJavaAnnotation [
	self checkForComments: aFASTJavaAnnotation andDo: [
		self unindented: $@.
		aFASTJavaAnnotation qualifiedName
			ifNil: [ self unindented: aFASTJavaAnnotation name ]
			ifNotNil: [ :qualifiedName | self visitFASTJavaQualifiedName: qualifiedName ].
		aFASTJavaAnnotation elements ifNotEmpty: [ :arguments |
			self unindented: $(.
			self visitNodeListSeparatedByCommas: arguments.
			self unindented: $)
		]
	]

]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaAnnotationElementDeclaration: aFASTJavaAnnotationElementDeclaration [

	self checkForComments: aFASTJavaAnnotationElementDeclaration andDo: [
			self indented: ''.
			self visitFASTJavaModifiers: aFASTJavaAnnotationElementDeclaration modifiers.
			aFASTJavaAnnotationElementDeclaration type accept: self.
			self space.
			self unindented: aFASTJavaAnnotationElementDeclaration name.
			self unindented: '()'.

			aFASTJavaAnnotationElementDeclaration defaultValue ifNotNil: [ :defaultValue |
					self unindented: ' default '.
					defaultValue accept: self ].

			self
				unindented: $;;
				newLine ]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaAnnotationInterfaceDeclaration: aFASTJavaAnnotationInterfaceDeclaration [

	self checkForComments: aFASTJavaAnnotationInterfaceDeclaration andDo: [
			self visitFASTJavaModifiers: aFASTJavaAnnotationInterfaceDeclaration modifiers.
			self unindented: '@interface '.
			self unindented: aFASTJavaAnnotationInterfaceDeclaration name.

			aFASTJavaAnnotationInterfaceDeclaration declarations ifNotNil: [ :declarations |
				self visitJavaClassMemberDeclarations: declarations ].
			self newLine ]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArgumentsList: aFASTJavaArgumentList [
	"JLS 15.9, 15.12: each argument is an expression of its own, whatever the expression the
	list is written in."

	self checkForComments: aFASTJavaArgumentList andDo: [
		self unindented: $(.
		self outputTopLevelExpression: [
			self visitNodeListSeparatedByCommas: aFASTJavaArgumentList ].
		self unindented: $)
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayAccess: aFASTJavaArrayAccess [
	"JLS 15.10.3: the array of an access is a primary, so a cast or a conditional written
	there was written between parentheses."

	self checkForComments: aFASTJavaArrayAccess andDo: [
		self
			outputExpression: [
				aFASTJavaArrayAccess array accept: self.
				self unindented: '['.
				self outputTopLevelExpression: [ aFASTJavaArrayAccess expression accept: self ].
				self unindented: ']' ]
			withOperator: #arrayIndex ]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayAnnotationElement: aFASTJavaArrayAnnotationElement [
	self checkForComments: aFASTJavaArrayAnnotationElement andDo: [
		self unindented: '{ '.
		self
			visitNodeListSeparatedByCommas: aFASTJavaArrayAnnotationElement values.
		aFASTJavaArrayAnnotationElement hasTrailingComma ifTrue: [ self unindented: $, ].
		self unindented: ' }'.
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayInitializer: aFASTJavaArrayInitializer [
	self checkForComments: aFASTJavaArrayInitializer andDo: [
		self unindented: '{ '.
		self visitNodeListSeparatedByCommas: aFASTJavaArrayInitializer initializers.
		aFASTJavaArrayInitializer hasTrailingComma ifTrue: [ self unindented: $, ].
		self unindented: ' }'.
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaArrayTypeExpression: aFASTJavaArrayTypeExpression [
	"JLS 10.2: the annotations a pair of brackets writes come between the component type
	and that pair."

	self checkForComments: aFASTJavaArrayTypeExpression andDo: [
	aFASTJavaArrayTypeExpression baseType accept: self.
	aFASTJavaArrayTypeExpression annotations ifNotEmpty: [ self space ].
	self visitFASTJavaModifiersInline: aFASTJavaArrayTypeExpression annotations.
	self unindented: '[]'.
]

]

{ #category : 'visiting statement' }
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

{ #category : 'visiting expression' }
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

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaBlockOrStatement: aFASTJavaStatement [
	self checkForComments: aFASTJavaStatement andDo: [
	"for 'then' and 'else' parts of the if-statement,
	if it's a simple statement (not a block), go to next line and indent
	Not very elegant solution but simple.
	A case statement answers isStatementBlock as well, holding statements of its own, so
	the class is what is asked for here: only a braced block writes no newline."
	(aFASTJavaStatement isKindOf: FASTJavaStatementBlock)
	ifFalse: [ self newLine ].

	aFASTJavaStatement accept: self
]

]

{ #category : 'generated' }
FASTJavaExportVisitor >> visitFASTJavaBooleanLiteral: aFASTJavaBooleanLiteral [
	self checkForComments: aFASTJavaBooleanLiteral andDo: [
		self visitFASTJavaLiteral: aFASTJavaBooleanLiteral
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaBooleanTypeExpression: aFASTJavaBooleanTypeExpression [
	self checkForComments: aFASTJavaBooleanTypeExpression andDo: [
	self visitFASTJavaModifiersInline: aFASTJavaBooleanTypeExpression annotations.
	self unindented: 'boolean'
]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaBreakStatement: aFASTJavaBreakStatement [
	"JLS 14.15: a break may name the label of the statement it leaves; without one it
	leaves the innermost loop or switch, so dropping the name moves where control goes."

	self checkForComments: aFASTJavaBreakStatement andDo: [
		self indented: 'break'.
		aFASTJavaBreakStatement label ifNotNil: [ :label | self unindented: ' ' , label ].
		self endOfStatement ]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaByteTypeExpression: aFASTJavaByteTypeExpression [
	self checkForComments: aFASTJavaByteTypeExpression andDo: [
	self visitFASTJavaModifiersInline: aFASTJavaByteTypeExpression annotations.
	self unindented: 'byte'
]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaCaseStatement: aFASTJavaCaseStatement [
	"JLS 14.11: a group writes every label control may enter it through, then the
	statements they share. A label that writes no case expression is the default, and a
	group may write it beside labels that do write one, so none of them may be assumed. A
	label over null writes `default` after the constants rather than instead of them."

	self checkForComments: aFASTJavaCaseStatement andDo: [
			aFASTJavaCaseStatement labels do: [ :label |
					label caseExpressions ifEmpty: [ self indented: 'default' ] ifNotEmpty: [
							self indented: 'case '.
							label caseExpressions do: [ :expression | expression accept: self ] separatedBy: [ self output: ', ' ].
							label isDefault ifTrue: [ self output: ', default' ] ].
					label guard ifNotNil: [ :guard |
							self unindented: ' when '.
							guard accept: self ].
					self
						unindented: ':';
						newLine ].
			self indent.
			aFASTJavaCaseStatement statements do: [ :caseStatement | caseStatement accept: self ].
			self unindent ]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	self checkForComments: aFASTJavaCastExpression andDo: [
		self
			outputExpression: [
				self
					outputExpression: [
						aFASTJavaCastExpression type accept: self.
						aFASTJavaCastExpression additionalBounds do: [ :bound |
							self unindented: ' & '.
							bound accept: self ] ]
					inParentheses: true.
				self space.
				aFASTJavaCastExpression expression accept: self
			]
			withOperator: #cast
	]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [

	self checkForComments: aFASTJavaCatchPartStatement andDo: [ 
		self indented: 'catch ('.
		self visitFASTJavaModifiersInline: aFASTJavaCatchPartStatement modifiers.

		aFASTJavaCatchPartStatement catchedTypes do: [ :catchType | catchType accept: self ]
			separatedBy: [ self unindented: ' | ' ].
		self space.
		aFASTJavaCatchPartStatement parameter accept: self.
		self unindented: ') '.

		aFASTJavaCatchPartStatement body accept: self
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCharTypeExpression: aFASTJavaCharTypeExpression [
	self checkForComments: aFASTJavaCharTypeExpression andDo: [
	self visitFASTJavaModifiersInline: aFASTJavaCharTypeExpression annotations.
	self unindented: 'char'
]

]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCharacterLiteral: aFASTJavaCharacterLiteral [
	self checkForComments: aFASTJavaCharacterLiteral andDo: [
		self unindented: $'.
		self visitFASTJavaLiteral: aFASTJavaCharacterLiteral.
		self unindented: $'
	]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaClassDeclaration: aFASTJavaClassDeclaration [

	self checkForComments: aFASTJavaClassDeclaration andDo: [
		self visitFASTJavaModifiers: aFASTJavaClassDeclaration modifiers.
		self unindented: 'class '.
		self unindented: aFASTJavaClassDeclaration name.

		aFASTJavaClassDeclaration typeParameters ifNotEmpty: [ :typeParameters |
			self unindented: $<.
			self visitNodeListSeparatedByCommas: typeParameters.
			self unindented: $> ].

		aFASTJavaClassDeclaration superclass ifNotNil: [ :superclass |
			self unindented: ' extends '.
			superclass accept: self ].
		aFASTJavaClassDeclaration interfaces ifNotEmpty: [ :interfaces |
			self unindented: ' implements '.
			interfaces
				do: [ :interface | interface accept: self ]
				separatedBy: [ self unindented: ', ' ] ].

		aFASTJavaClassDeclaration permittedSubtypes ifNotEmpty: [ :permittedSubtypes |
			self unindented: ' permits '.
			permittedSubtypes
				do: [ :permitted | permitted accept: self ]
				separatedBy: [ self unindented: ', ' ] ].

		aFASTJavaClassDeclaration declarations
			ifNotNil: [ :declarations | self visitJavaClassMemberDeclarations: declarations ].
		self newLine
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	self checkForComments: aFASTJavaClassProperty andDo: [
	aFASTJavaClassProperty type accept: self.
	self
		<< '.' ;
		<< aFASTJavaClassProperty fieldName
]

]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaClassTypeExpression: aFASTJavaClassTypeExpression [
	self checkForComments: aFASTJavaClassTypeExpression andDo: [
		self visitFASTJavaModifiersInline: aFASTJavaClassTypeExpression annotations.
		aFASTJavaClassTypeExpression typeName accept: self.
		self visitFASTJavaTypeArguments: aFASTJavaClassTypeExpression arguments
	]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaCompilationUnit: aFASTJavaCompilationUnit [

	self checkForComments: aFASTJavaCompilationUnit andDo: [
		aFASTJavaCompilationUnit packageDeclaration ifNotNil: [ :decl |
			self visitFASTJavaPackageDeclaration: decl.
			self newLine ].
		aFASTJavaCompilationUnit importDeclarations ifNotEmpty: [ :decls |
			decls do: [ :decl | self visitFASTJavaImportDeclaration: decl ].
			self newLine ].
		"JLS 7.7: a modular compilation unit declares a module where another unit writes
		the types it declares."
		aFASTJavaCompilationUnit moduleDeclaration ifNotNil: [ :moduleDeclaration |
			^ self visitFASTJavaModuleDeclaration: moduleDeclaration ].
		self declarationsOf: aFASTJavaCompilationUnit do: [ :decl | decl accept: self ] ]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaConditionalExpression: aFASTJavaConditionalExpression [
	self checkForComments: aFASTJavaConditionalExpression andDo: [
		self
			outputExpression: [
				"JLS 15.25: a conditional groups right to left, so one written as the condition of
				another was written between parentheses."
				self
					outputExpression: [ aFASTJavaConditionalExpression condition accept: self ]
					inParentheses: aFASTJavaConditionalExpression condition class = FASTJavaConditionalExpression.
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

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaContinueStatement: aFASTJavaContinueStatement [
	"JLS 14.16: a continue may name the label of the statement it continues; without one
	it continues the innermost loop, so dropping the name moves where control goes."

	self checkForComments: aFASTJavaContinueStatement andDo: [
		self indented: 'continue'.
		aFASTJavaContinueStatement label ifNotNil: [ :label | self unindented: ' ' , label ].
		self endOfStatement ]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaDimension: aFASTJavaDimension [
	"JLS 10.2: a pair of brackets writes the annotations it carries before itself, and
	what comes before them is a name or a type, which needs a space after it."

	self checkForComments: aFASTJavaDimension andDo: [
			aFASTJavaDimension annotations ifNotEmpty: [ self space ].
			self visitFASTJavaModifiersInline: aFASTJavaDimension annotations.
			self unindented: '[]' ]
]

{ #category : 'visiting statement' }
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

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaDoubleLiteral: aFASTJavaDoubleLiteral [
	self checkForComments: aFASTJavaDoubleLiteral andDo: [
		self visitFASTJavaLiteral: aFASTJavaDoubleLiteral
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaDoubleTypeExpression: aFASTJavaDoubleTypeExpression [
	self checkForComments: aFASTJavaDoubleTypeExpression andDo: [
	self visitFASTJavaModifiersInline: aFASTJavaDoubleTypeExpression annotations.
	self unindented: 'double'
]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaElsePartStatement: aFASTJavaStatement [
	self checkForComments: aFASTJavaStatement andDo: [
	aFASTJavaStatement ifNil: [ ^self ].
	self indented: 'else '.
	self visitFASTJavaBlockOrStatement: aFASTJavaStatement
]

]

{ #category : 'visiting' }
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

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaEnumConstant: aFASTJavaEnumConstant [
	"JLS 8.9.1: the only modifier a constant may write is an annotation, and it writes it
	before its name."

	self checkForComments: aFASTJavaEnumConstant andDo: [
		self visitFASTJavaModifiersInline: aFASTJavaEnumConstant annotations.
		self unindented: aFASTJavaEnumConstant name.
		aFASTJavaEnumConstant arguments ifNotEmpty: [ :arguments | self visitFASTJavaArgumentsList: arguments ].
		aFASTJavaEnumConstant declarations ifNotEmpty: [ :declarations | self visitJavaClassMemberDeclarations: declarations ]
	]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaEnumDeclaration: aFASTJavaEnumDeclaration [
	"JLS 8.9: the semicolon after the constants opens the body of the enum, so it is
	written wherever the enum declares members, and where it declares none only where the
	source wrote one. The comma JLS 8.9 allows after the last constant is kept likewise."

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
		aFASTJavaEnumDeclaration hasTrailingComma ifTrue: [ self unindented: $, ].
		(aFASTJavaEnumDeclaration hasBodySemicolon or: [
			 aFASTJavaEnumDeclaration declarations isNotEmpty ]) ifTrue: [ self unindented: $; ].
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

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaExportsDirective: aFASTJavaExportsDirective [
	"JLS 7.7.2: the modules a package is exported to are written after `to`, and nothing
	is written where it is exported to every module."

	self checkForComments: aFASTJavaExportsDirective andDo: [
		self indented: 'exports '.
		self visitFASTJavaQualifiedName: aFASTJavaExportsDirective qualifiedName.
		self visitFASTJavaModuleTargets: aFASTJavaExportsDirective targets.
		self endOfStatement ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaExpressionStatement: aFASTJavaExpressionStatement [

	self checkForComments: aFASTJavaExpressionStatement andDo: [
	  self indented: ''.
	  aFASTJavaExpressionStatement expression accept: self.
	  self endOfStatement
	]
]

{ #category : 'visiting expression' }
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

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaFloatLiteral: aFASTJavaFloatLiteral [
	self checkForComments: aFASTJavaFloatLiteral andDo: [
		self visitFASTJavaLiteral: aFASTJavaFloatLiteral
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaFloatTypeExpression: aFASTJavaFloatTypeExpression [
	self checkForComments: aFASTJavaFloatTypeExpression andDo: [
	self visitFASTJavaModifiersInline: aFASTJavaFloatTypeExpression annotations.
	self unindented: 'float'
]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	self checkForComments: aFASTJavaForEachStatement andDo: [
		self indented: 'for ('.
		self visitFASTJavaModifiersInline: aFASTJavaForEachStatement modifiers.
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

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForStatement: aFASTJavaForStatement [

	self
		checkForComments: aFASTJavaForStatement
		andDo: [
			self indented: 'for ('.

			self visitFASTJavaForStatementInitializers: aFASTJavaForStatement initializers.
			self visitFASTJavaForStatementCondition: aFASTJavaForStatement condition.
			self visitFASTJavaForStatementIncrementors: aFASTJavaForStatement incrementors.

			self unindented: ') '.

			self indent.
			self visitFASTJavaBlockOrStatement: aFASTJavaForStatement body.
			self unindent
		]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForStatementCondition: aFASTJavaForStatementCondition [

	aFASTJavaForStatementCondition
		ifNil: [ self unindented: $; ]
		ifNotNil: [
			aFASTJavaForStatementCondition accept: self.
			self unindented: '; '
		]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForStatementIncrementors: statements [
	"JLS 14.14.1: the last part of the header writes its statements with a comma between
	them, and nothing closes the part."

	statements
		do: [ :statement |
			statement accept: self.
			"a statement prints a semicolon and a new line"
			self goBack: 2 ]
		separatedBy: [ self unindented: ', ' ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaForStatementInitializers: statements [
	"JLS 14.14.1: the first part of the header writes its statements with a comma between
	them, and one semicolon closes the part."

	statements ifEmpty: [ ^ self unindented: $; ].

	statements
		do: [ :statement |
			statement accept: self.
			"a statement prints a semicolon and a new line"
			self goBack: 2 ]
		separatedBy: [ self unindented: ', ' ].

	self unindented: '; '
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	self checkForComments: aFASTJavaIdentifier andDo: [
		self unindented: aFASTJavaIdentifier name
	]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	self checkForComments: aFASTJavaIfStatement andDo: [
	self indented: 'if ('.
	aFASTJavaIfStatement condition accept: self.
	self unindented: ') '.
	self visitFASTJavaThenPartStatement: aFASTJavaIfStatement thenPart.
	self visitFASTJavaElsePartStatement: aFASTJavaIfStatement elsePart
]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaImportDeclaration: aFASTJavaImportDeclaration [
	self checkForComments: aFASTJavaImportDeclaration andDo: [
	self unindented: 'import '.
	aFASTJavaImportDeclaration isStatic ifTrue: [ self unindented: 'static ' ].
	aFASTJavaImportDeclaration isModule ifTrue: [ self unindented: 'module ' ].
	self visitFASTJavaQualifiedName: aFASTJavaImportDeclaration qualifiedName.
	aFASTJavaImportDeclaration isOnDemand ifTrue: [ self unindented: '.*' ].
	self endOfStatement
]

]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [

	| operator |

	operator := self operatorOf: aFASTJavaInfixOperation.

	self checkForComments: aFASTJavaInfixOperation andDo: [
		self
			outputExpression: [
				aFASTJavaInfixOperation leftOperand accept: self.
				(aFASTJavaInfixOperation operator = 'instanceof')
					ifTrue:  [ self space ; unindented: aFASTJavaInfixOperation operator ; space ]
					ifFalse: [ self unindented: aFASTJavaInfixOperation operator].
				self
					outputExpression: [ aFASTJavaInfixOperation rightOperand accept: self ]
					inParentheses: (self isInfixOperation: aFASTJavaInfixOperation rightOperand withPrecedenceOf: operator)
			]
			withOperator: operator
]

]

{ #category : 'generated' }
FASTJavaExportVisitor >> visitFASTJavaInitializer: aFASTJavaInitializer [

	self indented: ''.
	aFASTJavaInitializer isStatic ifTrue: [ self unindented: 'static ' ].
	self visitFASTJavaStatementBlock: aFASTJavaInitializer statementBlock
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaIntTypeExpression: aFASTJavaIntTypeExpression [
	self checkForComments: aFASTJavaIntTypeExpression andDo: [
	self visitFASTJavaModifiersInline: aFASTJavaIntTypeExpression annotations.
	self unindented: 'int'
]

]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaIntegerLiteral: aFASTJavaIntegerLiteral [
	self checkForComments: aFASTJavaIntegerLiteral andDo: [
		self visitFASTJavaLiteral: aFASTJavaIntegerLiteral
	]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaInterfaceDeclaration: aFASTJavaInterfaceDeclaration [

	self checkForComments: aFASTJavaInterfaceDeclaration andDo: [
		self visitFASTJavaModifiers: aFASTJavaInterfaceDeclaration modifiers.
		self unindented: 'interface '.
		self unindented: aFASTJavaInterfaceDeclaration name.

		aFASTJavaInterfaceDeclaration typeParameters ifNotEmpty: [ :typeParameters |
			self unindented: $<.
			self visitNodeListSeparatedByCommas: typeParameters.
			self unindented: $> ].

		aFASTJavaInterfaceDeclaration interfaces ifNotEmpty: [ :interfaces |
			self unindented: ' extends '.
			interfaces
				do: [ :interface | interface accept: self ]
				separatedBy: [ self unindented: ', ' ] ].

		aFASTJavaInterfaceDeclaration permittedSubtypes ifNotEmpty: [ :permittedSubtypes |
			self unindented: ' permits '.
			permittedSubtypes
				do: [ :permitted | permitted accept: self ]
				separatedBy: [ self unindented: ', ' ] ].

		aFASTJavaInterfaceDeclaration declarations
			ifNotNil: [ :declarations | self visitJavaClassMemberDeclarations: declarations ].
		self newLine
	]
]

{ #category : 'visiting statement' }
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

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaLambdaExpression: aFASTJavaLambdaExpression [
	self checkForComments: aFASTJavaLambdaExpression andDo: [
		self unindented: $(.
		self visitNodeListSeparatedByCommas: aFASTJavaLambdaExpression parameters.
		self unindented: ') -> '.
		"JLS 15.27.2: the body of a lambda is an expression of its own."
		self outputTopLevelExpression: [
			aFASTJavaLambdaExpression expression accept: self ]
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaLiteral: aFASTJavaLiteral [
	self unindented: aFASTJavaLiteral primitiveValue
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaLongLiteral: aFASTJavaLongLiteral [
	self checkForComments: aFASTJavaLongLiteral andDo: [
		self visitFASTJavaLiteral: aFASTJavaLongLiteral
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaLongTypeExpression: aFASTJavaLongTypeExpression [
	self checkForComments: aFASTJavaLongTypeExpression andDo: [
	self visitFASTJavaModifiersInline: aFASTJavaLongTypeExpression annotations.
	self unindented: 'long'
]

]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMatchAllPattern: aFASTJavaMatchAllPattern [
	"JLS 14.30.1: a component a record pattern binds nothing to is written `_`."

	self checkForComments: aFASTJavaMatchAllPattern andDo: [ self unindented: '_' ]
]

{ #category : 'visiting' }
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
		"JLS 8.10.4.2: a compact canonical constructor writes no parameter list."
		aFASTJavaMethodEntity isCompactConstructor ifFalse: [
			self visitFASTJavaParametersOf: aFASTJavaMethodEntity ].
		"JLS 8.4: the brackets written after the parameter list are written back there, each
		with the annotations it carries; a bare pair still stands apart from the list."
		aFASTJavaMethodEntity brackets do: [ :bracket |
			bracket annotations ifEmpty: [ self space ].
			bracket accept: self ].
		self space.
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

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	self checkForComments: aFASTJavaMethodInvocation andDo: [
		self
			outputExpression: [
				self visitFASTJavaMethodInvocationReceiver: aFASTJavaMethodInvocation receiver.

				"JLS 15.12: the type arguments an invocation writes come between the receiver
				and the name."
				self visitFASTJavaTypeArguments: aFASTJavaMethodInvocation typeArguments.

				self unindented: aFASTJavaMethodInvocation name.

				self visitFASTJavaArgumentsList: aFASTJavaMethodInvocation arguments
			]
			withOperator: #messageSend
	]

]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocationReceiver: aFASTJavaMethodInvocation [
	self checkForComments: aFASTJavaMethodInvocation andDo: [
		aFASTJavaMethodInvocation ifNil: [ ^ self ].
		aFASTJavaMethodInvocation accept: self.
		self unindented: $.
]

]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodReference: aFASTJavaMethodReference [
	"JLS 15.13: a method reference writes the name it refers to after `::`, `new` for a
	constructor, with the type arguments of that method between the two. A reference on
	`super` is the one form that keeps no receiver."

	self checkForComments: aFASTJavaMethodReference andDo: [
		self
			outputExpression: [
				aFASTJavaMethodReference receiver
					ifNil: [ self unindented: 'super' ]
					ifNotNil: [ :receiver | receiver accept: self ].
				self unindented: '::'.
				self visitFASTJavaTypeArguments: aFASTJavaMethodReference typeArguments.
				self unindented: aFASTJavaMethodReference name ]
			withOperator: #memberAccess ]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaMethodThrows: aFASTJavaThrownExceptionsCollection [
	self checkForComments: aFASTJavaThrownExceptionsCollection andDo: [
	aFASTJavaThrownExceptionsCollection ifEmpty: [ ^self ].
	self unindented: ' throws '.
	self
		visitNodeListSeparatedByCommas: aFASTJavaThrownExceptionsCollection
]

]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaModifier: aFASTJavaModifier [
	self checkForComments: aFASTJavaModifier andDo: [
	self unindented: aFASTJavaModifier token
]

]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaModifiers: aFASTJavaModifierCollection [
	"JLS 8.1.1, 8.3.1 and 8.4.3: the modifiers of a type or a member are annotations and
	keywords in whatever order the declaration writes them, so write them in that order.
	The annotations a declaration begins with go on lines of their own, which is how a type
	and a method are written; from the first keyword on, everything stays on the line the
	declaration begins, where the source writes it."

	| keywordWritten |
	keywordWritten := false.
	self checkForComments: aFASTJavaModifierCollection andDo: [
		aFASTJavaModifierCollection do: [ :modifier |
			modifier accept: self.
			(modifier isAnnotation and: [ keywordWritten not ])
				ifTrue: [
					self newLine.
					self indented: '' ]
				ifFalse: [
					self space.
					keywordWritten := true ] ] ]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaModifiersInline: aFASTJavaModifierCollection [
	"Write the modifiers in the order they are held, on the line the declaration is written
	on. A type or a method writes its annotations on lines of their own, which is what
	visitFASTJavaModifiers: does; a declaration small enough to be written on one line
	keeps its modifiers there."

	aFASTJavaModifierCollection do: [ :modifier |
		modifier accept: self.
		self space ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaModuleDeclaration: aFASTJavaModuleDeclaration [
	"JLS 7.7: a module writes the annotations it carries, then `open` where it opens every
	package it holds, then its name and the directives it writes."

	self checkForComments: aFASTJavaModuleDeclaration andDo: [
		self indented: ''.
		self visitFASTJavaModifiers: aFASTJavaModuleDeclaration annotations.
		aFASTJavaModuleDeclaration isOpen ifTrue: [ self unindented: 'open ' ].
		self unindented: 'module '.
		self visitFASTJavaQualifiedName: aFASTJavaModuleDeclaration qualifiedName.
		self
			unindented: ' {' ;
			newLine ;
			indent.
		aFASTJavaModuleDeclaration directives do: [ :directive | directive accept: self ].
		self
			unindent ;
			indented: $} ;
			newLine ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaModuleTargets: aFASTJavaQualifiedNameCollection [
	"JLS 7.7.2: `exports` and `opens` name after `to` the modules they are addressed to,
	and write no `to` at all where they address every module."

	aFASTJavaQualifiedNameCollection ifEmpty: [ ^ self ].
	self unindented: ' to '.
	self visitNodeListSeparatedByCommas: aFASTJavaQualifiedNameCollection
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNewArray: aFASTJavaNewArray [

	self checkForComments: aFASTJavaNewArray andDo: [
		self unindented: 'new '.
		aFASTJavaNewArray type accept: self.
		"JLS 15.10.1: each dimension expression is an expression of its own."
		aFASTJavaNewArray arguments do: [ :arg |
			self unindented: $[.
			self outputTopLevelExpression: [ arg accept: self ].
			self unindented: $].
		].

		aFASTJavaNewArray initializer
		ifNotNil: [ :init |
			self unindented: ' '.
			init accept: self
		]
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression [
	self checkForComments: aFASTJavaNewClassExpression andDo: [
		"JLS 15.9: an inner class may be instantiated through an instance of the class
		enclosing it, as `outer.new Inner() { }` does, the qualifier being that instance. It
		is a primary, so a cast written there was written between parentheses."
		aFASTJavaNewClassExpression receiver ifNotNil: [ :receiver |
			self
				outputExpression: [
					receiver accept: self.
					self unindented: '.' ]
				withOperator: #memberAccess
		].
		self unindented: 'new '.
		"JLS 15.9: the type arguments of the constructor called come between `new` and the
		type instantiated."
		self visitFASTJavaTypeArguments: aFASTJavaNewClassExpression typeArguments.
		aFASTJavaNewClassExpression type accept: self.
		aFASTJavaNewClassExpression isDiamond ifTrue: [ self unindented: '<>' ].
		self visitFASTJavaArgumentsList: aFASTJavaNewClassExpression arguments.

		self visitJavaClassMemberDeclarations: aFASTJavaNewClassExpression declarations
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	self checkForComments: aFASTJavaNewExpression andDo: [
		"JLS 15.9: a qualified creation reads its enclosing instance from a primary, so a cast
		written there was written between parentheses."
		aFASTJavaNewExpression receiver ifNotNil: [ :receiver |
			self
				outputExpression: [
					receiver accept: self.
					self unindented: '.' ]
				withOperator: #memberAccess
		].
		self unindented: 'new '.
		"JLS 15.9: the type arguments of the constructor called come between `new` and the
		type instantiated."
		self visitFASTJavaTypeArguments: aFASTJavaNewExpression typeArguments.
		aFASTJavaNewExpression type accept: self.
		aFASTJavaNewExpression isDiamond ifTrue: [ self unindented: '<>' ].
		self visitFASTJavaArgumentsList: aFASTJavaNewExpression arguments
	]

]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	self checkForComments: aFASTJavaNullLiteral andDo: [
		self unindented: 'null'
	]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaOpensDirective: aFASTJavaOpensDirective [
	"JLS 7.7.2: the modules a package is opened to are written after `to`, and nothing is
	written where it is opened to every module."

	self checkForComments: aFASTJavaOpensDirective andDo: [
		self indented: 'opens '.
		self visitFASTJavaQualifiedName: aFASTJavaOpensDirective qualifiedName.
		self visitFASTJavaModuleTargets: aFASTJavaOpensDirective targets.
		self endOfStatement ]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaOuterThis: aFASTJavaOuterThis [
	self checkForComments: aFASTJavaOuterThis andDo: [
		aFASTJavaOuterThis type accept: self.
		self unindented: '.this'
	]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaPackageDeclaration: aFASTJavaPackageDeclaration [
	self checkForComments: aFASTJavaPackageDeclaration andDo: [
		"JLS 7.4.1: the annotations a package declaration writes go before `package`, each
		on a line of its own, which is how package-info.java is written."
		self visitFASTJavaModifiers: aFASTJavaPackageDeclaration annotations.
		self unindented: 'package '.
		self visitFASTJavaQualifiedName: aFASTJavaPackageDeclaration qualifiedName.
		self endOfStatement ]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	self checkForComments: aFASTJavaParameter andDo: [
		"JLS 8.4.1: the modifiers a parameter writes come before its type."
		self visitFASTJavaModifiersInline: aFASTJavaParameter modifiers.
		aFASTJavaParameter type 
			ifNotNil: [ :parameterType |
				"Lambda parameters may be typeless"
				parameterType accept: self.
				aFASTJavaParameter hasVariableArguments ifTrue: [
					"JLS 8.4.1: the annotations written on the ellipsis stand between the
					type and it, the dimension it adds being what they are written on."
					aFASTJavaParameter variableArguments ifNotNil: [ :ellipsis |
						ellipsis annotations ifNotEmpty: [ :annotations |
							self space.
							self visitFASTJavaModifiersInline: annotations ] ].
					self unindented: '...'
				].
				self space
			].
		aFASTJavaParameter variable accept: self.
		"JLS 10.2: the brackets written after a name are written back there, each with the
		annotations it carries."
		aFASTJavaParameter brackets do: [ :bracket | bracket accept: self ]
	]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaParameters: aFASTJavaParameterCollection [
	self checkForComments: aFASTJavaParameterCollection andDo: [
		self unindented: $(.
		self visitNodeListSeparatedByCommas: aFASTJavaParameterCollection.
		self unindented: ') '
	]

]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaParametersOf: aFASTJavaMethodEntity [
	"JLS 8.4.1: the receiver parameter is written first, before the parameters the method
	declares, and a comma stands between it and them. What follows the list is written by
	my sender, which knows whether a space belongs before it."

	self unindented: $(.
	aFASTJavaMethodEntity receiver ifNotNil: [ :receiver |
			receiver accept: self.
			aFASTJavaMethodEntity parameters ifNotEmpty: [ self unindented: ', ' ] ].
	self visitNodeListSeparatedByCommas: aFASTJavaMethodEntity parameters.
	self unindented: $)
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaPostfixedUnaryExpression: aFASTJavaUnaryExpression [

	self
		outputExpression: [
			aFASTJavaUnaryExpression expression accept: self.
			self unindented: aFASTJavaUnaryExpression operator.
			aFASTJavaUnaryExpression infixOperationLeftOperandOwner ifNotNil: [
				self space ] ]
		withOperator: 'unary' , aFASTJavaUnaryExpression operator
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaPrefixedUnaryExpression: aFASTJavaUnaryExpression [
	"A space keeps the operator apart from what was written before it, where the two would
	otherwise be read as one. The operand of an infix operation is spaced whatever the
	operator is, as `x + ++a` must be; an operand of another prefix operation is spaced
	only where it would merge, so `-(-y)` comes back as `- -y` and not as `--y`."

	self
		outputExpression: [
			(aFASTJavaUnaryExpression infixOperationRightOperandOwner isNotNil or: [
				 self mergesWithLastWritten: aFASTJavaUnaryExpression operator ])
				ifTrue: [ self space ].
			self unindented: aFASTJavaUnaryExpression operator.
			aFASTJavaUnaryExpression expression accept: self ]
		withOperator: aFASTJavaUnaryExpression operator , 'unary'
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaProvidesDirective: aFASTJavaProvidesDirective [
	"JLS 7.7.4: the classes implementing the service are written after `with`, and at
	least one of them always is."

	self checkForComments: aFASTJavaProvidesDirective andDo: [
		self indented: 'provides '.
		self visitFASTJavaQualifiedName: aFASTJavaProvidesDirective qualifiedName.
		self unindented: ' with '.
		self visitNodeListSeparatedByCommas: aFASTJavaProvidesDirective implementations.
		self endOfStatement ]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaQualifiedName: aFASTJavaQualifiedName [
	self checkForComments: aFASTJavaQualifiedName andDo: [
	self unindented: aFASTJavaQualifiedName fullName
]

]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaQualifiedTypeName: aFASTJavaQualifiedTypeName [
	"JLS 4.3 and 4.11: a qualified type writes the name that qualifies it, a dot, then its
	own annotations, its own name, and the type arguments that name writes."

	aFASTJavaQualifiedTypeName namespace accept: self.
	self unindented: $. .
	self visitFASTJavaModifiersInline: aFASTJavaQualifiedTypeName annotations.
	self unindented: aFASTJavaQualifiedTypeName name.
	self visitFASTJavaTypeArguments: aFASTJavaQualifiedTypeName arguments
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaReceiverParameter: aFASTJavaReceiverParameter [
	"JLS 8.4.1: a receiver parameter writes its annotations, the type of the instance the
	method is called on, and `this`, qualified by a name where a constructor writes it."

	self checkForComments: aFASTJavaReceiverParameter andDo: [
			self visitFASTJavaModifiersInline: aFASTJavaReceiverParameter annotations.
			aFASTJavaReceiverParameter type accept: self.
			self space.
			aFASTJavaReceiverParameter qualifier ifNotNil: [ :qualifier |
					self
						unindented: qualifier;
						unindented: '.' ].
			self unindented: 'this' ]
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaRecordDeclaration: aFASTJavaRecordDeclaration [

	self checkForComments: aFASTJavaRecordDeclaration andDo: [
			self visitFASTJavaModifiers: aFASTJavaRecordDeclaration modifiers.
			self unindented: 'record '.
			self unindented: aFASTJavaRecordDeclaration name.

			aFASTJavaRecordDeclaration typeParameters ifNotEmpty: [ :typeParameters |
					self unindented: $<.
					self visitNodeListSeparatedByCommas: typeParameters.
					self unindented: $> ].

			self unindented: $(.
			self visitNodeListSeparatedByCommas: aFASTJavaRecordDeclaration components.
			self unindented: $).

			aFASTJavaRecordDeclaration interfaces ifNotEmpty: [ :interfaces |
					self unindented: ' implements '.
					interfaces do: [ :interface | interface accept: self ] separatedBy: [ self unindented: ', ' ] ].

			aFASTJavaRecordDeclaration declarations ifNotNil: [ :declarations | self visitJavaClassMemberDeclarations: declarations ].
			self newLine ]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaRecordPattern: aFASTJavaRecordPattern [
	"JLS 14.30.1: a record pattern writes the record type it matches, then between
	parentheses the patterns its components are matched against."

	self checkForComments: aFASTJavaRecordPattern andDo: [
			aFASTJavaRecordPattern type accept: self.
			self unindented: $(.
			self visitNodeListSeparatedByCommas: aFASTJavaRecordPattern patterns.
			self unindented: $) ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaRequiresDirective: aFASTJavaRequiresDirective [
	"JLS 7.7.1: `static` and `transitive` are written between `requires` and the name of
	the module required, in that order."

	self checkForComments: aFASTJavaRequiresDirective andDo: [
		self indented: 'requires '.
		aFASTJavaRequiresDirective isStatic ifTrue: [ self unindented: 'static ' ].
		aFASTJavaRequiresDirective isTransitive ifTrue: [ self unindented: 'transitive ' ].
		self visitFASTJavaQualifiedName: aFASTJavaRequiresDirective qualifiedName.
		self endOfStatement ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaReturnStatement: aFASTJavaReturnStatement [
	self indented: 'return '.
	aFASTJavaReturnStatement expression
		ifNotNil: [ :returnedExpression | returnedExpression accept: self ].
	self endOfStatement
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaShortTypeExpression: aFASTJavaShortTypeExpression [
	self checkForComments: aFASTJavaShortTypeExpression andDo: [
	self visitFASTJavaModifiersInline: aFASTJavaShortTypeExpression annotations.
	self unindented: 'short'
]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaStatement: aFASTJavaStatement [
	"empty statement ?"

	self checkForComments: aFASTJavaStatement andDo: [
		self indented: ''.
		self endOfStatement
]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaStatementBlock: aFASTJavaStatementBlock [
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

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	self checkForComments: aFASTJavaStringLiteral andDo: [
		self unindented: $".
		self visitFASTJavaLiteral: aFASTJavaStringLiteral.
		self unindented: $"
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaSwitchExpression: aFASTJavaSwitchExpression [
	"JLS 15.15: a switch expression is a unary expression and not a primary, so one written
	where a primary stands, as the receiver of an invocation, was written between parentheses."

	self
		outputExpression: [
			self outputTopLevelExpression: [
				self output: 'switch ('.
				aFASTJavaSwitchExpression condition accept: self.
				self
					output: ') {';
					newLine;
					indent.

				"A switch block is in colon form or in arrow form, so one of these is empty."
				aFASTJavaSwitchExpression cases do: [ :switchCase | switchCase accept: self ].
				aFASTJavaSwitchExpression rules do: [ :rule | rule accept: self ].

				self
					unindent;
					indented: $} ] ]
		withOperator: #switch
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaSwitchRule: aFASTJavaSwitchRule [

	self indented: ''.
	aFASTJavaSwitchRule label caseExpressions ifEmpty: [ self output: 'default' ] ifNotEmpty: [ :caseExpressions |
			self output: 'case '.
			caseExpressions do: [ :expression | expression accept: self ] separatedBy: [ self output: ', ' ].
			aFASTJavaSwitchRule label isDefault ifTrue: [ self output: ', default' ] ].
	aFASTJavaSwitchRule label guard ifNotNil: [ :guard |
			self output: ' when '.
			guard accept: self ].
	self output: ' -> '.
	aFASTJavaSwitchRule body accept: self.
	aFASTJavaSwitchRule body isExpression ifTrue: [ self endOfStatement ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaSwitchStatement: aFASTJavaSwitchStatement [

	self checkForComments: aFASTJavaSwitchStatement andDo: [
			self indented: 'switch ('.
			aFASTJavaSwitchStatement condition accept: self.
			self
				unindented: ') {';
				newLine;
				indent.

			"A switch block is in colon form or in arrow form, so one of these is empty."
			aFASTJavaSwitchStatement cases do: [ :switchCase | switchCase accept: self ].
			aFASTJavaSwitchStatement rules do: [ :rule | rule accept: self ].

			self
				unindent;
				indented: $};
				newLine ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaSynchronizedStatement: aFASTJavaSynchronizedStatement [

	self checkForComments: aFASTJavaSynchronizedStatement andDo: [
		self indented: 'synchronized('.
		aFASTJavaSynchronizedStatement expression accept: self.
		self unindented: ') '.
		aFASTJavaSynchronizedStatement block accept: self.
	]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaThenPartStatement: aFASTJavaStatement [
	self checkForComments: aFASTJavaStatement andDo: [
		self visitFASTJavaBlockOrStatement: aFASTJavaStatement
]

]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaThrowStatement: aFASTJavaThrowStatement [

	self checkForComments: aFASTJavaThrowStatement andDo: [
		self indented: 'throw '.
		aFASTJavaThrowStatement expression accept: self.
		self endOfStatement
	]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	self checkForComments: aFASTJavaTryCatchStatement andDo: [
		self indented: 'try '.

		aFASTJavaTryCatchStatement resources
			ifNotEmpty: [ :tryResources |
				self
					visitTryResources: tryResources
					trailingSemicolon: aFASTJavaTryCatchStatement hasTrailingSemicolon ].

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

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitFASTJavaTypeArguments: aFASTJavaTypeArgumentCollection [
	"Write type arguments between angle brackets, and nothing at all where there are none.
	A type writes them after the name they apply to, as `Map<K, V>` and the `ArrayList<E>`
	of `ArrayList<E>.ArrayListSpliterator` do."

	aFASTJavaTypeArgumentCollection ifEmpty: [ ^ self ].
	self unindented: $<.
	self visitNodeListSeparatedByCommas: aFASTJavaTypeArgumentCollection.
	self unindented: $>
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaTypeName: aFASTJavaTypeName [
	self checkForComments: aFASTJavaTypeName andDo: [
		self unindented: aFASTJavaTypeName name.
		self visitFASTJavaTypeArguments: aFASTJavaTypeName arguments ]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaTypeParameter: aFASTJavaTypeParameterExpression [
	"JLS 4.4: a type parameter writes the annotations it declares before its name."

	self checkForComments: aFASTJavaTypeParameterExpression andDo: [
		self visitFASTJavaModifiersInline: aFASTJavaTypeParameterExpression annotations.
		self unindented: aFASTJavaTypeParameterExpression name.
		aFASTJavaTypeParameterExpression types ifNotEmpty: [ :typeArgumentSuperclasses |
			self unindented: ' extends '.
			typeArgumentSuperclasses
				do: [ :node | node accept: self ]
				separatedBy: [ self << ' & ' ]
		].
		aFASTJavaTypeParameterExpression superType ifNotNil: [ :lowerBound |
			self unindented: ' super '.
			lowerBound accept: self
		]
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaTypePattern: aFASTJavaTypePattern [
	"JLS 14.30.1: a type pattern writes the modifiers it declares its variable with, then
	the type it matches, then the variable itself."

	self checkForComments: aFASTJavaTypePattern andDo: [
			self visitFASTJavaModifiersInline: aFASTJavaTypePattern modifiers.
			aFASTJavaTypePattern type accept: self.
			self space.
			aFASTJavaTypePattern variable accept: self ]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaUnaryExpression: aFASTJavaUnaryExpression [
	"exports '++a' or 'a++'
	 if '++a' has a infixOperationRightOperandOwner (resp. 'a++' has a infixOperationLeftOperandOwner)
	 it could be in an addition 'x + ++a' to avoidhaving 'x+++a', we add an extra space."

	self checkForComments: aFASTJavaUnaryExpression andDo: [
		aFASTJavaUnaryExpression isPrefixedUnaryExpression
			ifTrue: [
				self visitFASTJavaPrefixedUnaryExpression:
					aFASTJavaUnaryExpression ]
			ifFalse: [
				self visitFASTJavaPostfixedUnaryExpression:
					aFASTJavaUnaryExpression ] ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaUsesDirective: aFASTJavaUsesDirective [
	"JLS 7.7.3: `uses` writes the name of the service and nothing else."

	self checkForComments: aFASTJavaUsesDirective andDo: [
		self indented: 'uses '.
		self visitFASTJavaQualifiedName: aFASTJavaUsesDirective qualifiedName.
		self endOfStatement ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	self checkForComments: aFASTJavaVarDeclStatement andDo: [
		self indented: ''.
		self visitFASTJavaModifiersInline: aFASTJavaVarDeclStatement modifiers.
		aFASTJavaVarDeclStatement type accept: self.
		self space.
		self visitNodeListSeparatedByCommas: aFASTJavaVarDeclStatement declarators.
		self endOfStatement
	]

]

{ #category : 'visiting type' }
FASTJavaExportVisitor >> visitFASTJavaVarTypeExpression: aFASTJavaVarTypeExpression [

	self checkForComments: aFASTJavaVarTypeExpression andDo: [ self unindented: 'var' ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	self checkForComments: aFASTJavaVariableDeclarator andDo: [
		aFASTJavaVariableDeclarator variable accept: self.
		"JLS 10.2: the brackets written after a name are written back there, each with the
		annotations it carries."
		aFASTJavaVariableDeclarator brackets do: [ :bracket | bracket accept: self ].
		aFASTJavaVariableDeclarator expression ifNil: [ ^ self ].
		self unindented: ' = '.
		aFASTJavaVariableDeclarator expression accept: self
	]
]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	self checkForComments: aFASTJavaVariableExpression andDo: [
	self unindented: aFASTJavaVariableExpression name
]

]

{ #category : 'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaVoidTypeExpression: aFASTJavaBooleanTypeExpression [
	self checkForComments: aFASTJavaBooleanTypeExpression andDo: [
	self unindented: 'void'
]

]

{ #category : 'visiting statement' }
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

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaYieldStatement: aFASTJavaYieldStatement [

	self indented: 'yield '.
	aFASTJavaYieldStatement expression accept: self.
	self endOfStatement
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitJavaClassMemberDeclarations: classDeclarationsList [

	self unindented: ' {'.
	self newLine.

	self indent.
	classDeclarationsList do: [ :declaration |
		declaration accept: self ].
	self unindented: $}.

	^ self unindent
]

{ #category : 'visiting' }
FASTJavaExportVisitor >> visitNodeListSeparatedByCommas: aCollection [
	aCollection
		do: [ :node | node accept: self ]
		separatedBy: [ self unindented: ', ' ]
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitTryResources: tryResources [
	"Write the resources with no semicolon after the last, which is how a model that does
	not say otherwise writes them."

	self visitTryResources: tryResources trailingSemicolon: false
]

{ #category : 'visiting statement' }
FASTJavaExportVisitor >> visitTryResources: tryResources trailingSemicolon: aBoolean [
	"A resource is either a declaration or an expression referring to an existing variable.
	Declarations are statements: #visitFASTJavaVarDeclStatement: ends them with a semicolon
	and a newline, which are removed here so that all resources are printed uniformly.
	JLS 14.20.3 allows a semicolon after the last resource, which aBoolean says was written."

	| tmpIndent |
	tmpIndent := self indentLevel.
	indentLevel := 0.

	self unindented: '('.

	tryResources
		do: [ :aResource |
				aResource accept: self.
				aResource isVarDeclStatement ifTrue: [ self goBack: 2 ] ]
		separatedBy: [ self unindented: '; ' ].

	aBoolean ifTrue: [ self unindented: $; ].

	self unindented: ') '.

	indentLevel := tmpIndent
]
