Class {
	#name : 'JavaSmaCCRecordPatternTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCRecordPatternTest >> javaClass [

	^ 'class Patterns {

	void match(Object o) {
		if (o instanceof Point(int x, int y)) { }
	}

	void nested(Object o) {
		if (o instanceof Line(Point(int x, int y), Point p)) { }
	}

	void matchAll(Object o) {
		if (o instanceof Point(_, int y)) { }
	}
}'
]

{ #category : 'tests' }
JavaSmaCCRecordPatternTest >> testMatchAllComponentBindsNothing [
	"JLS 14.30.1: `_` matches a component and binds nothing to it."

	| patterns |
	patterns := (fastModel allWithType: FASTJavaRecordPattern)
		            detect: [ :each | each patterns anySatisfy: [ :component | component isMatchAllPattern ] ].

	self assert: patterns patterns size equals: 2.
	self assert: patterns patterns first class equals: FASTJavaMatchAllPattern
]

{ #category : 'tests' }
JavaSmaCCRecordPatternTest >> testNestedRecordPatternIsAComponentOfItsOwner [
	"JLS 14.30.1: a component pattern is a pattern of its own, a record pattern among them."

	| outer |
	outer := (fastModel allWithType: FASTJavaRecordPattern)
		         detect: [ :each | each type typeName name = 'Line' ].

	self assert: outer patterns size equals: 2.
	self assert: outer patterns first class equals: FASTJavaRecordPattern.
	self assert: outer patterns first type typeName name equals: 'Point'.
	self assert: outer patterns second class equals: FASTJavaTypePattern
]

{ #category : 'tests' }
JavaSmaCCRecordPatternTest >> testRecordPatternKeepsItsTypeAndComponents [
	"JLS 14.30.1: a record pattern names the record type it matches and the patterns its
	components are matched against, in the order the record declares them."

	| pattern |
	pattern := (fastModel allWithType: FASTJavaRecordPattern)
		           detect: [ :each | each patterns allSatisfy: [ :component | component isTypePattern ] ].

	self assert: pattern type typeName name equals: 'Point'.
	self assert: pattern patterns size equals: 2.
	self assert: (pattern patterns collect: [ :component | component variable name ]) asArray
		equals: #( 'x' 'y' )
]

{ #category : 'tests' }
JavaSmaCCRecordPatternTest >> testTypePatternIsStillOneOfItsOwn [

	| model |
	model := self parseClassString: 'class Patterns { void m(Object o) { if (o instanceof Integer i) { } } }'.

	self assert: (model allWithType: FASTJavaRecordPattern) isEmpty.
	self assert: (model allWithType: FASTJavaTypePattern) anyOne variable name equals: 'i'
]
