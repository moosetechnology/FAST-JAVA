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

{ #category : #running }
JavaSmaCCInnerClassDeclaration >> testClassDeclarationName [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) anyOne name equals: 'ClassA' 
]

{ #category : #running }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclaration [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) size equals: 1
]

{ #category : #running }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationDeclaration [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) anyOne declarations size equals: 3
]

{ #category : #running }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationInterfaces [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) anyOne interfaces size equals: 2 
]

{ #category : #running }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationModifiers [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) anyOne modifiers size equals: 1 
]

{ #category : #running }
JavaSmaCCInnerClassDeclaration >> testNumberOfClassDeclarationSuperClass [
	self assert: ( innerClassDeclaration mooseModel allWithType: FASTJavaClassDeclaration) anyOne superclass class equals: FASTJavaClassTypeExpression 
]
