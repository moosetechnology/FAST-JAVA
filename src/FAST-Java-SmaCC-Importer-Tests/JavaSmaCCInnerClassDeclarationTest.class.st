Class {
	#name : 'JavaSmaCCInnerClassDeclarationTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCInnerClassDeclarationTest >> javaMethod [
	
	^ 'void method() {
		public class ClassA extends ClassB implements InterfaceA, InterfaceB { 

			int aFieldDeclaration;
			Banane b = new Banane();

			void innerMethod(){
			}
		}
	}'
]

{ #category : 'tests' }
JavaSmaCCInnerClassDeclarationTest >> testClassDeclarationName [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) anyOne name equals: 'ClassA' 
]

{ #category : 'tests' }
JavaSmaCCInnerClassDeclarationTest >> testNumberOfClassDeclaration [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCInnerClassDeclarationTest >> testNumberOfClassDeclarationDeclaration [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) anyOne declarations size equals: 3
]

{ #category : 'tests' }
JavaSmaCCInnerClassDeclarationTest >> testNumberOfClassDeclarationInterfaces [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) anyOne interfaces size equals: 2 
]

{ #category : 'tests' }
JavaSmaCCInnerClassDeclarationTest >> testNumberOfClassDeclarationModifiers [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) anyOne modifiers size equals: 1 
]

{ #category : 'tests' }
JavaSmaCCInnerClassDeclarationTest >> testNumberOfClassDeclarationSuperClass [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) anyOne superclass class equals: FASTJavaClassTypeExpression 
]
