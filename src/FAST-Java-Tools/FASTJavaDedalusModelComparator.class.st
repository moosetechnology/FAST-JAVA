"
A differential validator specialized for Dedalus code with files and position where we know that the differences are acceptable
"
Class {
	#name : #FASTJavaDedalusModelComparator,
	#superclass : #AnObsoleteFamixModelComparator,
	#category : #'FAST-Java-Tools'
}

{ #category : #running }
FASTJavaDedalusModelComparator >> ast: ast1 acceptableDifferenceTo: ast2 [

	^(ast1 class = FASTJavaInfixOperation) 
		or: [ ast2 class = FASTJavaInfixOperation ]
]

{ #category : #comparison }
FASTJavaDedalusModelComparator >> ast: node1 acceptableDifferenceTo: node2 property: property [
	"returns nil if the difference is not acceptable
	 otherwise, must return  a block testing where the comparison process might resume"

	((property implementingSelector = #operator) and:
	[ (FASTJavaExportVisitor new export: node1) = (FASTJavaExportVisitor new export: node2) ])

	ifTrue: [ "difference in condition, go back to parent statement "
			^[:a :b | a class uses: FASTTStatement ] ].
	
	
	((property implementingSelector = #operator) and:
	[ node1 class = FASTJavaInfixOperation and: 
	[ node1 infixOperationLeftOperandOwner isNotNil and: 
	[ node2 class = FASTJavaInfixOperation and: 
	[ node2 infixOperationLeftOperandOwner isNotNil ]]]])

	ifTrue: [ "difference in condition, go back to parent statement "
			^[:a :b | self class usesTrait: FASTTStatement ] ].
	
	^nil
]
