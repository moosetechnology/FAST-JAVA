Class {
	#name : 'JavaSmaCCBreakTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCBreakTest >> javaMethod [
	^ 'void whileBreak() {
	while (true) {
		break;
	}
}'
]

{ #category : 'tests' }
JavaSmaCCBreakTest >> testContinueSize [
	self assert: (fastMethod mooseModel allWithType: FASTJavaBreakStatement) size equals: 1
]
