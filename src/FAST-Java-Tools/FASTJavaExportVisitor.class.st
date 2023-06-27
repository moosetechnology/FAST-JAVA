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
		'indent'
	],
	#category : #'FAST-Java-Tools-export'
}

{ #category : #outputting }
FASTJavaExportVisitor >> endOfLine [
	stream cr
]

{ #category : #outputting }
FASTJavaExportVisitor >> endOfStatement [
	self noIndent: $;.
	self endOfLine
]

{ #category : #api }
FASTJavaExportVisitor >> export: aFASTNode [
	^String streamContents: [ :st |
		stream := st.
		indent := 0.
		self accept: aFASTNode.
	]
]

{ #category : #outputting }
FASTJavaExportVisitor >> indent [
	indent := indent + 1
]

{ #category : #outputting }
FASTJavaExportVisitor >> indentPrefix [
	^(String new: (indent * 2))
		atAllPut: Character space
]

{ #category : #outputting }
FASTJavaExportVisitor >> noIndent: aPrintable [
	stream << aPrintable
]

{ #category : #outputting }
FASTJavaExportVisitor >> space [
	stream space
]

{ #category : #outputting }
FASTJavaExportVisitor >> unindent [
	indent := indent - 1
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaAnnotation: aFASTJavaAnnotation [
	self noIndent: $@.
	aFASTJavaAnnotation expression accept: self
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaAssignmentExpression: aFASTJavaAssignmentExpression [
	aFASTJavaAssignmentExpression variable accept: self.
	self noIndent: ' = '.
	aFASTJavaAssignmentExpression expression accept: self
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaBooleanTypeExpression: aFASTJavaBooleanTypeExpression [
	self noIndent: 'boolean'
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaByteTypeExpression: aFASTJavaByteTypeExpression [
	self noIndent: 'byte'
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	self noIndent: $(.
	aFASTJavaCastExpression type accept: self.
	self noIndent: $).
	aFASTJavaCastExpression expression accept: self
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaCharTypeExpression: aFASTJavaCharTypeExpression [
	self noIndent: 'char'
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCharacterLiteral: aFASTJavaCharacterLiteral [
	self noIndent: $'.
	self noIndent: aFASTJavaCharacterLiteral primitiveValue.
	self noIndent: $'
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaClassDeclaration: aFASTJavaClassDeclaration [
	self visitFASTJavaModifiers: aFASTJavaClassDeclaration modifiers.
	self noIndent: 'class '.
	self noIndent: aFASTJavaClassDeclaration name.
	aFASTJavaClassDeclaration superclass ifNotNil: [ :superclass | 
		self noIndent: ' extends '.
		self noIndent: superclass name ].
	aFASTJavaClassDeclaration interfaces ifNotEmpty: [ :interfaces | 
		self noIndent: ' implements '.
		interfaces
			do: [ :interface | self noIndent: interface name ]
			separatedBy: [ self noIndent: ', ' ] ].
	self noIndent: ' {'.
	self endOfLine.
	self indent.
	aFASTJavaClassDeclaration declarations do: [ :declaration | 
		declaration accept: self ].
	self noIndent: $}.
	self endOfLine.
	self unindent
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	aFASTJavaClassProperty type accept: self.
	stream << $. << aFASTJavaClassProperty fieldName
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaCompilationUnit: aFASTJavaCompilationUnit [
	aFASTJavaCompilationUnit packageDeclaration ifNotNil: [ :decl | 
		self visitFASTJavaPackageDeclaration: decl.
		self endOfLine ].
	aFASTJavaCompilationUnit importDeclarations ifNotEmpty: [ :decls | 
		decls do: [ :decl | self visitFASTJavaImportDeclaration: decl ].
		self endOfLine ].
	aFASTJavaCompilationUnit interfaceDeclarations do: [ :decl | 
		self visitFASTJavaInterfaceDeclaration: decl ].
	aFASTJavaCompilationUnit classDeclarations do: [ :decl | 
		self visitFASTJavaClassDeclaration: decl ]
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaDoubleTypeExpression: aFASTJavaDoubleTypeExpression [
	self noIndent: 'double'
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaElsePartStatement: aFASTJavaStatement [
	aFASTJavaStatement ifNil: [ ^self ].
	self withIndent: 'else '.
	self visitFASTJavaIfPartStatement: aFASTJavaStatement
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaFloatLiteral: aFASTJavaFloatLiteral [
	self noIndent: aFASTJavaFloatLiteral primitiveValue.
	self noIndent: 'f'
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaFloatTypeExpression: aFASTJavaFloatTypeExpression [
	self noIndent: 'float'
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	self noIndent: aFASTJavaIdentifier name
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaIfPartStatement: aFASTJavaStatement [
	"for 'then' and 'else' parts of the if-statement,
	if it's a simple statement (not a block), go to next line and indent
	Not very elegant solution but simple"
	(aFASTJavaStatement isKindOf: FASTJavaStatementBlock)
	ifFalse: [ self endOfLine. self withIndent: '' ].

	aFASTJavaStatement accept: self

]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	self noIndent: 'if ('.
	aFASTJavaIfStatement condition accept: self.
	self noIndent: ') '.
	self visitFASTJavaThenPartStatement: aFASTJavaIfStatement thenPart.
	self visitFASTJavaElsePartStatement: aFASTJavaIfStatement elsePart
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaImportDeclaration: aFASTJavaImportDeclaration [
	self noIndent: 'import '.
	aFASTJavaImportDeclaration isStatic ifTrue: [ self noIndent: 'static ' ].
	self visitFASTJavaQualifiedName: aFASTJavaImportDeclaration qualifiedName.
	aFASTJavaImportDeclaration isOnDemand ifTrue: [ self noIndent: '.*' ].
	self endOfStatement
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	aFASTJavaInfixOperation leftOperand accept: self.
	self noIndent: aFASTJavaInfixOperation operator.
	aFASTJavaInfixOperation rightOperand accept: self
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaIntTypeExpression: aFASTJavaIntTypeExpression [
	self noIndent: 'int'
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaLongLiteral: aFASTJavaLongLiteral [
	self noIndent: aFASTJavaLongLiteral primitiveValue.
	self noIndent: 'L'
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaLongTypeExpression: aFASTJavaLongTypeExpression [
	self noIndent: 'long'
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	self withIndent: ''.
	self visitFASTJavaModifiers: aFASTJavaMethodEntity modifiers.
	aFASTJavaMethodEntity type ifNotNil: [ "not constructor"
		aFASTJavaMethodEntity type accept: self.
		self space ].
	self noIndent: aFASTJavaMethodEntity name.
	self visitFASTJavaParameters: aFASTJavaMethodEntity parameters.
	self visitFASTJavaMethodThrows: aFASTJavaMethodEntity throws.
	"missing a #visitFASTJavaStatementBlock: in FASTJavaVisitor"
	"self visitFASTJavaStatementBlock: "
	aFASTJavaMethodEntity statementBlock accept: self
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	self visitFASTJavaMethodInvocationReceiver: aFASTJavaMethodInvocation receiver.
	self noIndent: aFASTJavaMethodInvocation name.
	self visitFASTJavaMethodInvocationArguments: aFASTJavaMethodInvocation arguments
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocationArguments: aFASTJavaMethodInvocationArguments [
	self noIndent: $(.
	self
		visitNodeList: aFASTJavaMethodInvocationArguments
		separatedBy: [ self noIndent: ', ' ].
	self noIndent: $)
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocationReceiver: aFASTJavaMethodInvocation [
	aFASTJavaMethodInvocation ifNil: [ ^ self ].
	aFASTJavaMethodInvocation accept: self.
	self noIndent: $.
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaMethodThrows: aFASTJavaThrownExceptionsCollection [
	aFASTJavaThrownExceptionsCollection ifEmpty: [ ^self ].
	self noIndent: ' throws '.
	self
		visitNodeList: aFASTJavaThrownExceptionsCollection
		separatedBy: [ self noIndent: ', ' ]

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaModifier: aFASTJavaModifier [
	self noIndent: aFASTJavaModifier token
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaModifiers: aFASTJavaModifierCollection [
	aFASTJavaModifierCollection
		select: [ :modifier | modifier isKindOf: FASTJavaAnnotation ]
		thenDo: [ :aFASTJavaAnnotation | 
			self visitFASTJavaAnnotation: aFASTJavaAnnotation.
			self endOfLine.
			self withIndent: '' ].
	aFASTJavaModifierCollection
		select: [ :modifier | modifier isKindOf: FASTJavaModifier ]
		thenDo: [ :aFASTJavaModifier | 
			self visitFASTJavaModifier: aFASTJavaModifier.
			self space ]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	self noIndent: 'new '.
	aFASTJavaNewExpression type accept: self.
	self visitFASTJavaMethodInvocationArguments: aFASTJavaNewExpression arguments
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	self noIndent: 'null'
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaPackageDeclaration: aFASTJavaPackageDeclaration [
	self noIndent: 'package '.
	self visitFASTJavaQualifiedName: aFASTJavaPackageDeclaration qualifiedName.
	self endOfStatement
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	aFASTJavaParameter type accept: self.
	self space.
	aFASTJavaParameter variable accept: self
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaParameters: aFASTJavaParameterCollection [
	self noIndent: $(.
	self
		visitNodeList: aFASTJavaParameterCollection
		separatedBy: [ self noIndent: ', ' ].
	self noIndent: ') '
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaQualifiedName: aFASTJavaQualifiedName [
	self noIndent: aFASTJavaQualifiedName fullName
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaShortTypeExpression: aFASTJavaShortTypeExpression [
	self noIndent: 'short'
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	self noIndent: $".
	self noIndent: aFASTJavaStringLiteral primitiveValue.
	self noIndent: $"
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaThenPartStatement: aFASTJavaStatement [
	self visitFASTJavaIfPartStatement: aFASTJavaStatement
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaTypeName: aFASTJavaTypeName [
	self noIndent: aFASTJavaTypeName name
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaUnaryExpression: aFASTJavaUnaryExpression [

	aFASTJavaUnaryExpression isPrefixedUnaryExpression
		ifTrue: [ 
			self noIndent: aFASTJavaUnaryExpression operator.
			self visitFASTTExpression: aFASTJavaUnaryExpression ]
		ifFalse: [ 
			self visitFASTTExpression: aFASTJavaUnaryExpression.
			self noIndent: aFASTJavaUnaryExpression operator ]
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	aFASTJavaVarDeclStatement type accept: self.
	self space.
	self
		visitNodeList: aFASTJavaVarDeclStatement declarators
		separatedBy: [ self noIndent: ', ' ].
	self endOfStatement
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	aFASTJavaVariableDeclarator variable accept: self.
	aFASTJavaVariableDeclarator expression ifNil: [ ^ self ].
	self noIndent: ' = '.
	aFASTJavaVariableDeclarator expression accept: self
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	self noIndent: aFASTJavaVariableExpression name
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaVoidTypeExpression: aFASTJavaBooleanTypeExpression [
	self noIndent: 'void'
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTTExpressionStatement: aFASTTExpressionStatement [
	aFASTTExpressionStatement expression accept: self.
	self endOfStatement
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTTLiteral: aFASTTLiteral [
	self noIndent: aFASTTLiteral primitiveValue
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTTReturnStatement: aFASTTReturnStatement [
	self noIndent: 'return '.
	aFASTTReturnStatement expression accept: self.
	self endOfStatement
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	self noIndent: ${.
	self endOfLine.
	self indent.
	aFASTJavaStatementBlock statements do: [ :node |
		self withIndent: ''.
		node accept: self
	].
	self unindent.
	self withIndent: $}.
	self endOfLine
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitNodeList: aCollection separatedBy: separationBlock [
	aCollection
		do: [ :node | node accept: self ]
		separatedBy: separationBlock
]

{ #category : #outputting }
FASTJavaExportVisitor >> withIndent: aPrintable [
	self noIndent: self indentPrefix.
	self noIndent: aPrintable
]
