"
part of algorithm defined in [http://www.cs.kent.edu/~jmaletic/papers/JSEP14.pdf](http://www.cs.kent.edu/~jmaletic/papers/JSEP14.pdf)
"
Class {
	#name : #FASTSliceProfile,
	#superclass : #Object,
	#instVars : [
		'variableName',
		'index',
		'slines',
		'cfunctions',
		'dvariables',
		'controlEdges'
	],
	#category : #'FAST-Java-Visitor-Slicing'
}

{ #category : #accessing }
FASTSliceProfile >> cfunctions [

	^ cfunctions
]

{ #category : #accessing }
FASTSliceProfile >> cfunctions: anObject [

	cfunctions := anObject
]

{ #category : #accessing }
FASTSliceProfile >> controlEdges [

	^ controlEdges
]

{ #category : #accessing }
FASTSliceProfile >> controlEdges: anObject [

	controlEdges := anObject
]

{ #category : #accessing }
FASTSliceProfile >> dvariables [

	^ dvariables
]

{ #category : #accessing }
FASTSliceProfile >> dvariables: anObject [

	dvariables := anObject
]

{ #category : #accessing }
FASTSliceProfile >> index [

	^ index
]

{ #category : #accessing }
FASTSliceProfile >> index: anObject [

	index := anObject
]

{ #category : #initialization }
FASTSliceProfile >> initialize [ 
	super initialize.

	cfunctions := OrderedCollection new.
	controlEdges := OrderedCollection new.
	dvariables := OrderedCollection new.
	slines := OrderedCollection new.

]

{ #category : #accessing }
FASTSliceProfile >> slines [

	^ slines
]

{ #category : #accessing }
FASTSliceProfile >> slines: anObject [

	slines := anObject
]

{ #category : #accessing }
FASTSliceProfile >> variableName [

	^ variableName
]

{ #category : #accessing }
FASTSliceProfile >> variableName: anObject [

	variableName := anObject
]
