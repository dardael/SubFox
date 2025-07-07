*-- SubFox Main --*
*-- Mainline entry point program for SubFox.APP or .EXE
*-- Simplified version supporting only Encode and Decode operations

LPARAMETERS sOption, p1,p2,p3,p4,p5,p6,p7,p8,p9

sOption = PROPER( ALLTRIM( EVL( sOption, "Encode" ) ) )
DO CASE
CASE sOption == "Encode" && Tortoise command
	LOCAL o
	o = NEWOBJECT( "SubFoxTortoiseTools", "SubFox Tortoise.prg" )
	o.Encode( p1 )
CASE sOption == "Decode" && Tortoise command
	LOCAL o
	o = NEWOBJECT( "SubFoxTortoiseTools", "SubFox Tortoise.prg" )
	o.Decode( p1 )
OTHERWISE
	*-- Invalid option - show usage
	LOCAL sMsg
	TEXT TO sMsg NOSHOW
	SubFox Usage:
	
	  SubFox Encode <file_list>  - Encode VFP files to text format
	  SubFox Decode <file_list>  - Decode text files back to VFP format
	
	Where <file_list> is a file containing paths to files to process.
	ENDTEXT
	MESSAGEBOX(sMsg, 64, "SubFox - Encode/Decode Only")
ENDCASE
