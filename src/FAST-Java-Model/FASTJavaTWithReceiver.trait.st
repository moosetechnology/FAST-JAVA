"
I can send a message to someone

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receiver` | `FASTJavaTWithReceiver` | `receiverOwner` | `FASTJavaTReceiver` | My receiver|



"
Trait {
	#name : 'FASTJavaTWithReceiver',
	#instVars : [
		'#receiver => FMOne type: #FASTJavaTReceiver opposite: #receiverOwner'
	],
	#category : 'FAST-Java-Model-Traits',
	#package : 'FAST-Java-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTJavaTWithReceiver classSide >> annotation [

	<FMClass: #TWithReceiver super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaTWithReceiver >> receiver [
	"Relation named: #receiver type: #FASTJavaTReceiver opposite: #receiverOwner"

	<generated>
	<FMComment: 'My receiver'>
	^ receiver
]

{ #category : 'accessing' }
FASTJavaTWithReceiver >> receiver: anObject [

	<generated>
	receiver := anObject
]

{ #category : 'navigation' }
FASTJavaTWithReceiver >> receiverGroup [
	<generated>
	<navigation: 'Receiver'>
	^ MooseSpecializedGroup with: self receiver
]
