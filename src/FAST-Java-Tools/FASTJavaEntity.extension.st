Extension { #name : 'FASTJavaEntity' }

{ #category : '*FAST-Java-Tools' }
FASTJavaEntity >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTJavaEntity: self.

]

{ #category : '*FAST-Java-Tools' }
FASTJavaEntity >> newVersionNumber [

	^self activeVersion
		ifNil: [ 0 ]
		ifNotNil: [ :active | active version + 1 ]
]
