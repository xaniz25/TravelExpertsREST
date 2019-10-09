package main;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.core.Application;
 

public class TravelRestServiceApplication  extends Application {
	
	private Set<Object> singletons = new HashSet<Object>();
	 
	public TravelRestServiceApplication() {
		singletons.add(new CustomerRestService());
		singletons.add(new BookingRestService());
		singletons.add(new PackageRestService());
	}
 
	@Override
	public Set<Object> getSingletons() {
		return singletons;
	}

	@Override
	public Set<Class<?>> getClasses() {
		return null;
	}

}
