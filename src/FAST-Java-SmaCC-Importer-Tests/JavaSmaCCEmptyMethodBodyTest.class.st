Class {
	#name : 'JavaSmaCCEmptyMethodBodyTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCEmptyMethodBodyTest >> javaMethod [
	
	^ 
'class A {
	native void doWhile();
}'
]

{ #category : 'resources' }
JavaSmaCCEmptyMethodBodyTest >> testEmptyDeclaredMethodSize [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) size equals: 1.
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne statementBlock equals: nil
]
