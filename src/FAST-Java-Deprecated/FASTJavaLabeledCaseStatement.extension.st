Extension { #name : 'FASTJavaLabeledCaseStatement' }

{ #category : '*FAST-Java-Deprecated' }
FASTJavaLabeledCaseStatement >> label [

	self deprecated: 'Use labels and caseExpressions instead.'.
	self labels ifEmpty: [ ^ nil ].
	self labels first caseExpressions ifEmpty: [ ^ nil ].
	^ self labels first caseExpressions first
]

{ #category : '*FAST-Java-Deprecated' }
FASTJavaLabeledCaseStatement >> label: anExpression [

	| switchLabel |
	self deprecated: 'Use labels and caseExpressions instead.'.
	self labels removeAll.
	anExpression ifNil: [ ^ self ].
	switchLabel := FASTJavaSwitchLabel new.
	switchLabel caseExpressions add: anExpression.
	self labels add: switchLabel
]
