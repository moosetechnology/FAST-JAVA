Class {
	#name : #JavaSmaCCFieldAccessOfInvocation,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'fieldAccessOfInvocation'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCFieldAccessOfInvocation >> methodFieldAccessOfInvocation [
	^ 'void fieldAccessOfInvocation() {
	variable.invoc1().invoc2().ctSociete.setFocus(true);
}'
]

{ #category : #resources }
JavaSmaCCFieldAccessOfInvocation >> setUp [
	super setUp.
	fieldAccessOfInvocation := (self parseMethod: 'fieldAccessOfInvocation')
]

{ #category : #tests }
JavaSmaCCFieldAccessOfInvocation >> testFieldAccessReceiver [
	self assert: (fieldAccessOfInvocation allWithType: FASTJavaFieldAccess) first receiver equals: (((fieldAccessOfInvocation allWithType: FASTJavaMethodInvocation) select: [ :invoc | invoc name = 'invoc2' ]) first).
]

{ #category : #tests }
JavaSmaCCFieldAccessOfInvocation >> testFieldAccessReceiverOwner [
	self assert: (fieldAccessOfInvocation allWithType: FASTJavaFieldAccess) first equals: (((fieldAccessOfInvocation allWithType: FASTJavaMethodInvocation) select: [ :invoc | invoc name = 'invoc2' ]) first receiverOwner).
]

{ #category : #tests }
JavaSmaCCFieldAccessOfInvocation >> testFieldAccessSize [
	self assert: (fieldAccessOfInvocation allWithType: FASTJavaFieldAccess) size equals: 1.
]
