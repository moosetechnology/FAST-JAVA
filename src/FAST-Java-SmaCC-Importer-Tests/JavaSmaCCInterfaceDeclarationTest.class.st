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

{ #category : #accessing }
JavaSmaCCInterfaceDeclarationTest >> javaMethod [
	^ self shouldBeImplemented
]

{ #category : #tests }
JavaSmaCCInterfaceDeclarationTest >> setUp [
	"not doing anything because we want to call parsing in the test itself"
]

{ #category : #tests }
JavaSmaCCInterfaceDeclarationTest >> testCanParseInterfaceDeclarationText [

"	self
		shouldnt: [ "self parseClassString: self interfaceString "]"
		"raise: Error"
]
