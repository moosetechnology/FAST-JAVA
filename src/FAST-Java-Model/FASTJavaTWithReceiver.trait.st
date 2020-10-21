"
I can send message to someone
"
Trait {
	#name : #FASTJavaTWithReceiver,
	#instVars : [
		'#receiver => FMOne type: #FASTJavaTReceiver opposite: #receiverOwner'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTWithReceiver classSide >> annotation [

	<FMClass: #TWithReceiver super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaTWithReceiver >> receiver [
	"Relation named: #receiver type: #FASTJavaTReceiver opposite: #receiverOwner"

	<generated>
	<FMComment: 'My variable'>
	^ receiver
]

{ #category : #accessing }
FASTJavaTWithReceiver >> receiver: anObject [

	<generated>
	receiver := anObject
]

{ #category : #navigation }
FASTJavaTWithReceiver >> receiverGroup [
	<generated>
	<navigation: 'Receiver'>
	^ MooseSpecializedGroup with: self receiver
]
