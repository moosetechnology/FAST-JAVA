Extension { #name : #MooseAbstractGroup }

{ #category : #'*FAST-Java-Model-Extension' }
MooseAbstractGroup >> allFASTJavaClassDeclaration [
	<navigation: 'All FASTJava class declarations'>
	<package: #FAST>
	^ self allWithType: FASTJavaClassDeclaration
]

{ #category : #'*FAST-Java-Model-Extension' }
MooseAbstractGroup >> allFASTJavaIdentifier [
	<navigation: 'All FASTJava identifiers'>
	<package: #FAST>
	^ self allWithType: FASTJavaIdentifier
]

{ #category : #'*FAST-Java-Model-Extension' }
MooseAbstractGroup >> allFASTJavaMethodEntity [
	<navigation: 'All FASTJava method entities'>
	<package: #FAST>
	^ self allWithType: FASTJavaMethodEntity
]
