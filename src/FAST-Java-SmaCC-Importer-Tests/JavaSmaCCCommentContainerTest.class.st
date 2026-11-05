"
I check that each comment is imported once and belongs to code: a comment following another one belongs to code too, never to that comment, and a line comment opening the file belongs to the code after it. The scanner reads the code after a `>>` closing nested type arguments twice, and reports its comments twice.
"
Class {
	#name : 'JavaSmaCCCommentContainerTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCCommentContainerTest >> javaClass [

	^ '// header
// more header
package p;

class A {
	void m(Object o) {
		if (o instanceof B<C<D>>(C<D> c)) {
		}
		// first
		// second
		f();
	}
}'
]

{ #category : 'running' }
JavaSmaCCCommentContainerTest >> parseClassString: aString [

	^ JavaSmaCCProgramNodeImporterVisitor new
		  withComments;
		  parseCodeString: aString
]

{ #category : 'tests' }
JavaSmaCCCommentContainerTest >> testEachCommentBelongsToCode [

	(fastModel allWithType: FASTJavaComment) do: [ :comment |
		self assert: comment container isNotNil.
		self deny: (comment container isKindOf: FASTJavaComment) ]
]

{ #category : 'tests' }
JavaSmaCCCommentContainerTest >> testEachCommentIsImportedOnce [

	self
		assert: ((fastModel allWithType: FASTJavaComment) collect: [ :comment | comment content ]) asArray sorted
		equals: #( '// first' '// header' '// more header' '// second' )
]
