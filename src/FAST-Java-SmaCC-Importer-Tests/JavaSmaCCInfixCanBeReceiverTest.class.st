Class {
	#name : #JavaSmaCCInfixCanBeReceiverTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCInfixCanBeReceiverTest >> javaMethod [
	^ 'void method() {
	final int length = ("hello" + " world").length();
}'
]

{ #category : #tests }
JavaSmaCCInfixCanBeReceiverTest >> testInvocationReceiver [

	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver class equals: FASTJavaInfixOperation
]
