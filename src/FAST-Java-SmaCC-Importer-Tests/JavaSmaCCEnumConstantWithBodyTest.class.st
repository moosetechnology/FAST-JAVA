"
I check that an enum constant keeps the arguments it writes for the constructor of its enum and the class body it declares (JLS 8.9.1).
"
Class {
	#name : 'JavaSmaCCEnumConstantWithBodyTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCEnumConstantWithBodyTest >> constant [

	^ (fastModel allWithType: FASTJavaEnumConstant) anyOne
]

{ #category : 'resources' }
JavaSmaCCEnumConstantWithBodyTest >> javaClass [

	^ 'enum Operation {
	PLUS("+") {
		int apply(int left, int right) {
			return left + right;
		}
	};

	private final String symbol;

	Operation(String symbol) {
		this.symbol = symbol;
	}

	abstract int apply(int left, int right);
}'
]

{ #category : 'tests' }
JavaSmaCCEnumConstantWithBodyTest >> testConstantBodyDeclaresTheMethodItWrites [

	self assert: self constant declarations anyOne name equals: 'apply'
]

{ #category : 'tests' }
JavaSmaCCEnumConstantWithBodyTest >> testConstantKeepsTheArgumentItWrites [

	self assert: self constant arguments anyOne primitiveValue equals: '+'
]

{ #category : 'tests' }
JavaSmaCCEnumConstantWithBodyTest >> testConstantKeepsTheBodyItDeclares [

	self assert: self constant declarations size equals: 1
]
