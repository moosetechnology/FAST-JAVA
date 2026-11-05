Class {
	#name : 'BaselineOfFASTJava',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFASTJava',
	#package : 'BaselineOfFASTJava'
}

{ #category : 'baselines' }
BaselineOfFASTJava >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : 'accessing' }
BaselineOfFASTJava >> customProjectAttributes [

	^ self class environment
		  at: #BaselineOfFamix
		  ifPresent: [ #(  ) ]
		  ifAbsent: [ #( #NeedsMoose ) ]
]

{ #category : 'baselines' }
BaselineOfFASTJava >> defineDependencies: spec [

	spec baseline: 'FAST' with: [ 
		spec
			loads: #( 'default' );
			repository: 'github://moosetechnology/FAST:v3/src' ].
	spec
		project: 'FASTTool'
		copyFrom: 'FAST'
		with: [ spec loads: #( 'core' 'tools' ) ].


	self defineSmaCCPackages: spec.

	spec for: #NeedsMoose do: [ 
		spec baseline: 'Famix' with: [ 
			spec
				loads: #( 'Core' 'Basic' );
				repository: 'github://moosetechnology/Famix:development/src' ].
		spec
			baseline: 'TinyLogger'
			with: [ spec repository: 'github://jecisc/TinyLogger:v1.x.x/src' ] ]
]

{ #category : 'baselines' }
BaselineOfFASTJava >> defineGroups: spec [

	spec
		group: 'core' with: #( 'FAST-Java-Model' 'FAST-Java-Model-Extension' 'FAST-Java-Deprecated' 'FAST-Java-Model-Generator' );
		group: 'tools' with: #( 'visitor' 'FAST-Java-Tools' 'FAST-Java-Tools-Tests' );
		group: 'SmaCCRuntime' with: #( 'SmaCC_Runtime' 'SmaCC_GLR_Runtime' 'SmaCC_Incremental_Runtime' 'SmaCC_Source_Editing' );
		group: 'SmaCC' with: #( 'SmaCCRuntime' 'SmaCC_Java' );
		group: 'smacc' with: #( 'core' 'SmaCC' 'FAST-Java-SmaCC-Importer' 'FAST-Java-SmaCC-Importer-Tests' );
		group: 'visitor' with: #( 'core' 'FAST-Java-Visitor' );
		group: 'highlighter' with: #( 'core' 'FAST-Java-Highlighter' );
		group: 'all' with: #( 'smacc' 'visitor' 'highlighter' 'tools' );
		group: 'default' with: #( 'core' ).

	spec for: #NeedsMoose do: [
			spec group: 'smacc' with: #( 'core' 'SmaCC' 'FAST-Java-SmaCC-Importer' 'FAST-Java-SmaCC-Importer-Tests'
			   'TinyLogger' ) ]
]

{ #category : 'baselines' }
BaselineOfFASTJava >> definePackages: spec [

	spec
		package: 'FAST-Java-Model' with: [ spec requires: #( 'FAST' ) ];
		package: 'FAST-Java-Model-Generator';
		package: 'FAST-Java-Model-Extension' with: [ spec requires: #( 'FAST-Java-Model' ) ];
		package: 'FAST-Java-Deprecated' with: [ spec requires: #( 'FAST-Java-Model' ) ];
		package: 'FAST-Java-SmaCC-Importer';
		package: 'FAST-Java-SmaCC-Importer-Tests' with: [ spec requires: #( 'FAST-Java-SmaCC-Importer' ) ];
		package: 'FAST-Java-Visitor' with: [ spec requires: #( 'FAST-Java-Model' ) ];
		package: 'FAST-Java-Highlighter' with: [ spec requires: #( 'FAST-Java-Model' 'FASTTool' ) ].

	"Tools"
	spec
		package: 'FAST-Java-Tools' with: [ spec requires: #( 'FAST-Java-Visitor' 'FASTTool' ) ];
		package: 'FAST-Java-Tools-Tests' with: [ spec requires: #( 'FAST-Java-Tools' ) ].

	"In case of no Famix loaded"
	spec for: #NeedsMoose do: [ spec package: 'FAST-Java-Model' with: [ spec requires: #( 'FAST' 'Famix' ) ] ]
]

{ #category : 'baselines' }
BaselineOfFASTJava >> defineSmaCCPackages: spec [
	"The packages `BaselineOfSmaCC` would have loaded, named here rather than reached
	through it. Going through it cannot be pinned: it nests every project it defines
	at `github://j-brant/SmaCC:/src`, and Metacello reads that empty version as
	`master`, so the parser would float whatever version this baseline asked for."

	| repository |
	repository := self smaccRepository.
	spec
		package: 'SmaCC_Runtime' with: [ spec repository: repository ];
		package: 'SmaCC_GLR_Runtime' with: [
			spec
				requires: #( 'SmaCC_Runtime' );
				repository: repository ];
		package: 'SmaCC_Incremental_Runtime' with: [
			spec
				requires: #( 'SmaCC_GLR_Runtime' );
				repository: repository ];
		package: 'SmaCC_Source_Editing' with: [ spec repository: repository ];
		package: 'SmaCC_Java' with: [
			spec
				requires: #( 'SmaCCRuntime' );
				repository: repository ]
]

{ #category : 'accessing' }
BaselineOfFASTJava >> smaccRepository [
	"SmaCC pinned to a commit of master. Not to a tag: its tags are cut by a bot on a
	release branch that master is not an ancestor of, so no tag names a point of the
	history loaded here. Not to the branch: that is what leaves a build at the mercy
	of whatever landed since. Bump this deliberately."

	^ 'github://j-brant/SmaCC:8c1dd09d00f6cbdd0bc37e3722291056c851fabf/src'
]
