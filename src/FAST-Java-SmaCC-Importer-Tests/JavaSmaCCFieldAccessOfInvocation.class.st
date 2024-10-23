Class {
	#name : 'JavaSmaCCFieldAccessOfInvocation',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCFieldAccessOfInvocation >> javaMethod [
	^ 'void fieldAccessOfInvocation() {
	variable.invoc1().invoc2().ctSociete.setFocus(true);
}'
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOfInvocation >> testFieldAccessReceiver [
	self assert: (fastModel allWithType: FASTJavaFieldAccess) first receiver equals: (((fastModel allWithType: FASTJavaMethodInvocation) select: [ :invoc | invoc name = 'invoc2' ]) first).
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOfInvocation >> testFieldAccessReceiverOwner [
	self assert: (fastModel allWithType: FASTJavaFieldAccess) first equals: (((fastModel allWithType: FASTJavaMethodInvocation) select: [ :invoc | invoc name = 'invoc2' ]) first receiverOwner).
]

{ #category : 'tests' }
JavaSmaCCFieldAccessOfInvocation >> testFieldAccessSize [
	self assert: (fastModel allWithType: FASTJavaFieldAccess) size equals: 1.
]
