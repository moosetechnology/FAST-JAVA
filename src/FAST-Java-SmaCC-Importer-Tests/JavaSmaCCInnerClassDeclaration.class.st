Class {
	#name : #JavaSmaCCInnerClassDeclaration,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCInnerClassDeclaration >> javaMethod [
	
	^ 'void method() {
		public class ClassA extends ClassB implements InterfaceA, InterfaceB { 
		
			int aFieldDeclaration;
			Banane b = new Banane();
			
			void innerMethod(){
			}
		}
	}'
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testClassDeclarationName [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) anyOne name equals: 'ClassA' 
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclaration [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) size equals: 1
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationDeclaration [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) anyOne declarations size equals: 3
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationInterfaces [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) anyOne interfaces size equals: 2 
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationModifiers [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) anyOne modifiers size equals: 1 
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationSuperClass [
	self assert: ( fastMethod mooseModel allWithType: FASTJavaClassDeclaration) anyOne superclass class equals: FASTJavaClassTypeExpression 
]
