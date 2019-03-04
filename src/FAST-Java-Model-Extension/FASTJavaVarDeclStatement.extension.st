Extension { #name : #FASTJavaVarDeclStatement }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaVarDeclStatement >> addDeclarator: aDeclarator [
	self childrenNode add: aDeclarator
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaVarDeclStatement >> declarators [
	<navigation: 'FASTJavaVariableDeclarator'>
	^ self childrenNode select: [ :child | child class isKindOf: FASTJavaVariableDeclarator class ]
]
