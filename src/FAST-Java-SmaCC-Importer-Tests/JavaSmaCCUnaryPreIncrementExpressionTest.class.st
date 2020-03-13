Class {
	#name : #JavaSmaCCUnaryPreIncrementExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryPreIncrementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCUnaryPreIncrementExpressionTest >> methodUnaryPreIncrement [
	^ 'public void patate () {
	++i;		
}'
]

{ #category : #running }
JavaSmaCCUnaryPreIncrementExpressionTest >> setUp [
	super setUp.
	unaryPreIncrementMethod := (self parseMethod: 'unaryPreIncrement') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCUnaryPreIncrementExpressionTest >> testUnaryExpressionIsPrefixed [
	self assert: unaryPreIncrementMethod statements first children anyOne isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryPreIncrementExpressionTest >> testUnaryExpressionOperator [
	self assert: unaryPreIncrementMethod statements first children anyOne operator equals: '++'
]

{ #category : #tests }
JavaSmaCCUnaryPreIncrementExpressionTest >> testUnaryExpressionType [
	self assert: unaryPreIncrementMethod statements first children anyOne class equals: FASTJavaUnaryExpression
]
