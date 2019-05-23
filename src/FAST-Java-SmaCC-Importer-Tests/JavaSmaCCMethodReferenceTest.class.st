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

{ #category : #'as yet unclassified' }
JavaSmaCCMethodReferenceTest >> testMethodReferenceInModelSize [
	self assert: (methodMethodReference allWithType: FASTJavaMethodReference) size equals: 1
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodReferenceTest >> testMethodReferenceName [
	self assert: (methodMethodReference allWithType: FASTJavaMethodReference) first name equals: 'getServiceChooser' .
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodReferenceTest >> testMethodReferenceParentNode [
	self assert: (methodMethodReference allWithType: FASTJavaMethodReference) first parentNode class equals: FASTJavaMethodInvocation.
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodReferenceTest >> testMethodReferenceReceiver [
	self assert: (methodMethodReference allWithType: FASTJavaMethodReference) first receiver class equals: FASTVariableExpression.
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodReferenceTest >> testMethodReferenceReceiverParentNode [
	self assert: (methodMethodReference allWithType: FASTJavaMethodReference) first receiver parentNode equals: (methodMethodReference allWithType: FASTJavaMethodReference) first.
]
