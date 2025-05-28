"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestFASTJavaModelGenerator',
	#superclass : 'PackageManifest',
	#category : 'FAST-Java-Model-Generator-Manifest',
	#package : 'FAST-Java-Model-Generator',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestFASTJavaModelGenerator class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#FASTJavaMetamodelGenerator)) #'2025-05-28T16:11:42.740747+02:00') )
]

{ #category : 'code-critics' }
ManifestFASTJavaModelGenerator class >> ruleRefersToClassRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#FASTJavaMetamodelGenerator)) #'2025-05-28T15:05:53.405911+02:00') )
]
