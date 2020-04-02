Class {
	#name : #JavaSmaCCMethodReferenceTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodMethodReference'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCMethodReferenceTest >> methodMethodReference [
	^ 'method() {
         retrieve(config::getServiceChooser);
	}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodReferenceTest >> setUp [
	super setUp.
	methodMethodReference := (self parseMethod: 'methodReference')
]

{ #category : #tests }
JavaSmaCCMethodReferenceTest >> testMethodReferenceInModelSize [
	self assert: (methodMethodReference allWithType: FASTJavaMethodReference) size equals: 1
]

{ #category : #tests }
JavaSmaCCMethodReferenceTest >> testMethodReferenceName [
	self assert: (methodMethodReference allWithType: FASTJavaMethodReference) first name equals: 'getServiceChooser' .
]

{ #category : #tests }
JavaSmaCCMethodReferenceTest >> testMethodReferenceParentNode [
	self assert: (methodMethodReference allWithType: FASTJavaMethodReference) first parentNode class equals: FASTJavaMethodInvocation.
]

{ #category : #tests }
JavaSmaCCMethodReferenceTest >> testMethodReferenceReceiver [
	self assert: (methodMethodReference allWithType: FASTJavaMethodReference) first receiver class equals: FASTJavaVariableExpression.
]

{ #category : #tests }
JavaSmaCCMethodReferenceTest >> testMethodReferenceReceiverParentNode [
	self assert: (methodMethodReference allWithType: FASTJavaMethodReference) first receiver parentNode equals: (methodMethodReference allWithType: FASTJavaMethodReference) first.
]
