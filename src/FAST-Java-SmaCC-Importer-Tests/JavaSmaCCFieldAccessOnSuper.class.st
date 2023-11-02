Class {
	#name : #JavaSmaCCFieldAccessOnSuper,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCFieldAccessOnSuper >> javaMethod [
	^ 'void fieldAccessOfInvocation() {
	super.aField = 5;
}'
]

{ #category : #tests }
JavaSmaCCFieldAccessOnSuper >> testFieldAccessReceiverName [
	self
		assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver name
		equals: 'super'.
]

{ #category : #tests }
JavaSmaCCFieldAccessOnSuper >> testFieldAccessReceiverType [
	self
		assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver class
		equals: FASTJavaVariableExpression.
]
