Class {
	#name : #JavaSmaCCEnumDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCEnumDeclarationTest >> enumString [

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

{ #category : #running }
JavaSmaCCEnumDeclarationTest >> javaMethod [
	^self shouldNotImplement
]

{ #category : #running }
JavaSmaCCEnumDeclarationTest >> setUp [

	fastModel := self parseClassString: self enumString
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testConstantNameInEnum [
	self assert: (fastModel allWithType: FASTJavaEnumConstant) anyOne name equals: 'INFORMATION_EMPTY'
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testEnumDeclarationName [
	self assert: ( fastModel allWithType: FASTJavaEnumDeclaration) anyOne name equals: 'MyEnum' 
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testNumberOfConstantsInEnum [
	self assert: ( fastModel allWithType: FASTJavaEnumDeclaration) anyOne constants size equals: 1
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testNumberOfDeclarationsInEnum [
	self
		assert: ( fastModel allWithType: FASTJavaEnumDeclaration) anyOne declarations size
		equals: 4
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testNumberOfEnumDeclaration [
	self assert: ( fastModel allWithType: FASTJavaEnumDeclaration) size equals: 1
]
