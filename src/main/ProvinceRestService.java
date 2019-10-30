/* Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers */

package main;


import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import model.Province;


@Path("/province")
public class ProvinceRestService {

	//http://localhost:8080/TravelExperts/rs/province/getprovinces
	@GET
	@Path("/getprovinces")
    @Produces(MediaType.TEXT_PLAIN)
	public String getSomething() {
		EntityManagerFactory factory= Persistence.createEntityManagerFactory("TravelExperts");
		EntityManager em = factory.createEntityManager();
		Query query = em.createQuery("SELECT p FROM Province p");
		List<Province> list = query.getResultList();
		Gson gson = new Gson();
		Type type = new TypeToken<List<Province>>() {}.getType();
		return gson.toJson(list, type);
	}
	
		//http://localhost:8080/TravelExperts/rs/province/getprovincesfromcountry/Canada
		@GET
		@Path("/getprovincesfromcountry/{country}")
	    @Produces(MediaType.APPLICATION_JSON)
		public String getAgencyAgents(@PathParam("country") String country) {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
			EntityManager em = factory.createEntityManager();
			Query query = em.createQuery("select p from Province p where p.country='" + country +"'");
			List<Province> list = query.getResultList();
			Gson gson = new Gson();
			Type type = new TypeToken<List<Province>>() {}.getType();
			return gson.toJson(list, type);
		}
}