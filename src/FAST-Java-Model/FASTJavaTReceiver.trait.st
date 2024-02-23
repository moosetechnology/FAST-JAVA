"
I receive a message from someone

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receiverOwner` | `FASTJavaTReceiver` | `receiver` | `FASTJavaTWithReceiver` | The owner of the receiver|



"
Trait {
	#name : #FASTJavaTReceiver,
	#instVars : [
		'#receiverOwner => FMOne type: #FASTJavaTWithReceiver opposite: #receiver'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTReceiver classSide >> annotation [

	<FMClass: #TReceiver super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaTReceiver >> receiverOwner [
	"Relation named: #receiverOwner type: #FASTJavaTWithReceiver opposite: #receiver"

	<generated>
	<FMComment: 'The owner of the receiver'>
	<container>
	<derived>
	^ receiverOwner
]

{ #category : #accessing }
FASTJavaTReceiver >> receiverOwner: anObject [

	<generated>
	receiverOwner := anObject
]

{ #category : #navigation }
FASTJavaTReceiver >> receiverOwnerGroup [
	<generated>
	<navigation: 'ReceiverOwner'>
	^ MooseSpecializedGroup with: self receiverOwner
]
