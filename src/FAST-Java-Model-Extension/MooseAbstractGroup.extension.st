Extension { #name : #MooseAbstractGroup }

{ #category : #'*FAST-Java-Model-Extension' }
MooseAbstractGroup >> allFASTJavaIdentifier [
	<navigation: 'All FAST java identifier'>
	<package: #FAST>
	^ self allWithType: FASTJavaIdentifier
]

{ #category : #'*FAST-Java-Model-Extension' }
MooseAbstractGroup >> allFASTJavaMethodEntity [
	<navigation: 'All FAST java method entity'>
	<package: #FAST>
	^ self allWithType: FASTJavaMethodEntity
]
