Class {
	#name : 'JavaSmaCCEnumWithInterfaceDeclarationTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCEnumWithInterfaceDeclarationTest >> javaClass [
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

{ #category : 'running' }
JavaSmaCCEnumWithInterfaceDeclarationTest >> setUp [
	"not doing anything because we want to call parsing in the test itself"
]

{ #category : 'tests' }
JavaSmaCCEnumWithInterfaceDeclarationTest >> testCanParseEnumDeclarationText [

	self
		shouldnt: [ self parseClassString: self javaClass ]
		raise: Error
]
