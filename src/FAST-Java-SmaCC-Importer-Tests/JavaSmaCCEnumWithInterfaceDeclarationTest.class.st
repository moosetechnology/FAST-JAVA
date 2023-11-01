Class {
	#name : #JavaSmaCCEnumWithInterfaceDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCEnumWithInterfaceDeclarationTest >> enumString [
	^ 'class A {
	private enum MyEnum implements Serializable { 
		
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

{ #category : #accessing }
JavaSmaCCEnumWithInterfaceDeclarationTest >> javaMethod [
	^ self shouldNotImplement
]

{ #category : #running }
JavaSmaCCEnumWithInterfaceDeclarationTest >> setUp [
	"not doing anything because we want to call parsing in the test itself"
]

{ #category : #tests }
JavaSmaCCEnumWithInterfaceDeclarationTest >> testCanParseEnumDeclarationText [

	self
		shouldnt: [ self parseClassString: self enumString ]
		raise: Error
]
