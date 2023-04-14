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
	self noIndent: $; .
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
	aFASTJavaAnnotation expression accept: self.
	self endOfLine
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
	aFASTJavaAssignementExpression variable accept: self.
	self noIndent: ' = '.
	aFASTJavaAssignementExpression expression accept: self
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaBooleanTypeExpression: aFASTJavaBooleanTypeExpression [
	self noIndent: 'boolean'
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	self noIndent: $(.
	aFASTJavaCastExpression type accept: self.
	self noIndent: $).
	aFASTJavaCastExpression expression accept: self.

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	aFASTJavaClassProperty type accept: self.
	stream << $. << aFASTJavaClassProperty fieldName
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaElsePartStatement: aFASTJavaStatement [
	aFASTJavaStatement ifNil: [ ^self ].
	self withIndent: 'else '.
	self visitFASTJavaIfPartStatement: aFASTJavaStatement
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
	self visitFASTJavaElsePartStatement: aFASTJavaIfStatement elsePart.
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	aFASTJavaInfixOperation leftOperand accept: self.
	self noIndent: aFASTJavaInfixOperation operator.
	aFASTJavaInfixOperation rightOperand accept: self.
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaIntTypeExpression: aFASTJavaIntTypeExpression [
	self noIndent: 'int'
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	self withIndent: ''.
	self visitFASTJavaModifiers: aFASTJavaMethodEntity modifiers.
	aFASTJavaMethodEntity type accept: self.
	self space.
	self noIndent: aFASTJavaMethodEntity name.
	self visitFASTJavaParameters: aFASTJavaMethodEntity parameters.
	self visitFASTJavaMethodThrows: aFASTJavaMethodEntity throws.
	"missing a #visitFASTJavaStatementBlock: in FASTJavaVisitor"
	"self visitFASTJavaStatementBlock: "aFASTJavaMethodEntity statementBlock accept: self.
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	self visitFASTJavaMethodInvocationReceiver: aFASTJavaMethodInvocation receiver.
	self noIndent: aFASTJavaMethodInvocation name.
	self visitFASTJavaMethodInvocationArguments: aFASTJavaMethodInvocation arguments
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocationArguments: aFASTJavaMethodInvocationArguments [
	self noIndent: $( .
	self
		visitNodeList: aFASTJavaMethodInvocationArguments 
		separatedBy: [ self noIndent: ', ' ].
	self noIndent: $) .
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaMethodInvocationReceiver: aFASTJavaMethodInvocation [
	aFASTJavaMethodInvocation ifNil: [ ^self ].
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
	self noIndent: aFASTJavaModifier token.
	self space
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaModifiers: aFASTJavaModifierCollection [
	aFASTJavaModifierCollection do: [ :aFASTJavaModifier | 
		aFASTJavaModifier accept: self ]
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	self noIndent: 'new '.
	aFASTJavaNewExpression type accept: self.
	self noIndent: '()'
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	self noIndent: 'null'
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	aFASTJavaParameter type accept: self.
	self space.
	aFASTJavaParameter variable accept: self
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaParameters: aFASTJavaParameterCollection [
	self noIndent:  $(.
	self
		visitNodeList: aFASTJavaParameterCollection
		separatedBy: [ self noIndent:  ', ' ].
	self noIndent:  ') '.

]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	self noIndent: $".
	self noIndent: aFASTJavaStringLiteral primitiveValue.
	self noIndent: $".
]

{ #category : #'visiting statement' }
FASTJavaExportVisitor >> visitFASTJavaThenPartStatement: aFASTJavaStatement [
	self visitFASTJavaIfPartStatement: aFASTJavaStatement
]

{ #category : #'visiting expression' }
FASTJavaExportVisitor >> visitFASTJavaTypeName: aFASTJavaTypeName [
	self noIndent: aFASTJavaTypeName name
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
