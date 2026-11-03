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
JavaSmaCCFieldAccessOnThisTest >> testFieldAccessReceiverIsAnUnqualifiedThis [
	"JLS 15.8.3: `this.aField` writes the keyword alone, so the receiver qualifies no type."

	self assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver type isNil
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOnThisTest >> testFieldAccessReceiverType [
	self
		assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver class
		equals: FASTJavaThis
]
