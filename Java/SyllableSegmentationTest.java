import java.io.IOException;

public class SyllableSegmentationTest {

	public static void main(String[] args) throws IOException {
		
		SyllableSegmentation syllableSegmentation = new SyllableSegmentation();
		
		String text = "တက္ကသိုလ်အသွားအပြန်ကို သင်္ဘောစီးပြီးသွားရတယ်။";
		
		System.out.println(text);
		
		System.out.println(syllableSegmentation.segment(text));
		
		System.out.println(syllableSegmentation.segment(text, "|"));		

	}

}
