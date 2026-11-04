"
I check that `var`, the reserved type name standing for an inferred type (JLS 14.4.1), is imported as a `FASTJavaVarTypeExpression` and not as a class type named `var`.
"
Class {
	#name : 'JavaSmaCCVarTypeTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCVarTypeTest >> javaMethod [

	^ 'void inference() {
	var inferred = 1;
	Variant declared = null;
}'
]

{ #category : 'tests' }
JavaSmaCCVarTypeTest >> testOrdinaryTypeIsNotAVarTypeExpression [

	| declaration |
	declaration := (fastModel allWithType: FASTJavaVarDeclStatement) detect: [ :each |
		               each declarators anyOne variable name = 'declared' ].
	self assert: declaration type class equals: FASTJavaClassTypeExpression.
	self assert: declaration type typeName name equals: 'Variant'
]

{ #category : 'tests' }
JavaSmaCCVarTypeTest >> testVarIsAVarTypeExpression [

	| declaration |
	declaration := (fastModel allWithType: FASTJavaVarDeclStatement) detect: [ :each |
		               each declarators anyOne variable name = 'inferred' ].
	self assert: declaration type class equals: FASTJavaVarTypeExpression
]

{ #category : 'tests' }
JavaSmaCCVarTypeTest >> testVarIsAnOrdinaryNameWhereJavaDoesNotInferIt [
	"JLS 14.4.1 and 15.27.1 write `var` as the type of a local variable declaration or of a
	lambda parameter, and nowhere else. JLS 3.9 keeps it from naming a class, so elsewhere it
	is a name that resolves to nothing, which is still what the source writes."

	| field parameter |
	field := ((self parseClassString: 'class A { var f; }')
		          allWithType: FASTJavaVarDeclStatement) anyOne.
	self assert: field type class equals: FASTJavaClassTypeExpression.
	self assert: field type typeName name equals: 'var'.
	parameter := ((self parseClassString: 'class A { void m(var p) {} }')
		              allWithType: FASTJavaParameter) anyOne.
	self assert: parameter type class equals: FASTJavaClassTypeExpression
]

{ #category : 'tests' }
JavaSmaCCVarTypeTest >> testVarIsTheInferredTypeOfAForEachVariable [
	"JLS 14.14.2: the header of a for-each writes a local variable declaration, so it may
	write `var` the way one standing on its own does."

	| statement |
	statement := ((self parseMethodString: 'void m(java.util.List<String> l) { for (var s : l) {} }')
		               allWithType: FASTJavaForEachStatement) anyOne.
	self assert: statement type class equals: FASTJavaVarTypeExpression
]

{ #category : 'tests' }
JavaSmaCCVarTypeTest >> testVarIsTheInferredTypeOfALambdaParameter [
	"JLS 15.27.1: a lambda may write `var` for the type of a parameter."

	| parameter |
	parameter := ((self parseMethodString:
		  'void m() { java.util.function.Function<String, String> f = (var a) -> a; }')
		               allWithType: FASTJavaParameter) anyOne.
	self assert: parameter type class equals: FASTJavaVarTypeExpression
]

{ #category : 'tests' }
JavaSmaCCVarTypeTest >> testVarWhereATypeMustBeNamedDoesNotRaise [
	"Reading `var` as the inferred type wherever it was written put a
	`FASTJavaVarTypeExpression` into relations that hold a class type, and the import raised
	`SlotNotFound` instead of saying what the source writes."

	self
		assert: ((self parseClassString: 'class A extends var {}')
			 allWithType: FASTJavaClassDeclaration) anyOne superclass class
		equals: FASTJavaClassTypeExpression.
	self
		assert: ((self parseClassString: 'class A { void m() { try {} catch (var e) {} } }')
			 allWithType: FASTJavaCatchPartStatement) anyOne caughtTypes anyOne class
		equals: FASTJavaClassTypeExpression
]
