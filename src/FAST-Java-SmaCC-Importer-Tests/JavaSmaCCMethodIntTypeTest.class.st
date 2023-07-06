Class {
	#name : #JavaSmaCCMethodIntTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCMethodIntTypeTest >> javaMethod [
	 ^ 'int hello(){}'
]

{ #category : #tests }
JavaSmaCCMethodIntTypeTest >> testMethodTypeType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaIntTypeExpression
]
