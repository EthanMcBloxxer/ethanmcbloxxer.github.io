# 1char spec
1char is a language in which keywords consist of single characters. The language doesn't actually exist, this is just an exoskeleton. You can't really program in it.

	+	Add
	-	Subtract
	*	Multiply
	/	Divide
	%	Modulo
	^	Exponent
	#	Length
	==	val == val ~ true
	!=	val != var ~ true
	<=	Less than or equal to
	>=	Greater than or equal to
	<	Less than
	>	Greater than
	+=	Shorthand for val = val + __
	=	Set
	
	&	and
	|	or
	!	not
	@	variable
	f	function
	z	null
	~	return
	y	true
	n	false
	?	if
	,	else
	;	loop (condition)
	_	yield (miliseconds)
	.	break
	
	-=[ comment ]=-

In a basic example,

	@variable="string text"
	@boolean=y
	@otherName=30
	
	?otherName != 20 {
		;otherName !=20 {
			_2000
			say("looping")
		}
		say("otherName == 20, loop break")
	}
	
	_10000
	@otherName=20

The expected output:

	[00:00:00] looping
	[00:00:02] looping
	[00:00:04] looping
	[00:00:06] looping
	[00:00:08] looping
	[00:00:10] otherName == 20, loop break
	
	[00:00:10] Unknown program exited with exit code 0.

Loops automatically create a new thread to run the loop on.
