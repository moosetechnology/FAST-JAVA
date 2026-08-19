Class {
	#name : 'JavaSmaCCMethodIntTypeTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodIntTypeTest >> javaMethod [

	^ 'int hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodIntTypeTest >> testMethodTypeType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaIntTypeExpression
]
