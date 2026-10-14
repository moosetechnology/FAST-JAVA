Class {
	#name : 'JavaSmaCCBreakLabelTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCBreakLabelTest >> javaMethod [
	^ 'void breakLabel() {
	myLabel: break myLabel;
}'
]

{ #category : 'tests' }
JavaSmaCCBreakLabelTest >> testBreakLabel [
	self assert: (fastMethod mooseModel allWithType: FASTJavaBreakStatement) anyOne label equals: 'myLabel'
]
