/*
 * generated by Xtext
 */
package gov.nasa.ensemble.dictionary.xtext.generator

import java.io.ByteArrayOutputStream
import java.io.IOException
import java.util.Collections
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.xtext.generator.IFileSystemAccess
import org.eclipse.xtext.generator.IGenerator
import org.eclipse.emf.common.util.URI

/**
 * Generates code from your model files on save.
 * 
 * see http://www.eclipse.org/Xtext/documentation.html#TutorialCodeGeneration
 */
class XDictionaryGenerator implements IGenerator {
	
	override void doGenerate(Resource resource, IFileSystemAccess fsa) {
		var reg = Resource.Factory.Registry.INSTANCE;
    	var map = reg.getExtensionToFactoryMap();
 	   	map.put("ad", new XMIResourceFactoryImpl());
		val uri = resource.URI;
		val filename = uri.lastSegment.replace(".xad", ".ad");
		var rs = new ResourceSetImpl();
		var xmiResource = rs.createResource(URI.createURI(filename));
		var dictionary = resource.getContents().get(0);
		
		xmiResource.getContents().add(dictionary);
		var out = new ByteArrayOutputStream();
		try {
			xmiResource.save(out, Collections.EMPTY_MAP);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		fsa.generateFile(filename, out.toString);
	}
	
}
