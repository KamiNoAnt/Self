extends Node2D

var menge = 0
var mengeBad = 0
var mengeKugeln = 0
var mengeBan = 0
var mengeUsb = 0

#var r = 0.5
#var g = 0.1
#var b = 0.1
#var colRange = 0.3

#var redPal: Array = [Color('641220'), Color('85182A'), Color('A71E34'), Color('BD1F36'), Color('DA1E37')]
#var vioPal: Array = [Color('2F184B'), Color('532B88'), Color('9B72CF'), Color('C8B1E4'), Color('F4EFFA')]
#var cyanPal: Array = [Color('187261'), Color('31B591'), Color('39DCA3'), Color('91ECCC'), Color('E9FBF5')]

var paletten = {
	'mono_red': [Color('#FA2929'), Color('#FA5B4A'), Color('#E60920'), Color('#FAB2A4'), Color('#FA7249')],
	'mono_violet': [Color('2F184B'), Color('532B88'), Color('9B72CF'), Color('C8B1E4'), Color('F4EFFA')],
	'mono_cyan': [Color('187261'), Color('31B591'), Color('39DCA3'), Color('91ECCC'), Color('E9FBF5')],
	'mono_yellow': [Color('#EB7D21'), Color('#EBB623'), Color('#EB9E23'), Color('#EB8334'), Color('#EBE323')],
	'mono_green': [Color('#5AF72A'), Color('#2AF78F'), Color('#2AF749'), Color('#B0F72A'), Color('#80FF92')],
	'killjoy': [Color('#2AF7D7'), Color('#F7CB2A'), Color('#797258'), Color('#507872'), Color('#F62AF7')],
	'evangelion': [Color('#6EF72A'), Color('#F7682A'), Color('#795F54'), Color('#5258A2'), Color('#2A39F7')],
	'moss': [Color('#042940'), Color('#005C53'), Color('#9FC131'), Color('#DBF227'), Color('#D6D58E')],
	'platypus': [Color('#662400'), Color('#B33F00'), Color('#FF6B1A'), Color('#006663'), Color('#00B3AD')],
	'fruit_punch': [Color('#146152'), Color('#44803F'), Color('#B4CF66'), Color('#FFEC5C'), Color('#FF5A33')],
	'vaporwave': [Color('#F26BCE'), Color('#64278C'), Color('#F2C335'), Color('#F2B33D'), Color('#F29C6B')],
	'slim_poop': [Color('#B07F63'), Color('#B59988'), Color('#F0EFED'), Color('#6E4334'), Color('#51210D')],
	'lychee&rose': [Color('#73020C'), Color('#400106'), Color('#D99AAB'), Color('#D99923'), Color('#BF622C')],
	'black': [Color('111111')],
	'grey': [Color('555555')],
	'pure_white': [Color('EEEEEE')]
	}
	
var palette = 'mono_red'
