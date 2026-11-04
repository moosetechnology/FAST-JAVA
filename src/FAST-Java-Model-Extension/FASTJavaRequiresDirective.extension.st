Extension { #name : 'FASTJavaRequiresDirective' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaRequiresDirective >> isStatic [
	"JLS 7.7.1: `static` asks for the module required at compile time only."

	^ self modifiers anySatisfy: [ :modifier | modifier token = 'static' ]
]

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaRequiresDirective >> isTransitive [
	"JLS 7.7.1: `transitive` gives the module required to whoever reads mine."

	^ self modifiers anySatisfy: [ :modifier | modifier token = 'transitive' ]
]
