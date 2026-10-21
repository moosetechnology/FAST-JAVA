"
I have a switch block: a list of case groups in colon form, or of rules in arrow form

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `cases` | `FASTJavaTWithSwitchBlock` | `javaCaseStatementSwitchOwner` | `FASTJavaCaseStatement` | The case groups of my switch block, in colon form|
| `rules` | `FASTJavaTWithSwitchBlock` | `switchOwner` | `FASTJavaSwitchRule` | The rules of my switch block, in arrow form|



"
Trait {
	#name : 'FASTJavaTWithSwitchBlock',
	#instVars : [
		'#cases => FMMany type: #FASTJavaCaseStatement opposite: #javaCaseStatementSwitchOwner',
		'#rules => FMMany type: #FASTJavaSwitchRule opposite: #switchOwner'
	],
	#category : 'FAST-Java-Model-Traits',
	#package : 'FAST-Java-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTJavaTWithSwitchBlock classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithSwitchBlock super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaTWithSwitchBlock >> addCase: anObject [

	<ignoreForCoverage>
	<generated>
	^ self cases add: anObject
]

{ #category : 'adding' }
FASTJavaTWithSwitchBlock >> addRule: anObject [

	<ignoreForCoverage>
	<generated>
	^ self rules add: anObject
]

{ #category : 'accessing' }
FASTJavaTWithSwitchBlock >> cases [
	"Relation named: #cases type: #FASTJavaCaseStatement opposite: #javaCaseStatementSwitchOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The case groups of my switch block, in colon form'>
	<derived>
	^ cases
]

{ #category : 'accessing' }
FASTJavaTWithSwitchBlock >> cases: anObject [

	<ignoreForCoverage>
	<generated>
	cases value: anObject
]

{ #category : 'accessing' }
FASTJavaTWithSwitchBlock >> rules [
	"Relation named: #rules type: #FASTJavaSwitchRule opposite: #switchOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The rules of my switch block, in arrow form'>
	<derived>
	^ rules
]

{ #category : 'accessing' }
FASTJavaTWithSwitchBlock >> rules: anObject [

	<ignoreForCoverage>
	<generated>
	rules value: anObject
]
