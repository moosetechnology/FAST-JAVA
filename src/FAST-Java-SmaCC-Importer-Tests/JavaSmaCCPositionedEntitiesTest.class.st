"
I check that every entity the importer creates says where it is written. Comments are attached to the entity closest to them, which they find by position, so a single entity without one made the import of a file holding any comment fail.
"
Class {
	#name : 'JavaSmaCCPositionedEntitiesTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCPositionedEntitiesTest >> javaClass [

	^ 'class Positions {

	int matrix[][]; // brackets after a name

	int values() [] { return null; } // brackets after a parameter list

	void varargs(String... labels) { } // an ellipsis

	int rule(int i) {
		return switch (i) { case 1 -> 1; default -> 0; }; // switch rules
	}

	int[] creation() { return new int[2]; } // a creation saying a length
}'
]

{ #category : 'running' }
JavaSmaCCPositionedEntitiesTest >> parseClassString: aString [

	^ JavaSmaCCProgramNodeImporterVisitor new
		  withComments;
		  parseCodeString: aString
]

{ #category : 'tests' }
JavaSmaCCPositionedEntitiesTest >> testEveryCommentIsAttached [

	| comments |
	comments := fastModel allWithType: FASTJavaComment.
	self assert: comments size equals: 5.
	self assert: (comments allSatisfy: [ :comment | comment container isNotNil ])
]

{ #category : 'tests' }
JavaSmaCCPositionedEntitiesTest >> testEveryEntityKnowsWhereItIsWritten [

	| unplaced |
	unplaced := fastModel entities reject: [ :entity | entity startPos isNotNil and: [ entity endPos isNotNil ] ].
	self assert: (unplaced collect: [ :entity | entity class name ]) asArray equals: #(  )
]
