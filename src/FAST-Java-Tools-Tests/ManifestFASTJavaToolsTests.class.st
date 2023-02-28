"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFASTJavaToolsTests,
	#superclass : #PackageManifest,
	#category : #'FAST-Java-Tools-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestFASTJavaToolsTests class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#FASTJavaFlowGraphBuilderTest)) #'2023-02-22T19:25:35.860677+01:00') )
]
