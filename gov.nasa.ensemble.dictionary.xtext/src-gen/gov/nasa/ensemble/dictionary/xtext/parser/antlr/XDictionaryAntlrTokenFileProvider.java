/*
* generated by Xtext
*/
package gov.nasa.ensemble.dictionary.xtext.parser.antlr;

import java.io.InputStream;
import org.eclipse.xtext.parser.antlr.IAntlrTokenFileProvider;

public class XDictionaryAntlrTokenFileProvider implements IAntlrTokenFileProvider {
	
	@Override
	public InputStream getAntlrTokenFile() {
		ClassLoader classLoader = getClass().getClassLoader();
    	return classLoader.getResourceAsStream("gov/nasa/ensemble/dictionary/xtext/parser/antlr/internal/InternalXDictionary.tokens");
	}
}
