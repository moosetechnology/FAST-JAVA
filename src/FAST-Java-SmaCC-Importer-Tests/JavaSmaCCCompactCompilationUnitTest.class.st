Class {
	#name : 'JavaSmaCCCompactCompilationUnitTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCCompactCompilationUnitTest >> javaClass [

	^ 'int x = 1;

void main() { }

class Test { }'
]

{ #category : 'tests' }
JavaSmaCCCompactCompilationUnitTest >> testAnOrdinaryUnitWritesNoMemberOfItsOwn [

	| model unit |
	model := self parseClassString: 'class Test { int x = 1; void main() { } }'.
	unit := (model allWithType: FASTJavaCompilationUnit) anyOne.

	self assert: unit methodDeclarations isEmpty.
	self assert: unit fieldDeclarations isEmpty.
	self assert: unit classDeclarations size equals: 1
]

{ #category : 'tests' }
JavaSmaCCCompactCompilationUnitTest >> testTheMembersAndTheTypeReachTheUnit [
	"JLS 7.3: a compact compilation unit declares no type. It writes the members of the
	class it implies, and may write type declarations beside them."

	| unit |
	unit := (fastModel allWithType: FASTJavaCompilationUnit) anyOne.

	self assert: unit fieldDeclarations size equals: 1.
	self assert: unit fieldDeclarations anyOne declarators anyOne variable name equals: 'x'.
	self assert: unit methodDeclarations size equals: 1.
	self assert: unit methodDeclarations anyOne name equals: 'main'.
	self assert: unit classDeclarations size equals: 1.
	self assert: unit classDeclarations anyOne name equals: 'Test'
]
