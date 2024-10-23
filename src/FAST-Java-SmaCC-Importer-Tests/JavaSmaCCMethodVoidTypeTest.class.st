Class {
	#name : 'JavaSmaCCMethodVoidTypeTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCMethodVoidTypeTest >> javaMethod [
	 ^ 'void hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodVoidTypeTest >> testMethodTypeType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaVoidTypeExpression
]
