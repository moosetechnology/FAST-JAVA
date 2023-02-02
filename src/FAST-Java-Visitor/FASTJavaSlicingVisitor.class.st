"
A FASTJavaVisitor for slicing method. It returns a copy of the Statement-block with only the sliced statements

```
FASTJavaSlicingVisitor new
	seedVariable: aString ;
	sliceMethod: aFASTJavaMethodEntity ;
```
"
Class {
	#name : #FASTJavaSlicingVisitor,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'profiles',
		'currentIndex'
	],
	#category : #'FAST-Java-Visitor-Slicing'
}

{ #category : #initialization }
FASTJavaSlicingVisitor >> initialize [ 
	super initialize.
	profiles := OrderedCollection new.
	currentIndex := 1
]

{ #category : #visiting }
FASTJavaSlicingVisitor >> visitFASTJavaParameter: aFASTJavaParameter [

	profiles add: (FASTSliceProfile new
		variableName: aFASTJavaParameter variable name ;
		index: currentIndex ;
		yourself)
]

{ #category : #visiting }
FASTJavaSlicingVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	profiles add: (FASTSliceProfile new
		variableName: aFASTJavaVariableDeclarator variable name ;
		index: currentIndex ;
		yourself)
]
