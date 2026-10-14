Class {
	#name : 'JavaSmaCCContinueLabelTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCContinueLabelTest >> javaMethod [

	^ 'void foo() {
	myLabel:
	while (true) {
		continue myLabel;
	}
}'
]

{ #category : 'tests' }
JavaSmaCCContinueLabelTest >> testContinueLabel [
	self assert: (fastMethod mooseModel allWithType: FASTJavaContinueStatement) anyOne label equals: 'myLabel'
]
