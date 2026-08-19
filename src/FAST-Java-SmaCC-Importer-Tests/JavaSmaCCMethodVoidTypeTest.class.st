Class {
	#name : 'JavaSmaCCMethodVoidTypeTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodVoidTypeTest >> javaMethod [
	^ 'void hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodVoidTypeTest >> testMethodTypeType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaVoidTypeExpression
]
