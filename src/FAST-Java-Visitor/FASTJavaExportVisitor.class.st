"
A visitor to export the AST as Java source code

to use it:
```
FASTJavaCodeVisitor new generateCode: aFASTJavaNode
```
"
Class {
	#name : #FASTJavaExportVisitor,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'stream',
		'indent'
	],
	#category : #'FAST-Java-Visitor'
}

{ #category : #outputting }
FASTJavaExportVisitor >> endOfLine [
	stream cr
]

{ #category : #api }
FASTJavaExportVisitor >> generateCode: aFASTNode [
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
FASTJavaExportVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	self withIndent: ''.
	self visitFASTJavaModifiers: aFASTJavaMethodEntity modifiers.
	aFASTJavaMethodEntity type accept: self.
	self noIndent: aFASTJavaMethodEntity name.
	self visitFASTJavaParameters: aFASTJavaMethodEntity parameters.
	self visitFASTJavaMethodThrows: aFASTJavaMethodEntity throws.
	"missing a #visitFASTJavaStatementBlock: in FASTJavaVisitor"
	self visitFASTJavaStatementBlock: aFASTJavaMethodEntity statementBlock.
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
FASTJavaExportVisitor >> visitFASTJavaModifiers: aFASTJavaMethodEntityCollection [
	self
		visitNodeList: aFASTJavaMethodEntityCollection 
		separatedBy: [ self space ].
	aFASTJavaMethodEntityCollection ifNotEmpty: [ self space ]
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	aFASTJavaParameter type accept: self.
	self space.
	"missing a #visitFASTJavaVariableExpression: in FASTJavaVisitor"
	self visitFASTJavaVariableExpression: aFASTJavaParameter variable.
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaParameters: aFASTJavaParameterCollection [
	self noIndent:  $(.
	self
		visitNodeList: aFASTJavaParameterCollection
		separatedBy: [ self noIndent:  ', ' ].
	self noIndent:  ') '.

]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaStatementBlock: aFASTJavaStatementBlock [
	self withIndent: ${.
	self endOfLine.
	self indent.
1halt.
	self
		visitNodeList: aFASTJavaStatementBlock statements
		separatedBy: [ self noIndent: $; . self endOfLine ].
	self endOfLine.
	self unindent.
	self withIndent: $}.
	self endOfLine
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaTypeName: aFASTJavaTypeName [
	self noIndent: aFASTJavaTypeName name.
	self space
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	aFASTJavaVarDeclStatement type accept: self.
	self space.
	self
		visitNodeList: aFASTJavaVarDeclStatement declarators
		separatedBy: [ self noIndent: ', ' ].
	
]

{ #category : #visiting }
FASTJavaExportVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	self noIndent: aFASTJavaVariableExpression name
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
