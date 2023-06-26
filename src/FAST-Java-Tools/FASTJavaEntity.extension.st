Extension { #name : #FASTJavaEntity }

{ #category : #'*FAST-Java-Tools' }
FASTJavaEntity >> addLocalUse: aFASTNode [
	(self
		attributeAt: #localUses
		ifAbsent: [
			"attribute should not be absent, was initalized elsewhere"
			nil ])
		add: aFASTNode
]

{ #category : #'*FAST-Java-Tools' }
FASTJavaEntity >> localDeclaration [
	^self attributeAt: #localDeclaration ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Tools' }
FASTJavaEntity >> localDeclaration: aDeclarationNode [
	self attributeAt: #localDeclaration put: aDeclarationNode
]

{ #category : #'*FAST-Java-Tools' }
FASTJavaEntity >> localUses [
	^self attributeAt: #localUses ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Tools' }
FASTJavaEntity >> localUses: aCollection [
	self attributeAt: #localUses put: aCollection 
]

{ #category : #'*FAST-Java-Tools' }
FASTJavaEntity >> resetLocalUses [
	self attributeAt: #localUses put: OrderedCollection new
]
