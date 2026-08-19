Class {
	#name : 'JavaSmaCCLocalClassTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCLocalClassTest >> javaMethod [

	^ 'methodLocalClass() {
        TestMethod t = new TestMethod() { 
            class DummyClass {};
            void implementMe() { 
                DummyClass dummy = new DummyClass();
            }
        };
}'
]

{ #category : 'accessing' }
JavaSmaCCLocalClassTest >> testLocalClassExists [
	self assert: (fastModel allWithType: FASTJavaClassDeclaration) size equals: 1
]
