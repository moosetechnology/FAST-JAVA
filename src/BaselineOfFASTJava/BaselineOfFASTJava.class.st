Class {
	#name : #BaselineOfFASTJava,
	#superclass : #BaselineOf,
	#category : #BaselineOfFASTJava
}

{ #category : #baselines }
BaselineOfFASTJava >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec description: 'Developement version of FAST Java using FamixNG for Pharo.'.
			spec author: 'BenoitVerhaeghe'.
			spec timestamp: '07/06/2018 00:00'.
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfFASTJava >> defineDependencies: spec [
	spec
		baseline: 'FAST'
		with: [ spec
				loads: #('default');
				repository: 'github://moosetechnology/FAST:master/src' ].
]

{ #category : #baselines }
BaselineOfFASTJava >> defineGroups: spec [
	spec
		group: 'core'
			with: #('FAST-Java-Model-Extension' 'FAST-Java-Model' 'FAST-Java-Generator');
		group: 'smacc'
			with: #('core' 'FAST-Java-SmaCC-Importer' 'FAST-Java-SmaCC-Importer-Tests');
		group: 'visitor'
			with: #('core' 'FAST-Java-Visitor');
		group: 'default' with: #('core')
]

{ #category : #baselines }
BaselineOfFASTJava >> definePackages: spec [
	spec
		repository: 'https://github.com/moosetechnology/FAST';
		package: 'BaselineOfFASTJava';
		package: 'FAST-Java-Model' with: [ spec requires: #('FAST') ];
		package: 'FAST-Java-Model-Generator';
		package: 'FAST-Java-Model-Extension' with: [ spec requires: #('FAST-Java-Model') ];
		package: 'FAST-Java-SmaCC-Importer';
		package: 'FAST-Java-SmaCC-Importer-Tests' with: [ spec requires: #('FAST-Java-SmaCC-Importer') ];
		package: 'FAST-Java-Visitor' with: [ spec requires: #('FAST-Java-Model') ]
]
