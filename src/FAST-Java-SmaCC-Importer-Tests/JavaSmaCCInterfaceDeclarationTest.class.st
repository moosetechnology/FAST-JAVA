Class {
	#name : #JavaSmaCCInterfaceDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCInterfaceDeclarationTest >> interfaceString [
	^ 'class A {
	public interface MyInterface {

    public static final String CODE = "SEME";

}
}' 
]

{ #category : #tests }
JavaSmaCCInterfaceDeclarationTest >> testCanParseInterfaceDeclarationText [

"	self
		shouldnt: [ "self parseClassString: self interfaceString "]"
		"raise: Error"
]
