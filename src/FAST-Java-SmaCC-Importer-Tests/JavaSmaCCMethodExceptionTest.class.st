Class {
	#name : 'JavaSmaCCMethodExceptionTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
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
