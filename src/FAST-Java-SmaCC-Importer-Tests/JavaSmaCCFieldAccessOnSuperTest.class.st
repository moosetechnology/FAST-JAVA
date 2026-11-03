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
JavaSmaCCFieldAccessOnSuperTest >> testFieldAccessReceiverIsAnUnqualifiedSuper [
	"JLS 15.11.2: `super.aField` writes the keyword alone, so the receiver qualifies no type."

	self assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver type isNil
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOnSuperTest >> testFieldAccessReceiverType [
	self
		assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver class
		equals: FASTJavaSuper
]
