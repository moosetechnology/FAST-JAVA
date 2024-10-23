Class {
	#name : 'JavaSmaCCMethodReferenceTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'as yet unclassified' }
JavaSmaCCMethodReferenceTest >> javaMethod [
	^ 'method() {
         retrieve(config::getServiceChooser);
	}'
]

{ #category : 'tests' }
JavaSmaCCMethodReferenceTest >> testMethodReferenceInModelSize [
	self assert: (fastModel allWithType: FASTJavaMethodReference) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCMethodReferenceTest >> testMethodReferenceName [
	self assert: (fastModel allWithType: FASTJavaMethodReference) first name equals: 'getServiceChooser' .
]

{ #category : 'tests' }
JavaSmaCCMethodReferenceTest >> testMethodReferenceParentNode [
	self assert: (fastModel allWithType: FASTJavaMethodReference) first parentNode class equals: FASTJavaMethodInvocation.
]

{ #category : 'tests' }
JavaSmaCCMethodReferenceTest >> testMethodReferenceReceiver [
	self assert: (fastModel allWithType: FASTJavaMethodReference) first receiver class equals: FASTJavaVariableExpression.
]

{ #category : 'tests' }
JavaSmaCCMethodReferenceTest >> testMethodReferenceReceiverParentNode [
	self assert: (fastModel allWithType: FASTJavaMethodReference) first receiver parentNode equals: (fastModel allWithType: FASTJavaMethodReference) first.
]
