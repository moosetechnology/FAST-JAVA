Class {
	#name : #JavaSmaCCThrowStatementTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCThrowStatementTest >> javaMethod [
	^ 
'boolean methodThrow() {
  if(true) { 
	throw new Error();
 }
}
'
]

{ #category : #tests }
JavaSmaCCThrowStatementTest >> testThrowStatementParent [
	self assert: (fastModel allWithType: FASTJavaThrowStatement) anyOne parentNode equals: fastMethod statements anyOne thenPart
]

{ #category : #tests }
JavaSmaCCThrowStatementTest >> testThrowStatementParentAsChild [
	self assert: (fastModel allWithType: FASTJavaThrowStatement) anyOne equals: fastMethod statements anyOne thenPart children anyOne
]

{ #category : #tests }
JavaSmaCCThrowStatementTest >> testThrowStatementSize [
	self assert: (fastModel allWithType: FASTJavaThrowStatement) size equals: 1 
]
