Class {
	#name : 'JavaSmaCCFieldAccessOnThisTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCFieldAccessOnThisTest >> javaMethod [
	^ 'void fieldAccessOfInvocation() {
	this.aField = 5;
}'
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOnThisTest >> testFieldAccessReceiverName [
	self
		assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver name
		equals: 'this'.
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOnThisTest >> testFieldAccessReceiverType [
	self
		assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver class
		equals: FASTJavaVariableExpression.
]
