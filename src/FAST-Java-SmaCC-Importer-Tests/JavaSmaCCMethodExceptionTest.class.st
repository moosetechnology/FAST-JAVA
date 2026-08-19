Class {
	#name : 'JavaSmaCCMethodExceptionTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodExceptionTest >> javaMethod [

	^ 'void method() throws MyException {
}'
]

{ #category : 'tests' }
JavaSmaCCMethodExceptionTest >> testOnlyOneThrowsEntity [

	self
		assert: (fastModel allWithType: FASTJavaMethodEntity) size
		equals: 1.
	self
		assert:
		(fastModel allWithType: FASTJavaMethodEntity) anyOne throws size
		equals: 1
]
