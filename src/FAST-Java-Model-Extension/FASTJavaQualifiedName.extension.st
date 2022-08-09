Extension { #name : #FASTJavaQualifiedName }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaQualifiedName >> fullName [

	^ String streamContents: [ :stream | 
		  self namespace ifNotNil: [ 
			  stream << namespace fullName.
			  stream << '.' ].
		  stream << self name ]
]
