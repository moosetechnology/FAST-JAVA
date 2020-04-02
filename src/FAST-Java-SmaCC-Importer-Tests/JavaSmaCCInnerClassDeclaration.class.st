Class {
	#name : #JavaSmaCCInnerClassDeclaration,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'innerClassDeclaration'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCInnerClassDeclaration >> methodInnerClassDeclaration [
	
	^ 'void method() {
		public class ClassA extends ClassB implements InterfaceA, InterfaceB { 
		
			int aFieldDeclaration;
			Banane b = new Banane();
			
			void innerMethod(){
			}
		}
	}'
]

{ #category : #running }
JavaSmaCCInnerClassDeclaration >> setUp [
	super setUp.
	innerClassDeclaration := (self parseMethod: 'InnerClassDeclaration') allFASTJavaMethodEntity
		first
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testClassDeclarationName [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) anyOne name equals: 'ClassA' 
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclaration [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) size equals: 1
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationDeclaration [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) anyOne declarations size equals: 3
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationInterfaces [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) anyOne interfaces size equals: 2 
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationModifiers [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) anyOne modifiers size equals: 1 
]

{ #category : #tests }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationSuperClass [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) anyOne superclass class equals: FASTJavaClassTypeExpression 
]
