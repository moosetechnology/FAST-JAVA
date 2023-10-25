Class {
	#name : #JavaSmaCCEnumDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCEnumDeclarationTest >> javaMethod [
	^ 'void method() {
	private enum MyEnum { 
		
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
	}
}' 
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testConstantNameInEnum [
	self assert: (fastMethod mooseModel allWithType: FASTJavaEnumConstant) anyOne name equals: 'INFORMATION_EMPTY'
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testEnumDeclarationName [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaEnumDeclaration) anyOne name equals: 'MyEnum' 
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testNumberOfConstantsInEnum [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaEnumDeclaration) anyOne constants size equals: 1
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testNumberOfDeclarationsInEnum [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaEnumDeclaration) anyOne declarations size equals: 4
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testNumberOfEnumDeclaration [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaEnumDeclaration) size equals: 1
]
