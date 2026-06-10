Extension { #name : 'FASTJavaEntity' }

{ #category : '*FAST-Java-Tools' }
FASTJavaEntity >> exportForCFG [

	^ FASTJavaExportVisitor new export: self
]

{ #category : '*FAST-Java-Tools' }
FASTJavaEntity >> exporterForCFG [ 

	^ FASTJavaExportVisitor new
]

{ #category : '*FAST-Java-Tools' }
FASTJavaEntity >> newStatementBlockForCFG [

	^ FASTJavaStatementBlock new
]
