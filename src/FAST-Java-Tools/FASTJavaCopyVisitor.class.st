Class {
	#name : 'FASTJavaCopyVisitor',
	#superclass : 'FASTJavaVisitor',
	#category : 'FAST-Java-Tools',
	#package : 'FAST-Java-Tools'
}

{ #category : 'instance creation' }
FASTJavaCopyVisitor class >> on: anAST [

	^anAST accept: self new
]

{ #category : 'copying' }
FASTJavaCopyVisitor >> copy: aNode [

	aNode ifNil: [ ^nil ].
	aNode isLiteral ifTrue: [ ^aNode ].
	aNode isCollection ifFalse: [ ^aNode accept: self ].
	^aNode collect: [ :each | self copy: each ]

]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaAnnotation: aFASTJavaAnnotation [
	<generated>
	| copy |
	copy := FASTJavaAnnotation new
		comments: (self copy: aFASTJavaAnnotation comments) ;
		name: (self copy: aFASTJavaAnnotation name) ;
		elements: (self copy: aFASTJavaAnnotation elements) ;
		numberOfComments: (self copy: aFASTJavaAnnotation numberOfComments) ;
		invokedIn: (self copy: aFASTJavaAnnotation invokedIn) ;
		startPos: (self copy: aFASTJavaAnnotation startPos) ;
		endPos: (self copy: aFASTJavaAnnotation endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaAnnotation.
	aFASTJavaAnnotation attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaArrayAccess: aFASTJavaArrayAccess [
	<generated>
	| copy |
	copy := FASTJavaArrayAccess new
		comments: (self copy: aFASTJavaArrayAccess comments) ;
		expression: (self copy: aFASTJavaArrayAccess expression) ;
		numberOfComments: (self copy: aFASTJavaArrayAccess numberOfComments) ;
		startPos: (self copy: aFASTJavaArrayAccess startPos) ;
		endPos: (self copy: aFASTJavaArrayAccess endPos) ;
		array: (self copy: aFASTJavaArrayAccess array) ;
		assignedIn: (self copy: aFASTJavaArrayAccess assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaArrayAccess.
	aFASTJavaArrayAccess attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaArrayAnnotationElement: aFASTJavaArrayAnnotationElement [
	<generated>
	| copy |
	copy := FASTJavaArrayAnnotationElement new
		comments: (self copy: aFASTJavaArrayAnnotationElement comments) ;
		values: (self copy: aFASTJavaArrayAnnotationElement values) ;
		numberOfComments: (self copy: aFASTJavaArrayAnnotationElement numberOfComments) ;
		startPos: (self copy: aFASTJavaArrayAnnotationElement startPos) ;
		endPos: (self copy: aFASTJavaArrayAnnotationElement endPos) ;
		assignedIn: (self copy: aFASTJavaArrayAnnotationElement assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaArrayAnnotationElement.
	aFASTJavaArrayAnnotationElement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaArrayInitializer: aFASTJavaArrayInitializer [
	<generated>
	| copy |
	copy := FASTJavaArrayInitializer new
		comments: (self copy: aFASTJavaArrayInitializer comments) ;
		numberOfComments: (self copy: aFASTJavaArrayInitializer numberOfComments) ;
		initializers: (self copy: aFASTJavaArrayInitializer initializers) ;
		startPos: (self copy: aFASTJavaArrayInitializer startPos) ;
		endPos: (self copy: aFASTJavaArrayInitializer endPos) ;
		assignedIn: (self copy: aFASTJavaArrayInitializer assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaArrayInitializer.
	aFASTJavaArrayInitializer attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaArrayTypeExpression: aFASTJavaArrayTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaArrayTypeExpression new
		comments: (self copy: aFASTJavaArrayTypeExpression comments) ;
		name: (self copy: aFASTJavaArrayTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaArrayTypeExpression numberOfComments) ;
		baseType: (self copy: aFASTJavaArrayTypeExpression baseType) ;
		startPos: (self copy: aFASTJavaArrayTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaArrayTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaArrayTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaArrayTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaArrayTypeExpression.
	aFASTJavaArrayTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaAssertStatement: aFASTJavaAssertStatement [
	<generated>
	| copy |
	copy := FASTJavaAssertStatement new
		comments: (self copy: aFASTJavaAssertStatement comments) ;
		condition: (self copy: aFASTJavaAssertStatement condition) ;
		message: (self copy: aFASTJavaAssertStatement message) ;
		numberOfComments: (self copy: aFASTJavaAssertStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaAssertStatement startPos) ;
		endPos: (self copy: aFASTJavaAssertStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaAssertStatement.
	aFASTJavaAssertStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaAssignmentExpression: aFASTJavaAssignmentExpression [
	<generated>
	| copy |
	copy := FASTJavaAssignmentExpression new
		comments: (self copy: aFASTJavaAssignmentExpression comments) ;
		variable: (self copy: aFASTJavaAssignmentExpression variable) ;
		expression: (self copy: aFASTJavaAssignmentExpression expression) ;
		numberOfComments: (self copy: aFASTJavaAssignmentExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaAssignmentExpression startPos) ;
		endPos: (self copy: aFASTJavaAssignmentExpression endPos) ;
		operator: (self copy: aFASTJavaAssignmentExpression operator) ;
		assignedIn: (self copy: aFASTJavaAssignmentExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaAssignmentExpression.
	aFASTJavaAssignmentExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaBooleanLiteral: aFASTJavaBooleanLiteral [
	<generated>
	| copy |
	copy := FASTJavaBooleanLiteral new
		comments: (self copy: aFASTJavaBooleanLiteral comments) ;
		primitiveValue: (self copy: aFASTJavaBooleanLiteral primitiveValue) ;
		numberOfComments: (self copy: aFASTJavaBooleanLiteral numberOfComments) ;
		startPos: (self copy: aFASTJavaBooleanLiteral startPos) ;
		endPos: (self copy: aFASTJavaBooleanLiteral endPos) ;
		assignedIn: (self copy: aFASTJavaBooleanLiteral assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaBooleanLiteral.
	aFASTJavaBooleanLiteral attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaBooleanTypeExpression: aFASTJavaBooleanTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaBooleanTypeExpression new
		comments: (self copy: aFASTJavaBooleanTypeExpression comments) ;
		name: (self copy: aFASTJavaBooleanTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaBooleanTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaBooleanTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaBooleanTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaBooleanTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaBooleanTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaBooleanTypeExpression.
	aFASTJavaBooleanTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaBreakStatement: aFASTJavaBreakStatement [
	<generated>
	| copy |
	copy := FASTJavaBreakStatement new
		comments: (self copy: aFASTJavaBreakStatement comments) ;
		numberOfComments: (self copy: aFASTJavaBreakStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaBreakStatement startPos) ;
		endPos: (self copy: aFASTJavaBreakStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaBreakStatement.
	aFASTJavaBreakStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaByteTypeExpression: aFASTJavaByteTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaByteTypeExpression new
		comments: (self copy: aFASTJavaByteTypeExpression comments) ;
		name: (self copy: aFASTJavaByteTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaByteTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaByteTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaByteTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaByteTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaByteTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaByteTypeExpression.
	aFASTJavaByteTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaCaseStatement: aFASTJavaCaseStatement [
	<generated>
	| copy |
	copy := FASTJavaCaseStatement new
		comments: (self copy: aFASTJavaCaseStatement comments) ;
		statements: (self copy: aFASTJavaCaseStatement statements) ;
		numberOfComments: (self copy: aFASTJavaCaseStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaCaseStatement startPos) ;
		endPos: (self copy: aFASTJavaCaseStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaCaseStatement.
	aFASTJavaCaseStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	<generated>
	| copy |
	copy := FASTJavaCastExpression new
		comments: (self copy: aFASTJavaCastExpression comments) ;
		type: (self copy: aFASTJavaCastExpression type) ;
		expression: (self copy: aFASTJavaCastExpression expression) ;
		numberOfComments: (self copy: aFASTJavaCastExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaCastExpression startPos) ;
		endPos: (self copy: aFASTJavaCastExpression endPos) ;
		assignedIn: (self copy: aFASTJavaCastExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaCastExpression.
	aFASTJavaCastExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [
	<generated>
	| copy |
	copy := FASTJavaCatchPartStatement new
		comments: (self copy: aFASTJavaCatchPartStatement comments) ;
		catchedTypes: (self copy: aFASTJavaCatchPartStatement catchedTypes) ;
		body: (self copy: aFASTJavaCatchPartStatement body) ;
		parameter: (self copy: aFASTJavaCatchPartStatement parameter) ;
		numberOfComments: (self copy: aFASTJavaCatchPartStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaCatchPartStatement startPos) ;
		endPos: (self copy: aFASTJavaCatchPartStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaCatchPartStatement.
	aFASTJavaCatchPartStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaCharTypeExpression: aFASTJavaCharTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaCharTypeExpression new
		comments: (self copy: aFASTJavaCharTypeExpression comments) ;
		name: (self copy: aFASTJavaCharTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaCharTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaCharTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaCharTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaCharTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaCharTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaCharTypeExpression.
	aFASTJavaCharTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaCharacterLiteral: aFASTJavaCharacterLiteral [
	<generated>
	| copy |
	copy := FASTJavaCharacterLiteral new
		comments: (self copy: aFASTJavaCharacterLiteral comments) ;
		primitiveValue: (self copy: aFASTJavaCharacterLiteral primitiveValue) ;
		numberOfComments: (self copy: aFASTJavaCharacterLiteral numberOfComments) ;
		startPos: (self copy: aFASTJavaCharacterLiteral startPos) ;
		endPos: (self copy: aFASTJavaCharacterLiteral endPos) ;
		assignedIn: (self copy: aFASTJavaCharacterLiteral assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaCharacterLiteral.
	aFASTJavaCharacterLiteral attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaClassDeclaration: aFASTJavaClassDeclaration [
	<generated>
	| copy |
	copy := FASTJavaClassDeclaration new
		declarations: (self copy: aFASTJavaClassDeclaration declarations) ;
		comments: (self copy: aFASTJavaClassDeclaration comments) ;
		superclass: (self copy: aFASTJavaClassDeclaration superclass) ;
		name: (self copy: aFASTJavaClassDeclaration name) ;
		interfaces: (self copy: aFASTJavaClassDeclaration interfaces) ;
		modifiers: (self copy: aFASTJavaClassDeclaration modifiers) ;
		numberOfComments: (self copy: aFASTJavaClassDeclaration numberOfComments) ;
		invokedIn: (self copy: aFASTJavaClassDeclaration invokedIn) ;
		startPos: (self copy: aFASTJavaClassDeclaration startPos) ;
		endPos: (self copy: aFASTJavaClassDeclaration endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaClassDeclaration.
	aFASTJavaClassDeclaration attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	<generated>
	| copy |
	copy := FASTJavaClassProperty new
		comments: (self copy: aFASTJavaClassProperty comments) ;
		invokedIn: (self copy: aFASTJavaClassProperty invokedIn) ;
		type: (self copy: aFASTJavaClassProperty type) ;
		name: (self copy: aFASTJavaClassProperty name) ;
		numberOfComments: (self copy: aFASTJavaClassProperty numberOfComments) ;
		startPos: (self copy: aFASTJavaClassProperty startPos) ;
		fieldName: (self copy: aFASTJavaClassProperty fieldName) ;
		endPos: (self copy: aFASTJavaClassProperty endPos) ;
		assignedIn: (self copy: aFASTJavaClassProperty assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaClassProperty.
	aFASTJavaClassProperty attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaClassTypeExpression: aFASTJavaClassTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaClassTypeExpression new
		comments: (self copy: aFASTJavaClassTypeExpression comments) ;
		typeName: (self copy: aFASTJavaClassTypeExpression typeName) ;
		name: (self copy: aFASTJavaClassTypeExpression name) ;
		arguments: (self copy: aFASTJavaClassTypeExpression arguments) ;
		numberOfComments: (self copy: aFASTJavaClassTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaClassTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaClassTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaClassTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaClassTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaClassTypeExpression.
	aFASTJavaClassTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaComment: aFASTJavaComment [
	<generated>
	| copy |
	copy := FASTJavaComment new
		comments: (self copy: aFASTJavaComment comments) ;
		content: (self copy: aFASTJavaComment content) ;
		numberOfComments: (self copy: aFASTJavaComment numberOfComments) ;
		startPos: (self copy: aFASTJavaComment startPos) ;
		endPos: (self copy: aFASTJavaComment endPos) ;
		container: (self copy: aFASTJavaComment container) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaComment.
	aFASTJavaComment attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaCompilationUnit: aFASTJavaCompilationUnit [
	<generated>
	| copy |
	copy := FASTJavaCompilationUnit new
		comments: (self copy: aFASTJavaCompilationUnit comments) ;
		packageDeclaration: (self copy: aFASTJavaCompilationUnit packageDeclaration) ;
		enumDeclarations: (self copy: aFASTJavaCompilationUnit enumDeclarations) ;
		classDeclarations: (self copy: aFASTJavaCompilationUnit classDeclarations) ;
		interfaceDeclarations: (self copy: aFASTJavaCompilationUnit interfaceDeclarations) ;
		numberOfComments: (self copy: aFASTJavaCompilationUnit numberOfComments) ;
		importDeclarations: (self copy: aFASTJavaCompilationUnit importDeclarations) ;
		startPos: (self copy: aFASTJavaCompilationUnit startPos) ;
		endPos: (self copy: aFASTJavaCompilationUnit endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaCompilationUnit.
	aFASTJavaCompilationUnit attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaConditionalExpression: aFASTJavaConditionalExpression [
	<generated>
	| copy |
	copy := FASTJavaConditionalExpression new
		comments: (self copy: aFASTJavaConditionalExpression comments) ;
		condition: (self copy: aFASTJavaConditionalExpression condition) ;
		elsePart: (self copy: aFASTJavaConditionalExpression elsePart) ;
		thenPart: (self copy: aFASTJavaConditionalExpression thenPart) ;
		numberOfComments: (self copy: aFASTJavaConditionalExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaConditionalExpression startPos) ;
		endPos: (self copy: aFASTJavaConditionalExpression endPos) ;
		assignedIn: (self copy: aFASTJavaConditionalExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaConditionalExpression.
	aFASTJavaConditionalExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaContinueStatement: aFASTJavaContinueStatement [
	<generated>
	| copy |
	copy := FASTJavaContinueStatement new
		comments: (self copy: aFASTJavaContinueStatement comments) ;
		numberOfComments: (self copy: aFASTJavaContinueStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaContinueStatement startPos) ;
		endPos: (self copy: aFASTJavaContinueStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaContinueStatement.
	aFASTJavaContinueStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaDefaultCaseStatement: aFASTJavaDefaultCaseStatement [
	<generated>
	| copy |
	copy := FASTJavaDefaultCaseStatement new
		comments: (self copy: aFASTJavaDefaultCaseStatement comments) ;
		statements: (self copy: aFASTJavaDefaultCaseStatement statements) ;
		numberOfComments: (self copy: aFASTJavaDefaultCaseStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaDefaultCaseStatement startPos) ;
		endPos: (self copy: aFASTJavaDefaultCaseStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaDefaultCaseStatement.
	aFASTJavaDefaultCaseStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaDoWhileStatement: aFASTJavaDoWhileStatement [
	<generated>
	| copy |
	copy := FASTJavaDoWhileStatement new
		comments: (self copy: aFASTJavaDoWhileStatement comments) ;
		condition: (self copy: aFASTJavaDoWhileStatement condition) ;
		body: (self copy: aFASTJavaDoWhileStatement body) ;
		numberOfComments: (self copy: aFASTJavaDoWhileStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaDoWhileStatement startPos) ;
		endPos: (self copy: aFASTJavaDoWhileStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaDoWhileStatement.
	aFASTJavaDoWhileStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaDoubleLiteral: aFASTJavaDoubleLiteral [
	<generated>
	| copy |
	copy := FASTJavaDoubleLiteral new
		comments: (self copy: aFASTJavaDoubleLiteral comments) ;
		primitiveValue: (self copy: aFASTJavaDoubleLiteral primitiveValue) ;
		numberOfComments: (self copy: aFASTJavaDoubleLiteral numberOfComments) ;
		startPos: (self copy: aFASTJavaDoubleLiteral startPos) ;
		endPos: (self copy: aFASTJavaDoubleLiteral endPos) ;
		assignedIn: (self copy: aFASTJavaDoubleLiteral assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaDoubleLiteral.
	aFASTJavaDoubleLiteral attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaDoubleTypeExpression: aFASTJavaDoubleTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaDoubleTypeExpression new
		comments: (self copy: aFASTJavaDoubleTypeExpression comments) ;
		name: (self copy: aFASTJavaDoubleTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaDoubleTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaDoubleTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaDoubleTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaDoubleTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaDoubleTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaDoubleTypeExpression.
	aFASTJavaDoubleTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaEmptyDimExpression: aFASTJavaEmptyDimExpression [
	<generated>
	| copy |
	copy := FASTJavaEmptyDimExpression new
		comments: (self copy: aFASTJavaEmptyDimExpression comments) ;
		numberOfComments: (self copy: aFASTJavaEmptyDimExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaEmptyDimExpression startPos) ;
		endPos: (self copy: aFASTJavaEmptyDimExpression endPos) ;
		assignedIn: (self copy: aFASTJavaEmptyDimExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaEmptyDimExpression.
	aFASTJavaEmptyDimExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaEmptyMethodDeclaration: aFASTJavaEmptyMethodDeclaration [
	<generated>
	| copy |
	copy := FASTJavaEmptyMethodDeclaration new
		comments: (self copy: aFASTJavaEmptyMethodDeclaration comments) ;
		typeParameters: (self copy: aFASTJavaEmptyMethodDeclaration typeParameters) ;
		type: (self copy: aFASTJavaEmptyMethodDeclaration type) ;
		name: (self copy: aFASTJavaEmptyMethodDeclaration name) ;
		parameters: (self copy: aFASTJavaEmptyMethodDeclaration parameters) ;
		modifiers: (self copy: aFASTJavaEmptyMethodDeclaration modifiers) ;
		numberOfComments: (self copy: aFASTJavaEmptyMethodDeclaration numberOfComments) ;
		throws: (self copy: aFASTJavaEmptyMethodDeclaration throws) ;
		statementBlock: (self copy: aFASTJavaEmptyMethodDeclaration statementBlock) ;
		invokedIn: (self copy: aFASTJavaEmptyMethodDeclaration invokedIn) ;
		startPos: (self copy: aFASTJavaEmptyMethodDeclaration startPos) ;
		endPos: (self copy: aFASTJavaEmptyMethodDeclaration endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaEmptyMethodDeclaration.
	aFASTJavaEmptyMethodDeclaration attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaEntity: aFASTJavaEntity [
	<generated>
	| copy |
	copy := FASTJavaEntity new
		comments: (self copy: aFASTJavaEntity comments) ;
		numberOfComments: (self copy: aFASTJavaEntity numberOfComments) ;
		startPos: (self copy: aFASTJavaEntity startPos) ;
		endPos: (self copy: aFASTJavaEntity endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaEntity.
	aFASTJavaEntity attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaEnumConstant: aFASTJavaEnumConstant [
	<generated>
	| copy |
	copy := FASTJavaEnumConstant new
		comments: (self copy: aFASTJavaEnumConstant comments) ;
		name: (self copy: aFASTJavaEnumConstant name) ;
		numberOfComments: (self copy: aFASTJavaEnumConstant numberOfComments) ;
		startPos: (self copy: aFASTJavaEnumConstant startPos) ;
		invokedIn: (self copy: aFASTJavaEnumConstant invokedIn) ;
		endPos: (self copy: aFASTJavaEnumConstant endPos) ;
		assignedIn: (self copy: aFASTJavaEnumConstant assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaEnumConstant.
	aFASTJavaEnumConstant attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaEnumDeclaration: aFASTJavaEnumDeclaration [
	<generated>
	| copy |
	copy := FASTJavaEnumDeclaration new
		declarations: (self copy: aFASTJavaEnumDeclaration declarations) ;
		comments: (self copy: aFASTJavaEnumDeclaration comments) ;
		name: (self copy: aFASTJavaEnumDeclaration name) ;
		interfaces: (self copy: aFASTJavaEnumDeclaration interfaces) ;
		modifiers: (self copy: aFASTJavaEnumDeclaration modifiers) ;
		numberOfComments: (self copy: aFASTJavaEnumDeclaration numberOfComments) ;
		constants: (self copy: aFASTJavaEnumDeclaration constants) ;
		invokedIn: (self copy: aFASTJavaEnumDeclaration invokedIn) ;
		startPos: (self copy: aFASTJavaEnumDeclaration startPos) ;
		endPos: (self copy: aFASTJavaEnumDeclaration endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaEnumDeclaration.
	aFASTJavaEnumDeclaration attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaExpressionStatement: aFASTJavaExpressionStatement [
	<generated>
	| copy |
	copy := FASTJavaExpressionStatement new
		comments: (self copy: aFASTJavaExpressionStatement comments) ;
		expression: (self copy: aFASTJavaExpressionStatement expression) ;
		numberOfComments: (self copy: aFASTJavaExpressionStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaExpressionStatement startPos) ;
		endPos: (self copy: aFASTJavaExpressionStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaExpressionStatement.
	aFASTJavaExpressionStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [
	<generated>
	| copy |
	copy := FASTJavaFieldAccess new
		comments: (self copy: aFASTJavaFieldAccess comments) ;
		receiver: (self copy: aFASTJavaFieldAccess receiver) ;
		numberOfComments: (self copy: aFASTJavaFieldAccess numberOfComments) ;
		startPos: (self copy: aFASTJavaFieldAccess startPos) ;
		fieldName: (self copy: aFASTJavaFieldAccess fieldName) ;
		endPos: (self copy: aFASTJavaFieldAccess endPos) ;
		assignedIn: (self copy: aFASTJavaFieldAccess assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaFieldAccess.
	aFASTJavaFieldAccess attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaFloatLiteral: aFASTJavaFloatLiteral [
	<generated>
	| copy |
	copy := FASTJavaFloatLiteral new
		comments: (self copy: aFASTJavaFloatLiteral comments) ;
		primitiveValue: (self copy: aFASTJavaFloatLiteral primitiveValue) ;
		numberOfComments: (self copy: aFASTJavaFloatLiteral numberOfComments) ;
		startPos: (self copy: aFASTJavaFloatLiteral startPos) ;
		endPos: (self copy: aFASTJavaFloatLiteral endPos) ;
		assignedIn: (self copy: aFASTJavaFloatLiteral assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaFloatLiteral.
	aFASTJavaFloatLiteral attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaFloatTypeExpression: aFASTJavaFloatTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaFloatTypeExpression new
		comments: (self copy: aFASTJavaFloatTypeExpression comments) ;
		name: (self copy: aFASTJavaFloatTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaFloatTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaFloatTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaFloatTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaFloatTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaFloatTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaFloatTypeExpression.
	aFASTJavaFloatTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	<generated>
	| copy |
	copy := FASTJavaForEachStatement new
		list: (self copy: aFASTJavaForEachStatement list) ;
		comments: (self copy: aFASTJavaForEachStatement comments) ;
		type: (self copy: aFASTJavaForEachStatement type) ;
		body: (self copy: aFASTJavaForEachStatement body) ;
		numberOfComments: (self copy: aFASTJavaForEachStatement numberOfComments) ;
		fieldname: (self copy: aFASTJavaForEachStatement fieldname) ;
		startPos: (self copy: aFASTJavaForEachStatement startPos) ;
		endPos: (self copy: aFASTJavaForEachStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaForEachStatement.
	aFASTJavaForEachStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaForStatement: aFASTJavaForStatement [
	<generated>
	| copy |
	copy := FASTJavaForStatement new
		comments: (self copy: aFASTJavaForStatement comments) ;
		condition: (self copy: aFASTJavaForStatement condition) ;
		body: (self copy: aFASTJavaForStatement body) ;
		numberOfComments: (self copy: aFASTJavaForStatement numberOfComments) ;
		incrementor: (self copy: aFASTJavaForStatement incrementor) ;
		initializer: (self copy: aFASTJavaForStatement initializer) ;
		startPos: (self copy: aFASTJavaForStatement startPos) ;
		endPos: (self copy: aFASTJavaForStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaForStatement.
	aFASTJavaForStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	<generated>
	| copy |
	copy := FASTJavaIdentifier new
		comments: (self copy: aFASTJavaIdentifier comments) ;
		name: (self copy: aFASTJavaIdentifier name) ;
		numberOfComments: (self copy: aFASTJavaIdentifier numberOfComments) ;
		startPos: (self copy: aFASTJavaIdentifier startPos) ;
		invokedIn: (self copy: aFASTJavaIdentifier invokedIn) ;
		endPos: (self copy: aFASTJavaIdentifier endPos) ;
		assignedIn: (self copy: aFASTJavaIdentifier assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaIdentifier.
	aFASTJavaIdentifier attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	<generated>
	| copy |
	copy := FASTJavaIfStatement new
		comments: (self copy: aFASTJavaIfStatement comments) ;
		condition: (self copy: aFASTJavaIfStatement condition) ;
		elsePart: (self copy: aFASTJavaIfStatement elsePart) ;
		thenPart: (self copy: aFASTJavaIfStatement thenPart) ;
		numberOfComments: (self copy: aFASTJavaIfStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaIfStatement startPos) ;
		endPos: (self copy: aFASTJavaIfStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaIfStatement.
	aFASTJavaIfStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaImportDeclaration: aFASTJavaImportDeclaration [
	<generated>
	| copy |
	copy := FASTJavaImportDeclaration new
		comments: (self copy: aFASTJavaImportDeclaration comments) ;
		qualifiedName: (self copy: aFASTJavaImportDeclaration qualifiedName) ;
		isOnDemand: (self copy: aFASTJavaImportDeclaration isOnDemand) ;
		isStatic: (self copy: aFASTJavaImportDeclaration isStatic) ;
		numberOfComments: (self copy: aFASTJavaImportDeclaration numberOfComments) ;
		startPos: (self copy: aFASTJavaImportDeclaration startPos) ;
		endPos: (self copy: aFASTJavaImportDeclaration endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaImportDeclaration.
	aFASTJavaImportDeclaration attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	<generated>
	| copy |
	copy := FASTJavaInfixOperation new
		comments: (self copy: aFASTJavaInfixOperation comments) ;
		leftOperand: (self copy: aFASTJavaInfixOperation leftOperand) ;
		rightOperand: (self copy: aFASTJavaInfixOperation rightOperand) ;
		numberOfComments: (self copy: aFASTJavaInfixOperation numberOfComments) ;
		startPos: (self copy: aFASTJavaInfixOperation startPos) ;
		endPos: (self copy: aFASTJavaInfixOperation endPos) ;
		operator: (self copy: aFASTJavaInfixOperation operator) ;
		assignedIn: (self copy: aFASTJavaInfixOperation assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaInfixOperation.
	aFASTJavaInfixOperation attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaInitializer: aFASTJavaInitializer [
	<generated>
	| copy |
	copy := FASTJavaInitializer new
		comments: (self copy: aFASTJavaInitializer comments) ;
		numberOfComments: (self copy: aFASTJavaInitializer numberOfComments) ;
		statementBlock: (self copy: aFASTJavaInitializer statementBlock) ;
		startPos: (self copy: aFASTJavaInitializer startPos) ;
		endPos: (self copy: aFASTJavaInitializer endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaInitializer.
	aFASTJavaInitializer attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaIntTypeExpression: aFASTJavaIntTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaIntTypeExpression new
		comments: (self copy: aFASTJavaIntTypeExpression comments) ;
		name: (self copy: aFASTJavaIntTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaIntTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaIntTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaIntTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaIntTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaIntTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaIntTypeExpression.
	aFASTJavaIntTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaIntegerLiteral: aFASTJavaIntegerLiteral [
	<generated>
	| copy |
	copy := FASTJavaIntegerLiteral new
		comments: (self copy: aFASTJavaIntegerLiteral comments) ;
		primitiveValue: (self copy: aFASTJavaIntegerLiteral primitiveValue) ;
		numberOfComments: (self copy: aFASTJavaIntegerLiteral numberOfComments) ;
		startPos: (self copy: aFASTJavaIntegerLiteral startPos) ;
		endPos: (self copy: aFASTJavaIntegerLiteral endPos) ;
		assignedIn: (self copy: aFASTJavaIntegerLiteral assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaIntegerLiteral.
	aFASTJavaIntegerLiteral attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaInterfaceDeclaration: aFASTJavaInterfaceDeclaration [
	<generated>
	| copy |
	copy := FASTJavaInterfaceDeclaration new
		declarations: (self copy: aFASTJavaInterfaceDeclaration declarations) ;
		comments: (self copy: aFASTJavaInterfaceDeclaration comments) ;
		name: (self copy: aFASTJavaInterfaceDeclaration name) ;
		interfaces: (self copy: aFASTJavaInterfaceDeclaration interfaces) ;
		modifiers: (self copy: aFASTJavaInterfaceDeclaration modifiers) ;
		numberOfComments: (self copy: aFASTJavaInterfaceDeclaration numberOfComments) ;
		invokedIn: (self copy: aFASTJavaInterfaceDeclaration invokedIn) ;
		startPos: (self copy: aFASTJavaInterfaceDeclaration startPos) ;
		endPos: (self copy: aFASTJavaInterfaceDeclaration endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaInterfaceDeclaration.
	aFASTJavaInterfaceDeclaration attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaLabeledCaseStatement: aFASTJavaLabeledCaseStatement [
	<generated>
	| copy |
	copy := FASTJavaLabeledCaseStatement new
		comments: (self copy: aFASTJavaLabeledCaseStatement comments) ;
		label: (self copy: aFASTJavaLabeledCaseStatement label) ;
		statements: (self copy: aFASTJavaLabeledCaseStatement statements) ;
		numberOfComments: (self copy: aFASTJavaLabeledCaseStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaLabeledCaseStatement startPos) ;
		endPos: (self copy: aFASTJavaLabeledCaseStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaLabeledCaseStatement.
	aFASTJavaLabeledCaseStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaLabeledStatement: aFASTJavaLabeledStatement [
	<generated>
	| copy |
	copy := FASTJavaLabeledStatement new
		comments: (self copy: aFASTJavaLabeledStatement comments) ;
		label: (self copy: aFASTJavaLabeledStatement label) ;
		numberOfComments: (self copy: aFASTJavaLabeledStatement numberOfComments) ;
		labeledStatement: (self copy: aFASTJavaLabeledStatement labeledStatement) ;
		startPos: (self copy: aFASTJavaLabeledStatement startPos) ;
		endPos: (self copy: aFASTJavaLabeledStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaLabeledStatement.
	aFASTJavaLabeledStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaLambdaExpression: aFASTJavaLambdaExpression [
	<generated>
	| copy |
	copy := FASTJavaLambdaExpression new
		comments: (self copy: aFASTJavaLambdaExpression comments) ;
		parameters: (self copy: aFASTJavaLambdaExpression parameters) ;
		expression: (self copy: aFASTJavaLambdaExpression expression) ;
		numberOfComments: (self copy: aFASTJavaLambdaExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaLambdaExpression startPos) ;
		endPos: (self copy: aFASTJavaLambdaExpression endPos) ;
		assignedIn: (self copy: aFASTJavaLambdaExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaLambdaExpression.
	aFASTJavaLambdaExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaLiteral: aFASTJavaLiteral [
	<generated>
	| copy |
	copy := FASTJavaLiteral new
		comments: (self copy: aFASTJavaLiteral comments) ;
		numberOfComments: (self copy: aFASTJavaLiteral numberOfComments) ;
		startPos: (self copy: aFASTJavaLiteral startPos) ;
		endPos: (self copy: aFASTJavaLiteral endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaLiteral.
	aFASTJavaLiteral attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaLongLiteral: aFASTJavaLongLiteral [
	<generated>
	| copy |
	copy := FASTJavaLongLiteral new
		comments: (self copy: aFASTJavaLongLiteral comments) ;
		primitiveValue: (self copy: aFASTJavaLongLiteral primitiveValue) ;
		numberOfComments: (self copy: aFASTJavaLongLiteral numberOfComments) ;
		startPos: (self copy: aFASTJavaLongLiteral startPos) ;
		endPos: (self copy: aFASTJavaLongLiteral endPos) ;
		assignedIn: (self copy: aFASTJavaLongLiteral assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaLongLiteral.
	aFASTJavaLongLiteral attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaLongTypeExpression: aFASTJavaLongTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaLongTypeExpression new
		comments: (self copy: aFASTJavaLongTypeExpression comments) ;
		name: (self copy: aFASTJavaLongTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaLongTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaLongTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaLongTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaLongTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaLongTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaLongTypeExpression.
	aFASTJavaLongTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	<generated>
	| copy |
	copy := FASTJavaMethodEntity new
		comments: (self copy: aFASTJavaMethodEntity comments) ;
		typeParameters: (self copy: aFASTJavaMethodEntity typeParameters) ;
		type: (self copy: aFASTJavaMethodEntity type) ;
		name: (self copy: aFASTJavaMethodEntity name) ;
		parameters: (self copy: aFASTJavaMethodEntity parameters) ;
		modifiers: (self copy: aFASTJavaMethodEntity modifiers) ;
		numberOfComments: (self copy: aFASTJavaMethodEntity numberOfComments) ;
		throws: (self copy: aFASTJavaMethodEntity throws) ;
		statementBlock: (self copy: aFASTJavaMethodEntity statementBlock) ;
		invokedIn: (self copy: aFASTJavaMethodEntity invokedIn) ;
		startPos: (self copy: aFASTJavaMethodEntity startPos) ;
		endPos: (self copy: aFASTJavaMethodEntity endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaMethodEntity.
	aFASTJavaMethodEntity attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	<generated>
	| copy |
	copy := FASTJavaMethodInvocation new
		comments: (self copy: aFASTJavaMethodInvocation comments) ;
		receiver: (self copy: aFASTJavaMethodInvocation receiver) ;
		name: (self copy: aFASTJavaMethodInvocation name) ;
		arguments: (self copy: aFASTJavaMethodInvocation arguments) ;
		invoked: (self copy: aFASTJavaMethodInvocation invoked) ;
		numberOfComments: (self copy: aFASTJavaMethodInvocation numberOfComments) ;
		invokedIn: (self copy: aFASTJavaMethodInvocation invokedIn) ;
		startPos: (self copy: aFASTJavaMethodInvocation startPos) ;
		endPos: (self copy: aFASTJavaMethodInvocation endPos) ;
		assignedIn: (self copy: aFASTJavaMethodInvocation assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaMethodInvocation.
	aFASTJavaMethodInvocation attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaMethodReference: aFASTJavaMethodReference [
	<generated>
	| copy |
	copy := FASTJavaMethodReference new
		comments: (self copy: aFASTJavaMethodReference comments) ;
		receiver: (self copy: aFASTJavaMethodReference receiver) ;
		name: (self copy: aFASTJavaMethodReference name) ;
		numberOfComments: (self copy: aFASTJavaMethodReference numberOfComments) ;
		invokedIn: (self copy: aFASTJavaMethodReference invokedIn) ;
		startPos: (self copy: aFASTJavaMethodReference startPos) ;
		endPos: (self copy: aFASTJavaMethodReference endPos) ;
		assignedIn: (self copy: aFASTJavaMethodReference assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaMethodReference.
	aFASTJavaMethodReference attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaModifier: aFASTJavaModifier [
	<generated>
	| copy |
	copy := FASTJavaModifier new
		comments: (self copy: aFASTJavaModifier comments) ;
		numberOfComments: (self copy: aFASTJavaModifier numberOfComments) ;
		token: (self copy: aFASTJavaModifier token) ;
		startPos: (self copy: aFASTJavaModifier startPos) ;
		endPos: (self copy: aFASTJavaModifier endPos) ;
		assignedIn: (self copy: aFASTJavaModifier assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaModifier.
	aFASTJavaModifier attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaNewArray: aFASTJavaNewArray [
	<generated>
	| copy |
	copy := FASTJavaNewArray new
		comments: (self copy: aFASTJavaNewArray comments) ;
		receiver: (self copy: aFASTJavaNewArray receiver) ;
		type: (self copy: aFASTJavaNewArray type) ;
		arguments: (self copy: aFASTJavaNewArray arguments) ;
		numberOfComments: (self copy: aFASTJavaNewArray numberOfComments) ;
		initializer: (self copy: aFASTJavaNewArray initializer) ;
		startPos: (self copy: aFASTJavaNewArray startPos) ;
		endPos: (self copy: aFASTJavaNewArray endPos) ;
		assignedIn: (self copy: aFASTJavaNewArray assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaNewArray.
	aFASTJavaNewArray attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression [
	<generated>
	| copy |
	copy := FASTJavaNewClassExpression new
		declarations: (self copy: aFASTJavaNewClassExpression declarations) ;
		comments: (self copy: aFASTJavaNewClassExpression comments) ;
		receiver: (self copy: aFASTJavaNewClassExpression receiver) ;
		type: (self copy: aFASTJavaNewClassExpression type) ;
		arguments: (self copy: aFASTJavaNewClassExpression arguments) ;
		numberOfComments: (self copy: aFASTJavaNewClassExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaNewClassExpression startPos) ;
		endPos: (self copy: aFASTJavaNewClassExpression endPos) ;
		assignedIn: (self copy: aFASTJavaNewClassExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaNewClassExpression.
	aFASTJavaNewClassExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	<generated>
	| copy |
	copy := FASTJavaNewExpression new
		comments: (self copy: aFASTJavaNewExpression comments) ;
		receiver: (self copy: aFASTJavaNewExpression receiver) ;
		type: (self copy: aFASTJavaNewExpression type) ;
		arguments: (self copy: aFASTJavaNewExpression arguments) ;
		numberOfComments: (self copy: aFASTJavaNewExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaNewExpression startPos) ;
		endPos: (self copy: aFASTJavaNewExpression endPos) ;
		assignedIn: (self copy: aFASTJavaNewExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaNewExpression.
	aFASTJavaNewExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	<generated>
	| copy |
	copy := FASTJavaNullLiteral new
		comments: (self copy: aFASTJavaNullLiteral comments) ;
		primitiveValue: (self copy: aFASTJavaNullLiteral primitiveValue) ;
		numberOfComments: (self copy: aFASTJavaNullLiteral numberOfComments) ;
		startPos: (self copy: aFASTJavaNullLiteral startPos) ;
		endPos: (self copy: aFASTJavaNullLiteral endPos) ;
		assignedIn: (self copy: aFASTJavaNullLiteral assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaNullLiteral.
	aFASTJavaNullLiteral attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaOuterThis: aFASTJavaOuterThis [
	<generated>
	| copy |
	copy := FASTJavaOuterThis new
		comments: (self copy: aFASTJavaOuterThis comments) ;
		type: (self copy: aFASTJavaOuterThis type) ;
		numberOfComments: (self copy: aFASTJavaOuterThis numberOfComments) ;
		startPos: (self copy: aFASTJavaOuterThis startPos) ;
		endPos: (self copy: aFASTJavaOuterThis endPos) ;
		assignedIn: (self copy: aFASTJavaOuterThis assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaOuterThis.
	aFASTJavaOuterThis attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaPackageDeclaration: aFASTJavaPackageDeclaration [
	<generated>
	| copy |
	copy := FASTJavaPackageDeclaration new
		comments: (self copy: aFASTJavaPackageDeclaration comments) ;
		qualifiedName: (self copy: aFASTJavaPackageDeclaration qualifiedName) ;
		numberOfComments: (self copy: aFASTJavaPackageDeclaration numberOfComments) ;
		startPos: (self copy: aFASTJavaPackageDeclaration startPos) ;
		endPos: (self copy: aFASTJavaPackageDeclaration endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaPackageDeclaration.
	aFASTJavaPackageDeclaration attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	<generated>
	| copy |
	copy := FASTJavaParameter new
		comments: (self copy: aFASTJavaParameter comments) ;
		variable: (self copy: aFASTJavaParameter variable) ;
		type: (self copy: aFASTJavaParameter type) ;
		name: (self copy: aFASTJavaParameter name) ;
		numberOfComments: (self copy: aFASTJavaParameter numberOfComments) ;
		invokedIn: (self copy: aFASTJavaParameter invokedIn) ;
		startPos: (self copy: aFASTJavaParameter startPos) ;
		endPos: (self copy: aFASTJavaParameter endPos) ;
		assignedIn: (self copy: aFASTJavaParameter assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaParameter.
	aFASTJavaParameter attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaPrimitiveTypeExpression: aFASTJavaPrimitiveTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaPrimitiveTypeExpression new
		comments: (self copy: aFASTJavaPrimitiveTypeExpression comments) ;
		name: (self copy: aFASTJavaPrimitiveTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaPrimitiveTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaPrimitiveTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaPrimitiveTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaPrimitiveTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaPrimitiveTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaPrimitiveTypeExpression.
	aFASTJavaPrimitiveTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaQualifiedName: aFASTJavaQualifiedName [
	<generated>
	| copy |
	copy := FASTJavaQualifiedName new
		comments: (self copy: aFASTJavaQualifiedName comments) ;
		namespace: (self copy: aFASTJavaQualifiedName namespace) ;
		name: (self copy: aFASTJavaQualifiedName name) ;
		numberOfComments: (self copy: aFASTJavaQualifiedName numberOfComments) ;
		invokedIn: (self copy: aFASTJavaQualifiedName invokedIn) ;
		startPos: (self copy: aFASTJavaQualifiedName startPos) ;
		endPos: (self copy: aFASTJavaQualifiedName endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaQualifiedName.
	aFASTJavaQualifiedName attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaQualifiedTypeName: aFASTJavaQualifiedTypeName [
	<generated>
	| copy |
	copy := FASTJavaQualifiedTypeName new
		comments: (self copy: aFASTJavaQualifiedTypeName comments) ;
		namespace: (self copy: aFASTJavaQualifiedTypeName namespace) ;
		name: (self copy: aFASTJavaQualifiedTypeName name) ;
		numberOfComments: (self copy: aFASTJavaQualifiedTypeName numberOfComments) ;
		invokedIn: (self copy: aFASTJavaQualifiedTypeName invokedIn) ;
		startPos: (self copy: aFASTJavaQualifiedTypeName startPos) ;
		endPos: (self copy: aFASTJavaQualifiedTypeName endPos) ;
		assignedIn: (self copy: aFASTJavaQualifiedTypeName assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaQualifiedTypeName.
	aFASTJavaQualifiedTypeName attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaReturnStatement: aFASTJavaReturnStatement [
	<generated>
	| copy |
	copy := FASTJavaReturnStatement new
		comments: (self copy: aFASTJavaReturnStatement comments) ;
		expression: (self copy: aFASTJavaReturnStatement expression) ;
		numberOfComments: (self copy: aFASTJavaReturnStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaReturnStatement startPos) ;
		endPos: (self copy: aFASTJavaReturnStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaReturnStatement.
	aFASTJavaReturnStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaShortTypeExpression: aFASTJavaShortTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaShortTypeExpression new
		comments: (self copy: aFASTJavaShortTypeExpression comments) ;
		name: (self copy: aFASTJavaShortTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaShortTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaShortTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaShortTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaShortTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaShortTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaShortTypeExpression.
	aFASTJavaShortTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaStatement: aFASTJavaStatement [
	<generated>
	| copy |
	copy := FASTJavaStatement new
		comments: (self copy: aFASTJavaStatement comments) ;
		numberOfComments: (self copy: aFASTJavaStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaStatement startPos) ;
		endPos: (self copy: aFASTJavaStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaStatement.
	aFASTJavaStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaStatementBlock: aFASTJavaStatementBlock [
	<generated>
	| copy |
	copy := FASTJavaStatementBlock new
		comments: (self copy: aFASTJavaStatementBlock comments) ;
		statements: (self copy: aFASTJavaStatementBlock statements) ;
		numberOfComments: (self copy: aFASTJavaStatementBlock numberOfComments) ;
		startPos: (self copy: aFASTJavaStatementBlock startPos) ;
		endPos: (self copy: aFASTJavaStatementBlock endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaStatementBlock.
	aFASTJavaStatementBlock attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	<generated>
	| copy |
	copy := FASTJavaStringLiteral new
		comments: (self copy: aFASTJavaStringLiteral comments) ;
		primitiveValue: (self copy: aFASTJavaStringLiteral primitiveValue) ;
		numberOfComments: (self copy: aFASTJavaStringLiteral numberOfComments) ;
		startPos: (self copy: aFASTJavaStringLiteral startPos) ;
		endPos: (self copy: aFASTJavaStringLiteral endPos) ;
		assignedIn: (self copy: aFASTJavaStringLiteral assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaStringLiteral.
	aFASTJavaStringLiteral attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaSwitchStatement: aFASTJavaSwitchStatement [
	<generated>
	| copy |
	copy := FASTJavaSwitchStatement new
		comments: (self copy: aFASTJavaSwitchStatement comments) ;
		condition: (self copy: aFASTJavaSwitchStatement condition) ;
		numberOfComments: (self copy: aFASTJavaSwitchStatement numberOfComments) ;
		cases: (self copy: aFASTJavaSwitchStatement cases) ;
		startPos: (self copy: aFASTJavaSwitchStatement startPos) ;
		endPos: (self copy: aFASTJavaSwitchStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaSwitchStatement.
	aFASTJavaSwitchStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaSynchronizedStatement: aFASTJavaSynchronizedStatement [
	<generated>
	| copy |
	copy := FASTJavaSynchronizedStatement new
		comments: (self copy: aFASTJavaSynchronizedStatement comments) ;
		block: (self copy: aFASTJavaSynchronizedStatement block) ;
		expression: (self copy: aFASTJavaSynchronizedStatement expression) ;
		numberOfComments: (self copy: aFASTJavaSynchronizedStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaSynchronizedStatement startPos) ;
		endPos: (self copy: aFASTJavaSynchronizedStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaSynchronizedStatement.
	aFASTJavaSynchronizedStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTAnnotationElement: aFASTJavaTAnnotationElement [
	<generated>
	^FASTJavaTAnnotationElement new
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTAssignable: aFASTJavaTAssignable [
	<generated>
	^FASTJavaTAssignable new
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTDeclaration: aFASTJavaTDeclaration [
	<generated>
	^FASTJavaTDeclaration new
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTEntityCreator: aFASTJavaTEntityCreator [
	<generated>
	^FASTJavaTEntityCreator new
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTModifier: aFASTJavaTModifier [
	<generated>
	^FASTJavaTModifier new
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTReceiver: aFASTJavaTReceiver [
	<generated>
	^FASTJavaTReceiver new
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTWithAssignable: aFASTJavaTWithAssignable [
	<generated>
	^FASTJavaTWithAssignable new
		variable: (self copy: aFASTJavaTWithAssignable variable) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTWithDeclarations: aFASTJavaTWithDeclarations [
	<generated>
	^FASTJavaTWithDeclarations new
		declarations: (self copy: aFASTJavaTWithDeclarations declarations) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTWithModifiers: aFASTJavaTWithModifiers [
	<generated>
	^FASTJavaTWithModifiers new
		modifiers: (self copy: aFASTJavaTWithModifiers modifiers) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTWithQualifiedName: aFASTJavaTWithQualifiedName [
	<generated>
	^FASTJavaTWithQualifiedName new
		qualifiedName: (self copy: aFASTJavaTWithQualifiedName qualifiedName) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTJavaTWithReceiver: aFASTJavaTWithReceiver [
	<generated>
	^FASTJavaTWithReceiver new
		receiver: (self copy: aFASTJavaTWithReceiver receiver) ;
		yourself

]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaThis: aFASTJavaThis [
	<generated>
	| copy |
	copy := FASTJavaThis new
		comments: (self copy: aFASTJavaThis comments) ;
		name: (self copy: aFASTJavaThis name) ;
		numberOfComments: (self copy: aFASTJavaThis numberOfComments) ;
		startPos: (self copy: aFASTJavaThis startPos) ;
		invokedIn: (self copy: aFASTJavaThis invokedIn) ;
		endPos: (self copy: aFASTJavaThis endPos) ;
		assignedIn: (self copy: aFASTJavaThis assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaThis.
	aFASTJavaThis attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaThrowStatement: aFASTJavaThrowStatement [
	<generated>
	| copy |
	copy := FASTJavaThrowStatement new
		comments: (self copy: aFASTJavaThrowStatement comments) ;
		expression: (self copy: aFASTJavaThrowStatement expression) ;
		numberOfComments: (self copy: aFASTJavaThrowStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaThrowStatement startPos) ;
		endPos: (self copy: aFASTJavaThrowStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaThrowStatement.
	aFASTJavaThrowStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	<generated>
	| copy |
	copy := FASTJavaTryCatchStatement new
		comments: (self copy: aFASTJavaTryCatchStatement comments) ;
		resources: (self copy: aFASTJavaTryCatchStatement resources) ;
		try: (self copy: aFASTJavaTryCatchStatement try) ;
		catches: (self copy: aFASTJavaTryCatchStatement catches) ;
		numberOfComments: (self copy: aFASTJavaTryCatchStatement numberOfComments) ;
		finally: (self copy: aFASTJavaTryCatchStatement finally) ;
		startPos: (self copy: aFASTJavaTryCatchStatement startPos) ;
		endPos: (self copy: aFASTJavaTryCatchStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaTryCatchStatement.
	aFASTJavaTryCatchStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaTypeExpression: aFASTJavaTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaTypeExpression new
		comments: (self copy: aFASTJavaTypeExpression comments) ;
		name: (self copy: aFASTJavaTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaTypeExpression.
	aFASTJavaTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaTypeName: aFASTJavaTypeName [
	<generated>
	| copy |
	copy := FASTJavaTypeName new
		comments: (self copy: aFASTJavaTypeName comments) ;
		name: (self copy: aFASTJavaTypeName name) ;
		numberOfComments: (self copy: aFASTJavaTypeName numberOfComments) ;
		invokedIn: (self copy: aFASTJavaTypeName invokedIn) ;
		startPos: (self copy: aFASTJavaTypeName startPos) ;
		endPos: (self copy: aFASTJavaTypeName endPos) ;
		assignedIn: (self copy: aFASTJavaTypeName assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaTypeName.
	aFASTJavaTypeName attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaTypeParameterExpression: aFASTJavaTypeParameterExpression [
	<generated>
	| copy |
	copy := FASTJavaTypeParameterExpression new
		comments: (self copy: aFASTJavaTypeParameterExpression comments) ;
		name: (self copy: aFASTJavaTypeParameterExpression name) ;
		types: (self copy: aFASTJavaTypeParameterExpression types) ;
		numberOfComments: (self copy: aFASTJavaTypeParameterExpression numberOfComments) ;
		invokedIn: (self copy: aFASTJavaTypeParameterExpression invokedIn) ;
		startPos: (self copy: aFASTJavaTypeParameterExpression startPos) ;
		endPos: (self copy: aFASTJavaTypeParameterExpression endPos) ;
		assignedIn: (self copy: aFASTJavaTypeParameterExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaTypeParameterExpression.
	aFASTJavaTypeParameterExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'visiting' }
FASTJavaCopyVisitor >> visitFASTJavaTypePattern: aFASTJavaTypePattern [
	<generated>
	^FASTJavaTypePattern new
		comments: (self copy: aFASTJavaTypePattern comments) ;
		variable: (self copy: aFASTJavaTypePattern variable) ;
		type: (self copy: aFASTJavaTypePattern type) ;
		startPos: (self copy: aFASTJavaTypePattern startPos) ;
		endPos: (self copy: aFASTJavaTypePattern endPos) ;
		yourself

]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaUnaryExpression: aFASTJavaUnaryExpression [
	<generated>
	| copy |
	copy := FASTJavaUnaryExpression new
		comments: (self copy: aFASTJavaUnaryExpression comments) ;
		isPrefixedUnaryExpression: (self copy: aFASTJavaUnaryExpression isPrefixedUnaryExpression) ;
		expression: (self copy: aFASTJavaUnaryExpression expression) ;
		numberOfComments: (self copy: aFASTJavaUnaryExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaUnaryExpression startPos) ;
		endPos: (self copy: aFASTJavaUnaryExpression endPos) ;
		operator: (self copy: aFASTJavaUnaryExpression operator) ;
		assignedIn: (self copy: aFASTJavaUnaryExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaUnaryExpression.
	aFASTJavaUnaryExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	<generated>
	| copy |
	copy := FASTJavaVarDeclStatement new
		comments: (self copy: aFASTJavaVarDeclStatement comments) ;
		type: (self copy: aFASTJavaVarDeclStatement type) ;
		modifiers: (self copy: aFASTJavaVarDeclStatement modifiers) ;
		numberOfComments: (self copy: aFASTJavaVarDeclStatement numberOfComments) ;
		declarators: (self copy: aFASTJavaVarDeclStatement declarators) ;
		startPos: (self copy: aFASTJavaVarDeclStatement startPos) ;
		endPos: (self copy: aFASTJavaVarDeclStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaVarDeclStatement.
	aFASTJavaVarDeclStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	<generated>
	| copy |
	copy := FASTJavaVariableDeclarator new
		comments: (self copy: aFASTJavaVariableDeclarator comments) ;
		variable: (self copy: aFASTJavaVariableDeclarator variable) ;
		expression: (self copy: aFASTJavaVariableDeclarator expression) ;
		numberOfComments: (self copy: aFASTJavaVariableDeclarator numberOfComments) ;
		startPos: (self copy: aFASTJavaVariableDeclarator startPos) ;
		endPos: (self copy: aFASTJavaVariableDeclarator endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaVariableDeclarator.
	aFASTJavaVariableDeclarator attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	<generated>
	| copy |
	copy := FASTJavaVariableExpression new
		comments: (self copy: aFASTJavaVariableExpression comments) ;
		name: (self copy: aFASTJavaVariableExpression name) ;
		numberOfComments: (self copy: aFASTJavaVariableExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaVariableExpression startPos) ;
		invokedIn: (self copy: aFASTJavaVariableExpression invokedIn) ;
		endPos: (self copy: aFASTJavaVariableExpression endPos) ;
		assignedIn: (self copy: aFASTJavaVariableExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaVariableExpression.
	aFASTJavaVariableExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaVoidTypeExpression: aFASTJavaVoidTypeExpression [
	<generated>
	| copy |
	copy := FASTJavaVoidTypeExpression new
		comments: (self copy: aFASTJavaVoidTypeExpression comments) ;
		name: (self copy: aFASTJavaVoidTypeExpression name) ;
		numberOfComments: (self copy: aFASTJavaVoidTypeExpression numberOfComments) ;
		startPos: (self copy: aFASTJavaVoidTypeExpression startPos) ;
		invokedIn: (self copy: aFASTJavaVoidTypeExpression invokedIn) ;
		endPos: (self copy: aFASTJavaVoidTypeExpression endPos) ;
		assignedIn: (self copy: aFASTJavaVoidTypeExpression assignedIn) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaVoidTypeExpression.
	aFASTJavaVoidTypeExpression attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [
	<generated>
	| copy |
	copy := FASTJavaWhileStatement new
		comments: (self copy: aFASTJavaWhileStatement comments) ;
		condition: (self copy: aFASTJavaWhileStatement condition) ;
		body: (self copy: aFASTJavaWhileStatement body) ;
		numberOfComments: (self copy: aFASTJavaWhileStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaWhileStatement startPos) ;
		endPos: (self copy: aFASTJavaWhileStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaWhileStatement.
	aFASTJavaWhileStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTTEntity: aFASTTEntity [
	<generated>
	^FASTTEntity new
		startPos: (self copy: aFASTTEntity startPos) ;
		endPos: (self copy: aFASTTEntity endPos) ;
		yourself

]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTTExpression: aFASTTExpression [
	<generated>
	^FASTTExpression new
		endPos: (self copy: aFASTTExpression endPos) ;
		startPos: (self copy: aFASTTExpression startPos) ;
		yourself

]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTTExpressionStatement: aFASTJavaExpressionStatement [
	<generated>
	| copy |
	copy := FASTJavaExpressionStatement new
		comments: (self copy: aFASTJavaExpressionStatement comments) ;
		expression: (self copy: aFASTJavaExpressionStatement expression) ;
		numberOfComments: (self copy: aFASTJavaExpressionStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaExpressionStatement startPos) ;
		endPos: (self copy: aFASTJavaExpressionStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaExpressionStatement.
	aFASTJavaExpressionStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTTLiteral: aFASTJavaLiteral [
	<generated>
	| copy |
	copy := FASTJavaLiteral new
		comments: (self copy: aFASTJavaLiteral comments) ;
		numberOfComments: (self copy: aFASTJavaLiteral numberOfComments) ;
		startPos: (self copy: aFASTJavaLiteral startPos) ;
		endPos: (self copy: aFASTJavaLiteral endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaLiteral.
	aFASTJavaLiteral attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTTReturnStatement: aFASTJavaReturnStatement [
	<generated>
	| copy |
	copy := FASTJavaReturnStatement new
		comments: (self copy: aFASTJavaReturnStatement comments) ;
		expression: (self copy: aFASTJavaReturnStatement expression) ;
		numberOfComments: (self copy: aFASTJavaReturnStatement numberOfComments) ;
		startPos: (self copy: aFASTJavaReturnStatement startPos) ;
		endPos: (self copy: aFASTJavaReturnStatement endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaReturnStatement.
	aFASTJavaReturnStatement attributeAt: #copy put: copy.
	^ copy
]

{ #category : 'visiting - traits' }
FASTJavaCopyVisitor >> visitFASTTStatement: aFASTTStatement [
	<generated>
	^FASTTStatement new
		startPos: (self copy: aFASTTStatement startPos) ;
		endPos: (self copy: aFASTTStatement endPos) ;
		yourself

]

{ #category : 'as yet unclassified' }
FASTJavaCopyVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	<generated>
	| copy |
	copy := FASTJavaStatementBlock new
		comments: (self copy: aFASTJavaStatementBlock comments) ;
		statements: (self copy: aFASTJavaStatementBlock statements) ;
		numberOfComments: (self copy: aFASTJavaStatementBlock numberOfComments) ;
		startPos: (self copy: aFASTJavaStatementBlock startPos) ;
		endPos: (self copy: aFASTJavaStatementBlock endPos) ;
		yourself.

	copy attributeAt: #original put: aFASTJavaStatementBlock.
	aFASTJavaStatementBlock attributeAt: #copy put: copy.
	^ copy
]
