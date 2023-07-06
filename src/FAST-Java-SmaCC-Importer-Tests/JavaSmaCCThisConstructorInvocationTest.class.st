Class {
	#name : #JavaSmaCCThisConstructorInvocationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCThisConstructorInvocationTest >> javaMethod [
	^ 'Patate () {
	this("Hello");
}'
]

{ #category : #tests }
JavaSmaCCThisConstructorInvocationTest >> testThisConstructorArgumentsParent [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne arguments anyOne parentNode equals: (fastModel allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : #tests }
JavaSmaCCThisConstructorInvocationTest >> testThisConstructorArgumentsSize [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne arguments size equals: 1
]

{ #category : #tests }
JavaSmaCCThisConstructorInvocationTest >> testThisConstructorName [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne name equals: 'this'
]

{ #category : #tests }
JavaSmaCCThisConstructorInvocationTest >> testThisConstructorParent [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne parentNode  parentNode equals: fastMethod statementBlock 
]

{ #category : #tests }
JavaSmaCCThisConstructorInvocationTest >> testThisConstructorSize [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) size equals: 1
]
