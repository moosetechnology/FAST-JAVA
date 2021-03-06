Class {
	#name : #JavaSmaCCUnaryPostDecrementExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryPostDecrementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCUnaryPostDecrementExpressionTest >> methodUnaryPostDecrement [
	^ 'public void patate () {
	i--;		
}'
]

{ #category : #running }
JavaSmaCCUnaryPostDecrementExpressionTest >> setUp [
	super setUp.
	unaryPostDecrementMethod := (self parseMethod: 'unaryPostDecrement') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionIsPrefixed [
	self deny: unaryPostDecrementMethod statements first children anyOne isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionOperator [
	self assert: unaryPostDecrementMethod statements first children anyOne operator equals: '--'
]

{ #category : #tests }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionOperatorType [
	self assert: unaryPostDecrementMethod statements first children anyOne operator class equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionType [
	self assert: unaryPostDecrementMethod statements first children anyOne class equals: FASTJavaUnaryExpression
]
