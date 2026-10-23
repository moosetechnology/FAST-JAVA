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
