Class {
	#name : 'JavaSmaCCDiamondNewTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCDiamondNewTest >> creationOf: aTypeName [

	^ (fastModel allWithType: FASTJavaNewExpression) detect: [ :each |
		  each type fullName = aTypeName ]
]

{ #category : 'resources' }
JavaSmaCCDiamondNewTest >> javaMethod [
	^ 'void newMethod() {
	List<String> inferred = new ArrayList<>();
	List<String> written = new LinkedList<String>();
	List raw = new Vector();
}'
]

{ #category : 'tests' }
JavaSmaCCDiamondNewTest >> testCreationWritingItsArgumentsHasNoDiamond [
	"JLS 15.9.1: a creation writing its type arguments asks for none to be inferred."

	self deny: (self creationOf: 'LinkedList') isDiamond.
	self assert: (self creationOf: 'LinkedList') type arguments size equals: 1
]

{ #category : 'tests' }
JavaSmaCCDiamondNewTest >> testCreationWritingNoAngleBracketsHasNoDiamond [
	"JLS 4.8: a creation writing neither arguments nor brackets instantiates the raw type."

	self deny: (self creationOf: 'Vector') isDiamond.
	self assert: (self creationOf: 'Vector') type arguments isEmpty
]

{ #category : 'tests' }
JavaSmaCCDiamondNewTest >> testCreationWritingTheDiamondKeepsIt [
	"JLS 15.9.1: the diamond is the two angle brackets with no argument between them, and
	it asks for the arguments to be inferred; it is not the absence of arguments."

	self assert: (self creationOf: 'ArrayList') isDiamond.
	self assert: (self creationOf: 'ArrayList') type arguments isEmpty
]
