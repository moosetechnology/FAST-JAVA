Class {
	#name : 'JavaSmaCCFieldAccessOnThis',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCFieldAccessOnThis >> javaMethod [
	^ 'void fieldAccessOfInvocation() {
	this.aField = 5;
}'
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOnThis >> testFieldAccessReceiverName [
	self
		assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver name
		equals: 'this'.
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOnThis >> testFieldAccessReceiverType [
	self
		assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver class
		equals: FASTJavaVariableExpression.
]
