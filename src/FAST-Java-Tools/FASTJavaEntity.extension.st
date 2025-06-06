Extension { #name : 'FASTJavaEntity' }

{ #category : '*FAST-Java-Tools' }
FASTJavaEntity >> exportForCFG [

	^FASTJavaExportVisitor new export: self
]
