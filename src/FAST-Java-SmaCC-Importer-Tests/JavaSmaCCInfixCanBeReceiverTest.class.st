Class {
	#name : 'JavaSmaCCInfixCanBeReceiverTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'tests' }
JavaSmaCCInfixCanBeReceiverTest >> javaMethod [
	^ 'void method() {
	int length = ("hello" + " world").length();
}'
]

{ #category : 'tests' }
JavaSmaCCInfixCanBeReceiverTest >> testInvocationReceiver [

	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver class equals: FASTJavaInfixOperation
]
