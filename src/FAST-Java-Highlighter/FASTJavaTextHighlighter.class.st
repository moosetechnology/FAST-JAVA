Class {
	#name : #FASTJavaTextHighlighter,
	#superclass : #FASTTextHighlighter,
	#category : #'FAST-Java-Highlighter'
}

{ #category : #initialization }
FASTJavaTextHighlighter >> initialize [
	| textColor |
	super initialize.
	textColor := Smalltalk ui theme textColor.
	FASTJavaTypeExpression allSubclassesDo: [ :class | self addAttribute: (TextColor new color: self typeColor) for: class ].
	FASTTLiteral allUsers do: [ :class | self addAttribute: (TextColor new color: self literalColor) for: class ].
	self addAttribute: (TextColor new color: (Color pink)) for: FASTTReturnStatement.
	"self addAttribute: (TextColor new color: (Color gray)) for: FASTComment."
	self addAttribute: (TextColor new color: (textColor mixed: 0.8 with: Color blue)) for: FASTJavaModifier.
	self addAttribute: (TextColor new color: (textColor mixed: 0.8 with: Color orange)) for: FASTJavaAnnotation
]

{ #category : #initialization }
FASTJavaTextHighlighter >> literalColor [
	^ Color fromHexString: 'ef5350'
]

{ #category : #initialization }
FASTJavaTextHighlighter >> typeColor [
	^ Color fromHexString: '2e7d32'
]
