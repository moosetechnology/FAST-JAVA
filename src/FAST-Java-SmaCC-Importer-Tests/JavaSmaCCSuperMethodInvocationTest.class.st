Class {
	#name : 'JavaSmaCCSuperMethodInvocationTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCSuperMethodInvocationTest >> javaMethod [
	^ 'void superMethodInvocation() {
	super.superMethodInvocation();
}'
]

{ #category : 'tests' }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiver [
	"JLS 15.12.1: `super.superMethodInvocation()` writes the keyword alone before the dot."

	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver type isNil
]

{ #category : 'tests' }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiverAsChild [
	self assert: (fastModel allWithType: FASTJavaSuper) anyOne equals: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver
]

{ #category : 'tests' }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiverParent [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver parentNode equals: (fastModel allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : 'tests' }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiverType [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver class equals: FASTJavaSuper
]
