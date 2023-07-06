Class {
	#name : #JavaSmaCCEnumDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> enumString [
	^ 'class A {
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

{ #category : #running }
JavaSmaCCEnumDeclarationTest >> setUp [
	"not doing anything because we want to call parsing in the test itself"
]

{ #category : #tests }
JavaSmaCCEnumDeclarationTest >> testCanParseEnumDeclarationText [

	self
		shouldnt: [ self parseClassString: self enumString ]
		raise: Error
]
