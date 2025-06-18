Class {
	#name : 'FASTJavaCFGVisitor',
	#superclass : 'FASTJavaVisitor',
	#traits : 'FASTCFGTVisitor',
	#classTraits : 'FASTCFGTVisitor classTrait',
	#category : 'FAST-Java-Tools-export',
	#package : 'FAST-Java-Tools',
	#tag : 'export'
}

{ #category : 'visiting - statements' }
FASTJavaCFGVisitor >> visitFASTJavaBreakStatement: aFASTJavaBreakStatement [

	self visitFASTTBreakStatement: aFASTJavaBreakStatement

]

{ #category : 'visiting - statements' }
FASTJavaCFGVisitor >> visitFASTJavaDoWhileStatement: aFASTJavaDoWhileStatement [
	^ self visitFASTTLoopStatement: aFASTJavaDoWhileStatement
]

{ #category : 'visiting - statements' }
FASTJavaCFGVisitor >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	^ self visitFASTTLoopStatement: aFASTJavaForEachStatement
]

{ #category : 'visiting - statements' }
FASTJavaCFGVisitor >> visitFASTJavaForStatement: aFASTJavaForStatement [
	^ self visitFASTTLoopStatement: aFASTJavaForStatement
]

{ #category : 'visiting - statements' }
FASTJavaCFGVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	^ self visitFASTTConditionalStatement: aFASTJavaIfStatement
]

{ #category : 'visiting - statements' }
FASTJavaCFGVisitor >> visitFASTJavaSwitchStatement: aFASTJavaSwitchStatement [
	^ self visitFASTTBranchStatement: aFASTJavaSwitchStatement
]

{ #category : 'visiting - statements' }
FASTJavaCFGVisitor >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [
	^ self visitFASTTLoopStatement: aFASTJavaWhileStatement
]
