Class {
	#name : 'JavaSmaCCSuperConstructorInvocationTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCSuperConstructorInvocationTest >> javaMethod [
	^ 'Patate () {
	super("Hello");
}'
]

{ #category : 'tests' }
JavaSmaCCSuperConstructorInvocationTest >> testQualifiedSuperConstructorKeepsItsQualifier [
	"JLS 8.8.7.1: `o.super(k)` names the instance the superclass is to be enclosed by, and
	the model holds the expression written before the dot as the receiver of the invocation
	the keyword names."

	| qualified invocation |
	qualified := self parseMethodString: 'Patate (Outer o) { o.super("Hello"); }'.
	invocation := (qualified allWithType: FASTJavaMethodInvocation) anyOne.

	self assert: invocation name equals: 'super'.
	self assert: invocation receiver name equals: 'o'
]

{ #category : 'tests' }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorArgumentsParent [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne arguments anyOne parentNode equals: (fastModel allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : 'tests' }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorArgumentsSize [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne arguments size equals: 1
]

{ #category : 'tests' }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorKeepsItsTypeArguments [
	"JLS 8.8.7.1: an explicit constructor invocation may write the type arguments of the
	constructor it calls before the keyword."

	| qualified invocation |
	qualified := self parseMethodString: 'Patate (Outer o) { o.<String>super("Hello"); }'.
	invocation := (qualified allWithType: FASTJavaMethodInvocation) anyOne.

	self assert: invocation typeArguments size equals: 1.
	self assert: invocation typeArguments anyOne typeName name equals: 'String'.
	self assert: invocation receiver name equals: 'o'
]

{ #category : 'tests' }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorName [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne name equals: 'super'
]

{ #category : 'tests' }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorParent [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne parentNode parentNode equals: fastMethod statementBlock 
]

{ #category : 'tests' }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorSize [
	self assert: (fastModel allWithType: FASTJavaMethodInvocation) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCSuperConstructorInvocationTest >> testUnqualifiedSuperConstructorHasNoReceiver [
	"A constructor invocation written with no qualifier keeps none."

	self assert: (fastModel allWithType: FASTJavaMethodInvocation) anyOne receiver isNil
]
