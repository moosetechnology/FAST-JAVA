Class {
	#name : #JavaSmaCCEmptyMethodDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCEmptyMethodDeclarationTest >> javaMethod [
	^ 'void newMethod() {
	new Patate() {
		public void onSuccess(){
			System.out.println("Success");
		}
		;
		
		public void onFail(){
			System.out.println("Fail");
		}
	};
}'
]

{ #category : #tests }
JavaSmaCCEmptyMethodDeclarationTest >> testEmptyDeclaredMethodSize [
	self assert: (fastModel allWithType: FASTJavaEmptyMethodDeclaration) size equals: 1
]
