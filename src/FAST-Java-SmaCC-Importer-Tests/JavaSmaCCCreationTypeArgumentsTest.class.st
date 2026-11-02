Class {
	#name : 'JavaSmaCCCreationTypeArgumentsTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCCreationTypeArgumentsTest >> javaClass [

	^ 'class Creations {

	<T> Creations() { }

	class Inner { <T> Inner() { } }

	Object plain = new Creations();

	Object generic = new <String>Creations();

	Object anonymous = new <String>Creations() { };

	void inner(Creations o) { o.new <String>Inner(); }
}'
]

{ #category : 'tests' }
JavaSmaCCCreationTypeArgumentsTest >> testACreationKeepsTheTypeArgumentsOfItsConstructor [
	"JLS 15.9: the type arguments written between `new` and the type belong to the
	constructor called, so the creation holds them and the type does not."

	| creations generic |
	creations := (fastModel allWithType: FASTJavaNewExpression) reject: [ :each | each isNewClassExpression ].
	generic := creations detect: [ :each | each typeArguments isNotEmpty ].

	self assert: creations size equals: 3.
	self assert: (generic typeArguments collect: [ :each | each typeName name ]) asArray equals: #( 'String' ).
	self assert: generic type typeName name equals: 'Creations'.
	self assert: generic type arguments isEmpty
]

{ #category : 'tests' }
JavaSmaCCCreationTypeArgumentsTest >> testACreationQualifiedByAPrimaryKeepsThemApartFromItsType [
	"JLS 15.9: `o.new <T>Inner()` writes the type arguments of the constructor before the
	name of the inner type, where the type arguments of that type would come after it."

	| inner |
	inner := (fastModel allWithType: FASTJavaNewExpression) detect: [ :each | each receiver isNotNil ].

	self assert: (inner typeArguments collect: [ :each | each typeName name ]) asArray equals: #( 'String' ).
	self assert: inner type typeName name equals: 'Inner'.
	self assert: inner type arguments isEmpty
]

{ #category : 'tests' }
JavaSmaCCCreationTypeArgumentsTest >> testACreationWithABodyKeepsThemToo [
	"JLS 15.9.1: a creation that writes a class body calls the constructor of the type it
	extends, so it writes the type arguments of that constructor the same way."

	| anonymous |
	anonymous := (fastModel allWithType: FASTJavaNewClassExpression) anyOne.

	self assert: (anonymous typeArguments collect: [ :each | each typeName name ]) asArray equals: #( 'String' ).
	self assert: anonymous type typeName name equals: 'Creations'
]

{ #category : 'tests' }
JavaSmaCCCreationTypeArgumentsTest >> testACreationWithoutTypeArgumentsHasNone [

	| plain |
	plain := (fastModel allWithType: FASTJavaNewExpression) detect: [ :each |
		         each typeArguments isEmpty and: [ each receiver isNil ] ].

	self assert: plain type typeName name equals: 'Creations'.
	self deny: plain isDiamond
]
