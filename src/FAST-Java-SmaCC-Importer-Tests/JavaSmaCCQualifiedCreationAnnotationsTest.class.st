"
I check that the type a qualified class instance creation instantiates, as the `@A Inner` of `o.new @A Inner()` (JLS 15.9), keeps the annotations written before it and starts at the first one.
"
Class {
	#name : 'JavaSmaCCQualifiedCreationAnnotationsTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCQualifiedCreationAnnotationsTest >> javaClass [

	^ 'class Outer {
	Object m(Outer o) {
		o.new @A Inner<Integer>();
		return o.new @B @C Inner() { };
	}
}'
]

{ #category : 'tests' }
JavaSmaCCQualifiedCreationAnnotationsTest >> testTheTypeKeepsItsAnnotations [

	self
		assert: (self types collect: [ :type |
				 (type annotations collect: [ :annotation | annotation type name ]) asArray ]) asArray
		equals: #( #( 'A' ) #( 'B' 'C' ) )
]

{ #category : 'tests' }
JavaSmaCCQualifiedCreationAnnotationsTest >> testTheTypeStartsAtItsFirstAnnotation [

	| type |
	type := self types first.
	self assert: (self javaClass copyFrom: type startPos to: type endPos) equals: '@A Inner<Integer>'
]

{ #category : 'accessing' }
JavaSmaCCQualifiedCreationAnnotationsTest >> types [

	^ ((fastModel allWithSubTypesOf: FASTJavaNewExpression) sorted: [ :a :b | a startPos < b startPos ])
		  collect: [ :creation | creation type ]
]
