Class {
	#name : 'JavaSmaCCMethodReferenceReceiverTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodReferenceReceiverTest >> javaMethod [
	^ 'void method() {
	use(Foo::new);
	use(String[]::new);
	use(foo.bar()::baz);
	use(array[0]::baz);
	use(new Foo()::baz);
}'
]

{ #category : 'accessing' }
JavaSmaCCMethodReferenceReceiverTest >> references [
	^ (fastModel allWithType: FASTJavaMethodReference) sorted: [ :a :b | a startPos < b startPos ]
]

{ #category : 'tests' }
JavaSmaCCMethodReferenceReceiverTest >> testATypeIsAReceiverAndNotAVariableExpression [
	"JLS 15.13: a method reference may name a type as what it reads the method from, so a
	type is a receiver. It is not a variable expression: nothing assigns to a type, closes
	it as a resource of a try, or writes it as an element of an annotation."

	| receiver |
	receiver := (fastModel allWithType: FASTJavaMethodReference) anyOne receiver.
	self assert: (receiver isKindOf: FASTJavaTypeExpression).
	self deny: (receiver isKindOf: FASTJavaVariableExpression)
]

{ #category : 'tests' }
JavaSmaCCMethodReferenceReceiverTest >> testReceiverKind [
	"JLS 15.13: the receiver of a method reference is any expression that may be one."

	self
		assert: (self references collect: [ :each | each receiver class ]) asArray
		equals: {
				FASTJavaClassTypeExpression.
				FASTJavaArrayTypeExpression.
				FASTJavaMethodInvocation.
				FASTJavaArrayAccess.
				FASTJavaNewExpression }
]

{ #category : 'tests' }
JavaSmaCCMethodReferenceReceiverTest >> testReceiverOwner [

	self references do: [ :each | self assert: each receiver receiverOwner equals: each ]
]
