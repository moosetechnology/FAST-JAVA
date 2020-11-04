Class {
	#name : #JavaSmaCCEmptyMethodBodyTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodType',
		'emptyBody'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCEmptyMethodBodyTest >> methodEmptyBody [
	
	^ 
'class A {
	native void doWhile();
}'
]

{ #category : #resources }
JavaSmaCCEmptyMethodBodyTest >> setUp [
	super setUp.
	emptyBody :=  JavaSmaCCProgramNodeImporterVisitor new parseCodeString: self methodEmptyBody
]

{ #category : #resources }
JavaSmaCCEmptyMethodBodyTest >> testEmptyDeclaredMethodSize [
	self assert: (emptyBody allWithType: FASTJavaMethodEntity) size equals: 1.
	self assert: (emptyBody allWithType: FASTJavaMethodEntity) anyOne statementBlock equals: nil
]
