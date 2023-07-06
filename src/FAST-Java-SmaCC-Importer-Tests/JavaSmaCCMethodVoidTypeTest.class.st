Class {
	#name : #JavaSmaCCMethodVoidTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCMethodVoidTypeTest >> testMethodTypeType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaVoidTypeExpression
]
