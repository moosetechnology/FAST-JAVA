Class {
	#name : #JavaSmaCCInfixCanBeReceiverTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'invocation'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCInfixCanBeReceiverTest >> methodString [
	^ 'void method() {
	final int length = ("hello" + " world").length();
}'
]

{ #category : #tests }
JavaSmaCCInfixCanBeReceiverTest >> setUp [

	super setUp.
	invocation := ((self parseMethodString: self methodString) 
		               allWithType: FASTJavaMethodInvocation) first
]

{ #category : #tests }
JavaSmaCCInfixCanBeReceiverTest >> testInvocationReceiver [

	self assert: invocation receiver class equals: FASTJavaInfixOperation
]
