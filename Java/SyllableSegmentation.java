import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * syllable breaking tool for Myanmar language
 *
 */
public class SyllableSegmentation {

	public static final String myConsonant = "\u1000-\u1021"; // "က-အ"

	public static final String enChar = "a-zA-Z0-9";

	// "ဣဤဥဦဧဩဪဿ၌၍၏၀-၉၊။!-/:-@[-`{-~\s"
	public static final String otherChar = "\u1023\u1024\u1025\u1026\u1027\u1029\u102a\u103f\u104c\u104d\u104f\u1040-\u1049\u104a\u104b!-/:-@\\[-`\\{-~\\s";

	public static final String ssSymbol = "\u1039";

	public static final String ngaThat = "\u1004\u103a";

	public static final String aThat = "\u103a";

	// Regular expression pattern for Myanmar syllable breaking
	// *** a consonant not after a subscript symbol AND a consonant is not
	// followed by a-That character or a subscript symbol
	public static final String BREAK_PATTERN = "((?<!" + ssSymbol + ")[" + myConsonant + "](?![" + aThat + ssSymbol
			+ "])" + "|[" + enChar + otherChar + "])";

	public synchronized List<String> segment(String text) {

		if (text == null) {
			throw new NullPointerException();
		}

		String[] outputs = text.replaceAll(BREAK_PATTERN, "\uD835\uDD4A$1").split("\uD835\uDD4A");

		List<String> segmentList = new ArrayList<String>(Arrays.asList(outputs));

		if (segmentList.size() > 0) {
			segmentList.remove(0);
		}

		return segmentList;
	}

	public synchronized String segment(String text, String separator) {
		if (text == null || separator == null) {
			throw new NullPointerException();
		}
		return text.replaceAll(BREAK_PATTERN, separator + "$1");
	}

}
