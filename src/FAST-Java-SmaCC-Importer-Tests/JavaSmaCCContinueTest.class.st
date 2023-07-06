Class {
	#name : #JavaSmaCCContinueTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCContinueTest >> javaMethod [
	^ 'public void ifContinue() {
		if (true){
			continue;
		}
}'
]

{ #category : #tests }
JavaSmaCCContinueTest >> testContinueParent [
	self assert: (fastMethod mooseModel allWithType: FASTJavaContinueStatement) anyOne parentNode equals: fastMethod statements anyOne thenPart
]

{ #category : #tests }
JavaSmaCCContinueTest >> testContinueSize [
	self assert: (fastMethod mooseModel allWithType: FASTJavaContinueStatement) size equals: 1 
]
