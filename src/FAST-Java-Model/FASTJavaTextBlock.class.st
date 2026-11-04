"
I am a text block, the string literal JLS 3.10.6 writes between two runs of three quote
characters. I hold what the source writes between those runs, before the incidental white
space is stripped and the escapes are read, so that what is written is what comes back out.
"
Class {
	#name : 'FASTJavaTextBlock',
	#superclass : 'FASTJavaStringLiteral',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaTextBlock class >> annotation [

	<ignoreForCoverage>
	<FMClass: #TextBlock super: #FASTJavaStringLiteral>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaTextBlock >> isTextBlock [

	<ignoreForCoverage>
	<generated>
	^ true
]
