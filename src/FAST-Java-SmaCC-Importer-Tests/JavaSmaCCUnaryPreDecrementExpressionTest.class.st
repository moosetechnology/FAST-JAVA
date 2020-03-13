Class {
	#name : #JavaSmaCCUnaryPreDecrementExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryPreDecrementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCUnaryPreDecrementExpressionTest >> methodUnaryPreDecrement [
	^ 'public void patate () {
	--i;		
}'
]

{ #category : #running }
JavaSmaCCUnaryPreDecrementExpressionTest >> setUp [
	super setUp.
	unaryPreDecrementMethod := (self parseMethod: 'unaryPreDecrement') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionIsPrefixed [
	self assert: unaryPreDecrementMethod statements first children anyOne isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionOperator [
	self assert: unaryPreDecrementMethod statements first children anyOne operator equals: '--'
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionOperatorType [
	self assert: unaryPreDecrementMethod statements first children anyOne operator class equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionType [
	self assert: unaryPreDecrementMethod statements first children anyOne class equals: FASTJavaUnaryExpression
]
