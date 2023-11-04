Class {
	#name : #JavaSmaCCTryWithResourceTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCTryWithResourceTest >> javaMethod [
	^ 'void tryCatch() {
  try  (ACloseableType o = new ACloseableType()) { }
}'
]

{ #category : #tests }
JavaSmaCCTryWithResourceTest >> testTryNoCatchPart [
	self assert: fastMethod statements anyOne catches size equals: 0
]

{ #category : #tests }
JavaSmaCCTryWithResourceTest >> testTryResourceNumber [
	self assert: fastMethod statements anyOne resources size equals: 1
]

{ #category : #tests }
JavaSmaCCTryWithResourceTest >> testTryResourcePartExpressionType [
	self assert: fastMethod statements anyOne resources anyOne declarators anyOne expression class equals: FASTJavaNewExpression 
]

{ #category : #tests }
JavaSmaCCTryWithResourceTest >> testTryResourcePartType [
	self assert: fastMethod statements anyOne resources anyOne class equals: FASTJavaVarDeclStatement
]

{ #category : #tests }
JavaSmaCCTryWithResourceTest >> testTryResourcePartTypeName [
	self assert: fastMethod statements anyOne resources anyOne type typeName name equals: 'ACloseableType'
]

{ #category : #tests }
JavaSmaCCTryWithResourceTest >> testTryResourcePartVariableName [
	self assert: fastMethod statements anyOne resources anyOne declarators anyOne variable name equals: 'o'
]

{ #category : #tests }
JavaSmaCCTryWithResourceTest >> testTryTryPartType [
	self assert: fastMethod statements anyOne try class equals: FASTJavaStatementBlock
]

{ #category : #tests }
JavaSmaCCTryWithResourceTest >> testTryType [
	self assert: fastMethod statements anyOne class equals: FASTJavaTryCatchStatement
]
