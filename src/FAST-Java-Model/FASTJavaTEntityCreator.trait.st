Trait {
	#name : #FASTJavaTEntityCreator,
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newAnnotation [

	^ self add: FASTJavaAnnotation new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newAssignmentExpression [

	^ self add: FASTJavaAssignmentExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newBooleanLiteral [

	^ self add: FASTJavaBooleanLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newBooleanTypeExpression [

	^ self add: FASTJavaBooleanTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newByteTypeExpression [

	^ self add: FASTJavaByteTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newCharTypeExpression [

	^ self add: FASTJavaCharTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newClassDeclaration [

	^ self add: FASTJavaClassDeclaration new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newClassProperty [

	^ self add: FASTJavaClassProperty new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newClassTypeExpression [

	^ self add: FASTJavaClassTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newDoubleTypeExpression [

	^ self add: FASTJavaDoubleTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newExpressionStatement [

	^ self add: FASTJavaExpressionStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newFloatTypeExpression [

	^ self add: FASTJavaFloatTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newIdentifier [

	^ self add: FASTJavaIdentifier new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newIntTypeExpression [

	^ self add: FASTJavaIntTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newIntegerLiteral [

	^ self add: FASTJavaIntegerLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newLongTypeExpression [

	^ self add: FASTJavaLongTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newMethodEntity [

	^ self add: FASTJavaMethodEntity new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newMethodInvocation [

	^ self add: FASTJavaMethodInvocation new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newModifier [

	^ self add: FASTJavaModifier new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newNewClassExpression [

	^ self add: FASTJavaNewClassExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newNewExpression [

	^ self add: FASTJavaNewExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newNullLiteral [

	^ self add: FASTJavaNullLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newShortTypeExpression [

	^ self add: FASTJavaShortTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newStatementBlock [

	^ self add: FASTJavaStatementBlock new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newStringLiteral [

	^ self add: FASTJavaStringLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newTypeName [

	^ self add: FASTJavaTypeName new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newVarDeclStatement [

	^ self add: FASTJavaVarDeclStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newVariableDeclarator [

	^ self add: FASTJavaVariableDeclarator new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newVariableExpression [

	^ self add: FASTJavaVariableExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newVoidTypeExpression [

	^ self add: FASTJavaVoidTypeExpression new
]
