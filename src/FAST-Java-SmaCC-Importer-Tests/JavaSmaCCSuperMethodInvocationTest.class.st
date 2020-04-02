Class {
	#name : #JavaSmaCCSuperMethodInvocationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodSuperConstructor',
		'superMethodInvocation'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCSuperMethodInvocationTest >> methodSuperMethodInvocation [
	^ 'void superMethodInvocation() {
  super.superMethodInvocation();
}'
]

{ #category : #resources }
JavaSmaCCSuperMethodInvocationTest >> setUp [
	super setUp.
	superMethodInvocation := (self parseMethod: 'superMethodInvocation')
]

{ #category : #tests }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiver [
	self assert: (superMethodInvocation allWithType: FASTJavaMethodInvocation) anyOne receiver name equals: 'super'
]

{ #category : #tests }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiverAsChild [
	self assert: (superMethodInvocation allWithType: FASTJavaIdentifier) anyOne equals: (superMethodInvocation allWithType: FASTJavaMethodInvocation) anyOne receiver
]

{ #category : #tests }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiverParent [
	self assert: (superMethodInvocation allWithType: FASTJavaMethodInvocation) anyOne receiver parentNode equals: (superMethodInvocation allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : #tests }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiverType [
	self assert: (superMethodInvocation allWithType: FASTJavaMethodInvocation) anyOne receiver class equals: FASTJavaIdentifier
]
