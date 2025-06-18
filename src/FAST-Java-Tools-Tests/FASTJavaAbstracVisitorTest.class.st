Class {
	#name : 'FASTJavaAbstracVisitorTest',
	#superclass : 'TestCase',
	#category : 'FAST-Java-Tools-Tests-utils',
	#package : 'FAST-Java-Tools-Tests',
	#tag : 'utils'
}

{ #category : 'running' }
FASTJavaAbstracVisitorTest >> astFor: sourceCode [

	^JavaSmaCCProgramNodeImporterVisitor new
		accept: (JavaParser parse: sourceCode)
			typeDeclarations anyOne
]

{ #category : 'running' }
FASTJavaAbstracVisitorTest >> astFor: sourceCode withRule: rule [

	^JavaSmaCCProgramNodeImporterVisitor new
		accept: (JavaParser
			createParserOnStream:  (ReadStream on: sourceCode)
			startingAt: (JavaParser perform: rule))
			parse
]

{ #category : 'running' }
FASTJavaAbstracVisitorTest >> blockAST: sourceCode [

	^self astFor: sourceCode withRule: #startingStateForblock_statement


]

{ #category : 'running' }
FASTJavaAbstracVisitorTest >> expressionAST: sourceCode [

	^self astFor: sourceCode withRule: #startingStateForexpression


]

{ #category : 'running' }
FASTJavaAbstracVisitorTest >> methodAST: sourceCode [

	^self astFor: sourceCode withRule: #startingStateForclass_or_interface_body_declaration

]
