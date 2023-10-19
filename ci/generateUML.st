documentor := FamixUMLDocumentor new.
documentor
    model: FASTModel color: Color white;
    model: FASTJavaModel color: Color lightBlue;
    excludeClasses: { FASTModel. FASTJavaModel };
    generate.

'fast-java.puml' asFileReference writeStreamDo: [ :stream |
    FamixUMLPlantUMLBackend new
        outputStream:  stream;
        export: documentor umlEntities.
].

Smalltalk snapshot: false andQuit: true
