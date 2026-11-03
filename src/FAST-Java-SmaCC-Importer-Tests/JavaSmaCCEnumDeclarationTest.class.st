Class {
	#name : 'JavaSmaCCEnumDeclarationTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCEnumDeclarationTest >> javaClass [
	^ 'private enum MyEnum {

	INFORMATION_EMPTY("INFO_EMPTY");

	private String label = null;

	/**
	* Constructeur
	*
	* @param label
	**/
	private MyEnum(final String label) {
		setLabel(label);
	}

	public String setLabel(String label) {
		return this.label = label;
	}

	public String getLabel() {
		return this.label;
	}
}'
]

{ #category : 'tests' }
JavaSmaCCEnumDeclarationTest >> testConstantArgumentsInEnum [

	self assert: (fastModel allWithType: FASTJavaEnumConstant) anyOne arguments anyOne primitiveValue equals: 'INFO_EMPTY'
]

{ #category : 'tests' }
JavaSmaCCEnumDeclarationTest >> testConstantNameInEnum [
	self assert: (fastModel allWithType: FASTJavaEnumConstant) anyOne name equals: 'INFORMATION_EMPTY'
]

{ #category : 'tests' }
JavaSmaCCEnumDeclarationTest >> testEnumConstantIsNotAVariableExpression [
	"JLS 8.9.1: a constant declares a name, writes arguments and may write a class body. It
	is a declaration, not a name used as a value."

	| constant |
	constant := (fastModel allWithType: FASTJavaEnumConstant) anyOne.
	self deny: (constant isKindOf: FASTJavaVariableExpression).
	self assert: constant name isNotNil
]

{ #category : 'tests' }
JavaSmaCCEnumDeclarationTest >> testEnumDeclarationName [
	self assert: ( fastModel allWithType: FASTJavaEnumDeclaration) anyOne name equals: 'MyEnum' 
]

{ #category : 'tests' }
JavaSmaCCEnumDeclarationTest >> testNumberOfConstantsInEnum [
	self assert: ( fastModel allWithType: FASTJavaEnumDeclaration) anyOne constants size equals: 1
]

{ #category : 'tests' }
JavaSmaCCEnumDeclarationTest >> testNumberOfDeclarationsInEnum [
	self
		assert: ( fastModel allWithType: FASTJavaEnumDeclaration) anyOne declarations size
		equals: 4
]

{ #category : 'tests' }
JavaSmaCCEnumDeclarationTest >> testNumberOfEnumDeclaration [
	self assert: ( fastModel allWithType: FASTJavaEnumDeclaration) size equals: 1
]
