/* Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers */

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
		singletons.add(new ProvinceRestService());
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
