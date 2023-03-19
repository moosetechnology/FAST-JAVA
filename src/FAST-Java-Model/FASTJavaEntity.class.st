Class {
	#name : #FASTJavaEntity,
	#superclass : #MooseEntity,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FASTJavaEntity class >> isAbstract [

	<generated>
	^ self == FASTJavaEntity
]

{ #category : #meta }
FASTJavaEntity class >> metamodel [

	<generated>
	^ FASTJavaModel metamodel
]

{ #category : #testing }
FASTJavaEntity >> isStatement [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FASTJavaEntity >> miASTExtension [

	<inspectorPresentationOrder: 150 title: 'AST'>
	^ SpTreeTablePresenter new
		  addColumn: (SpCompositeTableColumn new
				   addColumn: ((SpImageTableColumn evaluated: #midasIcon)
						    width: 20;
						    yourself);
				   addColumn: (SpStringTableColumn evaluated: [ :node | 
						    (node sourceText isNotNil and: [ 
							     node startPos isNotNil and: [ node isNotNil ] ])
							    ifFalse: [ node class name allButFirst: 8 ]
							    ifTrue: [ 
								    (node class name allButFirst: 8) , ': '
								    ,
								    (node sourceText copyFrom: node startPos to: node endPos) ] ]);
				   yourself);
		  children: [ :aClass | 
			  aClass children asOrderedCollection sorted: [ :a :b | 
				  (a startPos ifNil: 0) <= (b startPos ifNil: 0) ] ];
		  beMultipleSelection;
		  roots: { self };
		  beResizable
]
