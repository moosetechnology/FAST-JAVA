Class {
	#name : 'JavaSmaCCMethodNoTypeTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodNoTypeTest >> javaMethod [
	^ 'hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodNoTypeTest >> testMethodTypeType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type equals: nil
]
