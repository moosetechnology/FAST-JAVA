Class {
	#name : 'JavaSmaCCArrayVariableDeclaratorTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'helpers' }
JavaSmaCCArrayVariableDeclaratorTest >> declarationOf: aName [

	^ (fastModel allWithType: FASTJavaVarDeclStatement) detect: [ :declaration |
		  declaration declarators anySatisfy: [ :declarator | declarator variable name = aName ] ]
]

{ #category : 'helpers' }
JavaSmaCCArrayVariableDeclaratorTest >> declaratorOf: aName [

	^ (fastModel allWithType: FASTJavaVariableDeclarator) detect: [ :declarator |
		  declarator variable name = aName ]
]

{ #category : 'accessing' }
JavaSmaCCArrayVariableDeclaratorTest >> javaClass [

	^ 'class Declarations {
	int fields[];

	int[] onType;

	int mixed[], plain;

	void read(char cbuf[], int offset, String names[][]) {
		int values[] = null;
		int ordinary = 0;
	}
}'
]

{ #category : 'tests' }
JavaSmaCCArrayVariableDeclaratorTest >> testBracketsWrittenOnTheTypeAreNotOnTheDeclarator [
	"`int[] onType;` and `int fields[];` declare the same type by writing it in two
	places, which the model keeps apart."

	self assert: (self declarationOf: 'onType') type class equals: FASTJavaArrayTypeExpression.
	self assert: (self declarationOf: 'onType') type baseType class equals: FASTJavaIntTypeExpression.
	self assert: (self declaratorOf: 'onType') dimensions equals: 0
]

{ #category : 'tests' }
JavaSmaCCArrayVariableDeclaratorTest >> testDeclaratorKeepsTheBracketsItWrites [

	self assert: (self declaratorOf: 'fields') dimensions equals: 1.
	self assert: (self declaratorOf: 'values') dimensions equals: 1.
	self assert: (self declaratorOf: 'ordinary') dimensions equals: 0.

	"The brackets belong to the declarator, so the declaration keeps the type it writes."
	self assert: (self declarationOf: 'fields') type class equals: FASTJavaIntTypeExpression.
	self assert: (self declarationOf: 'values') type class equals: FASTJavaIntTypeExpression
]

{ #category : 'tests' }
JavaSmaCCArrayVariableDeclaratorTest >> testDeclaratorsThatDisagreeKeepTheirOwnBrackets [
	"JLS 10.2: the brackets written after a variable belong to that variable alone, so the
	`mixed` of `int mixed[], plain;` declares an int[] where `plain` declares an int."

	self assert: (self declaratorOf: 'mixed') dimensions equals: 1.
	self assert: (self declaratorOf: 'plain') dimensions equals: 0.
	self assert: (self declarationOf: 'mixed') type class equals: FASTJavaIntTypeExpression
]

{ #category : 'tests' }
JavaSmaCCArrayVariableDeclaratorTest >> testParameterKeepsTheBracketsItWrites [

	| parameters |
	parameters := (fastModel allWithType: FASTJavaMethodEntity) anyOne parameters.

	self assert: parameters first type class equals: FASTJavaCharTypeExpression.
	self assert: parameters first dimensions equals: 1.

	self assert: parameters second type class equals: FASTJavaIntTypeExpression.
	self assert: parameters second dimensions equals: 0.

	self assert: parameters third type typeName name equals: 'String'.
	self assert: parameters third dimensions equals: 2
]
