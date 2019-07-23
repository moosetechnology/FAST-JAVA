Class {
	#name : #FASTJavaMooseModel,
	#superclass : #MooseModel,
	#category : #'FAST-Java-Model'
}

{ #category : #initialization }
FASTJavaMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]
