Class {
	#name : #JavaSmaCCInterfaceDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCInterfaceDeclarationTest >> javaMethod [
	^'void method() {
	public interface MyInterface {

    public static final String CODE = "SEME";

	void someMethod();
}
}' 
]

{ #category : #tests }
JavaSmaCCInterfaceDeclarationTest >> testInterfaceDeclarationName [
	self assert: (fastMethod mooseModel allWithType: FASTJavaInterfaceDeclaration) anyOne name equals: 'MyInterface'
]

{ #category : #tests }
JavaSmaCCInterfaceDeclarationTest >> testInterfaceMethodDeclarationName [
	self assert:
		((fastMethod mooseModel allWithType: FASTJavaInterfaceDeclaration)
			anyOne declarations
				select: [ :decl | decl class = FASTJavaMethodEntity ]) anyOne name
			equals: 'someMethod'
]

{ #category : #tests }
JavaSmaCCInterfaceDeclarationTest >> testInterfaceMethodDeclarationType [
	self assert:
		((fastMethod mooseModel allWithType: FASTJavaInterfaceDeclaration)
			anyOne declarations
				select: [ :decl | decl class = FASTJavaMethodEntity ]) anyOne type class
			equals: FASTJavaVoidTypeExpression
]

{ #category : #tests }
JavaSmaCCInterfaceDeclarationTest >> testNumberOfDeclarationsInInterface [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaInterfaceDeclaration) anyOne declarations size equals: 2
]

{ #category : #tests }
JavaSmaCCInterfaceDeclarationTest >> testNumberOfInterfaceDeclaration [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaInterfaceDeclaration) size equals: 1
]

{ #category : #tests }
JavaSmaCCInterfaceDeclarationTest >> testNumberOfInterfaceMethodDeclarations [
	self assert:
		((fastMethod mooseModel allWithType: FASTJavaInterfaceDeclaration)
			anyOne declarations
				select: [ :decl | decl class = FASTJavaMethodEntity ]) size
			equals: 1
]
