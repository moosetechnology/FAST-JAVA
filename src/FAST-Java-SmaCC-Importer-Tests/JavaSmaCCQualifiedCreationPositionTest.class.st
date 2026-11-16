"
I check that the type a qualified class instance creation instantiates, as the `Inner<Integer>` of `o.new Inner<Integer>()` (JLS 15.9), ends with the type arguments written for it, which are entities within it.
"
Class {
	#name : 'JavaSmaCCQualifiedCreationPositionTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCQualifiedCreationPositionTest >> javaClass [

	^ 'class Outer {
	Object m(Outer o) {
		return o.new Inner<Integer>();
	}
}'
]

{ #category : 'tests' }
JavaSmaCCQualifiedCreationPositionTest >> testTheTypeEndsWithItsArguments [

	| type |
	type := (fastModel allWithType: FASTJavaNewExpression) anyOne type.
	self assert: (self javaClass copyFrom: type startPos to: type endPos) equals: 'Inner<Integer>'
]
