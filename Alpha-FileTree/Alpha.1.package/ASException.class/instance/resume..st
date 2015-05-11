handling
resume: resumeValue
	self isResumable ifFalse: [
		ASIllegalResumeAttempt signal
	].
	
	signalContext resume: resumeValue