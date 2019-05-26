Class {
	#name : #FASTJavaTextHighlighter,
	#superclass : #FASTTextHighlighter,
	#category : #'FAST-Java-Highlighter'
}

{ #category : #initialization }
FASTJavaTextHighlighter >> initialize [
	super initialize.
	FASTJavaTypeExpression allSubclassesDo: [ :class | self addAttribute: (TextColor new color: self typeColor) for: class ].
	FASTLiteral allSubclassesDo: [ :class | self addAttribute: (TextColor new color: self literalColor) for: class ].
	self addAttribute: (TextColor new color: (Color pink)) for: FASTReturnStatement.
	self addAttribute: (TextColor new color: (Color gray)) for: FASTComment
]

{ #category : #initialization }
FASTJavaTextHighlighter >> literalColor [
	^ Color fromHexString: 'ef5350'
]

{ #category : #initialization }
FASTJavaTextHighlighter >> typeColor [
	^ Color fromHexString: '2e7d32'
]
