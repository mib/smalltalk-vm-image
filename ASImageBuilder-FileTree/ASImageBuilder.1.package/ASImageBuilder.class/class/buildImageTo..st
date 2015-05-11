building
buildImageTo: aStream
	self initialize.
	ASIndexableObjectStorage initialize.
	
	^ self new
		stream: aStream;
		buildImage