"
I check that a compilation unit writing nothing but comments (JLS 7.3) is the empty range at the end of its source, rather than a range that ends before it starts.
"
Class {
	#name : 'JavaSmaCCCommentOnlyUnitTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCCommentOnlyUnitTest >> javaClass [

	^ '// class Disabled {
// }'
]

{ #category : 'tests' }
JavaSmaCCCommentOnlyUnitTest >> testTheUnitIsTheEmptyRangeAtTheEnd [

	| unit |
	unit := (fastModel allWithType: FASTJavaCompilationUnit) anyOne.
	self assert: unit startPos equals: self javaClass size + 1.
	self assert: unit endPos equals: self javaClass size
]
