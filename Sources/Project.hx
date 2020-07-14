import kha.Color;
import kha.Framebuffer;


class Project {
    static var logo = ["1 1 1 1 111", "11  111 111", "1 1 1 1 1 1"];
    
    public function new(): Void {
    }

	public function update(): Void {
	}

	public function render(frames: Array<Framebuffer>): Void {
		// As we are using only 1 window, grab the first framebuffer
		final fb = frames[0];
		// Now get the `g2` graphics object so we can draw
		final g2 = fb.g2;
		// Start drawing, and clear the framebuffer to `petrol`
		g2.begin(true, Color.fromBytes(0, 95, 106));
		// Offset all following drawing operations from the top-left a bit
		g2.pushTranslation(64, 64);
		// Fill the following rects with red
		g2.color = Color.Red;

		// Loop over the logo (Array<String>) and draw a rect for each "1"
		for (rowIndex in 0...logo.length) {
		  final row = logo[rowIndex];

		  for (colIndex in 0...row.length) {
		    switch row.charAt(colIndex) {
		      case "1": g2.fillRect(colIndex * 16, rowIndex * 16, 16, 16);
		      case _:
		    }
		  }
		}

		// Pop the pushed translation so it will not accumulate over multiple frames
		g2.popTransformation();
		// Finish the drawing operations
		g2.end();
	}
}