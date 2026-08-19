Class {
	#name : 'JavaSmaCCFieldAccessOnSuperTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCFieldAccessOnSuperTest >> javaMethod [
	^ 'void fieldAccessOfInvocation() {
	super.aField = 5;
}'
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOnSuperTest >> testFieldAccessReceiverName [
	self
		assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver name
		equals: 'super'.
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOnSuperTest >> testFieldAccessReceiverType [
	self
		assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver class
		equals: FASTJavaVariableExpression.
]
