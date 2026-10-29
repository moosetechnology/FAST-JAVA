Class {
	#name : 'JavaSmaCCTypeArgumentsTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCTypeArgumentsTest >> javaClass [

	^ 'class Arguments {

	ArrayList<E>.ArrayListSpliterator qualified;

	java.util.Map<K, V> plain;

	void collect() {
		use(Collection<T>::add);
		use(String::valueOf);
	}
}'
]

{ #category : 'resources' }
JavaSmaCCTypeArgumentsTest >> methodReferenceNamed: aString [

	^ (fastModel allWithType: FASTJavaMethodReference) detect: [ :reference |
		  reference name = aString ]
]

{ #category : 'tests' }
JavaSmaCCTypeArgumentsTest >> testLastNameWritesItsTypeArgumentsOnTheTypeExpression [
	"The arguments the last name of a qualified type writes belong to the type expression,
	which is where they have always been read from."

	| map |
	map := self typeNamed: 'Map'.
	self assertEmpty: map arguments.
	self assert: map javaTypeNameTypeExpressionOwner arguments size equals: 2
]

{ #category : 'tests' }
JavaSmaCCTypeArgumentsTest >> testMethodReferenceReceiverIsATypeWhenItWritesTypeArguments [
	"JLS 15.13: only a reference type may write type arguments before `::`, so the receiver
	of `Collection<T>::add` is the type `Collection<T>`."

	| receiver |
	receiver := (self methodReferenceNamed: 'add') receiver.
	self assert: receiver class equals: FASTJavaClassTypeExpression.
	self assert: receiver typeName name equals: 'Collection'.
	self assert: receiver arguments size equals: 1.
	self assert: receiver arguments anyOne typeName name equals: 'T'
]

{ #category : 'tests' }
JavaSmaCCTypeArgumentsTest >> testMethodReferenceReceiverIsLeftAloneWithoutTypeArguments [
	"A name written before `::` with no type arguments says no more about itself than the
	grammar does, so it is read as the grammar reads it."

	self
		assert: (self methodReferenceNamed: 'valueOf') receiver class
		equals: FASTJavaVariableExpression
]

{ #category : 'tests' }
JavaSmaCCTypeArgumentsTest >> testQualifyingNameKeepsItsTypeArguments [
	"JLS 4.3: the name that qualifies a type is itself a type, so the `ArrayList<E>` of
	`ArrayList<E>.ArrayListSpliterator` writes type arguments the qualifying name holds."

	| namespace |
	namespace := (self typeNamed: 'ArrayListSpliterator') namespace.
	self assert: namespace name equals: 'ArrayList'.
	self assert: namespace arguments size equals: 1.
	self assert: namespace arguments anyOne typeName name equals: 'E'
]

{ #category : 'resources' }
JavaSmaCCTypeArgumentsTest >> typeNamed: aString [

	^ (fastModel allWithType: FASTJavaQualifiedTypeName) detect: [ :typeName |
		  typeName name = aString ]
]
