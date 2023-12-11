Class {
	#name : #FASTJavaDifferentialValidator,
	#superclass : #FASTDifferentialValidator,
	#category : #'FAST-Java-Tools'
}

{ #category : #running }
FASTJavaDifferentialValidator >> getASTFromString: string [

	^ JavaSmaCCProgramNodeImporterVisitor new
		  accept: (JavaParser parse: string);
		  model
]

{ #category : #utilities }
FASTJavaDifferentialValidator >> getTopLevelNodes: model [

	^model allWithSubTypesOfAny: {
		FASTJavaClassDeclaration.
		FASTJavaInterfaceDeclaration.
		FASTJavaEnumDeclaration
	}
]

{ #category : #testing }
FASTJavaDifferentialValidator >> isSourceFile: aFileReference [

	^aFileReference extension = 'java'
]

{ #category : #utilities }
FASTJavaDifferentialValidator >> reExportAST: ast [

	^FASTJavaExportVisitor new
		export: ast
]
