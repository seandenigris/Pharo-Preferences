fixes
fixIssue5656
	"Issue 5656: Large fonts make tools slow 
 http://code.google.com/p/pharo/issues/detail?id=5656"

	| smallerFont |
	smallerFont := LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12.
	StandardFonts defaultFont: smallerFont.