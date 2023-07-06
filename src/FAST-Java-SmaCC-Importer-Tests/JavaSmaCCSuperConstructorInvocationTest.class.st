Class {
	#name : #JavaSmaCCSuperConstructorInvocationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCSuperConstructorInvocationTest >> javaMethod [
	^ 'Patate () {
	super("Hello");
}'
]

{ #category : #tests }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorArgumentsParent [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne arguments anyOne parentNode equals: (fastModel allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : #tests }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorArgumentsSize [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne arguments size equals: 1
]

{ #category : #tests }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorName [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne name equals: 'super'
]

{ #category : #tests }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorParent [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne parentNode parentNode equals: fastMethod statementBlock 
]

{ #category : #tests }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorSize [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) size equals: 1
]
