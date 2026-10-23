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
	self assert: declaration type class equals: FASTJavaVarTypeExpression.
	self assert: declaration type name equals: 'var'
]
