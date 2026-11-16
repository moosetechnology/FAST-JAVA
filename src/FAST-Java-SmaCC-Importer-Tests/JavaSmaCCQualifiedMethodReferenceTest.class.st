Class {
	#name : 'JavaSmaCCQualifiedMethodReferenceTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCQualifiedMethodReferenceTest >> javaClass [

	^ 'class References {

	static String identity(String s) { return s; }

	java.util.function.Function<String, String> plain = References::identity;

	class Inner {
		java.util.function.Supplier<String> qualified = References.super::toString;
	}
}'
]

{ #category : 'tests' }
JavaSmaCCQualifiedMethodReferenceTest >> testAPlainReferenceKeepsItsReceiverAlone [

	| reference |
	reference := (fastModel allWithType: FASTJavaMethodReference) detect: [ :each | each name = 'identity' ].

	self assert: reference receiver name equals: 'References'.
	self deny: reference receiver class equals: FASTJavaFieldAccess
]

{ #category : 'tests' }
JavaSmaCCQualifiedMethodReferenceTest >> testAReferenceOnAQualifiedSuperKeepsTheQualifier [
	"JLS 15.13: `T.super::m` names a method of the superclass of T, so T and `super` make
	one receiver, written the way a qualified super is written anywhere else."

	| reference |
	reference := (fastModel allWithType: FASTJavaMethodReference) detect: [ :each | each name = 'toString' ].

	self assert: reference receiver class equals: FASTJavaFieldAccess.
	self assert: reference receiver fieldName equals: 'super'.
	self assert: reference receiver receiver name equals: 'References'
]
