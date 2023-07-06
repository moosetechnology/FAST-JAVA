Class {
	#name : #JavaSmaCCFieldDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCFieldDeclarationTest >> javaMethod [
	
	^ 'String fieldDeclaration() {
		Patate p = new Patate() { 
			public final int i = 3, j;
		};
	}'
]

{ #category : #tests }
JavaSmaCCFieldDeclarationTest >> testFieldDeclarationModifiers [

	self
		assert:
		(fastMethod mooseModel allWithType: FASTJavaModifier) size
		equals: 2 "public final"
]

{ #category : #tests }
JavaSmaCCFieldDeclarationTest >> testFieldDeclarationParent [
	self
		assert: fastMethod statements first declarators first expression parentNode
		equals: fastMethod statements first declarators first
]

{ #category : #tests }
JavaSmaCCFieldDeclarationTest >> testFieldDeclarationSize [
	"2 with Patate p"
	self assert: (fastMethod mooseModel allWithType: FASTJavaVarDeclStatement) size equals: 2.
	"3 with Patate p"
	self assert: (fastMethod mooseModel allWithType: FASTJavaVariableDeclarator) size equals: 3.
	
]
