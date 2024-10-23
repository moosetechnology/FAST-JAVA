Class {
	#name : 'JavaSmaCCSuperMethodInvocationTest',
	#superclass : 'JavaSmaCCImporterTest',
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
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver name equals: 'super'
]

{ #category : 'tests' }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiverAsChild [
	self assert: (fastModel allWithType: FASTJavaIdentifier) anyOne equals: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver
]

{ #category : 'tests' }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiverParent [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver parentNode equals: (fastModel allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : 'tests' }
JavaSmaCCSuperMethodInvocationTest >> testMethodInvocationReceiverType [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver class equals: FASTJavaIdentifier
]
