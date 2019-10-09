package main;


import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import java.lang.reflect.Type;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.Produces;
import javax.ws.rs.FormParam;
import javax.ws.rs.QueryParam;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.core.MediaType;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import model.Booking;


@Path("/booking")
public class BookingRestService {


	//http://localhost:8080/TravelExperts/rs/booking/getallbookings
	@GET
	@Path("/getallbookings")
    @Produces(MediaType.APPLICATION_JSON)
	public String getAllbookings() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Query query = em.createQuery("select b from Booking b");
        List<Booking> list = query.getResultList();
        Gson gson = new Gson();
        Type type = new TypeToken<List<Booking>>() {}.getType();
        String response = gson.toJson(list, type);
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/booking/getbooking/1
	@GET
	@Path("/getbooking/{bookingid}")
    @Produces(MediaType.APPLICATION_JSON)
	public String getbooking(@PathParam("bookingid") int bookingId) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Booking b = em.find(Booking.class, bookingId);
        //Query query = em.createQuery("select a from booking a where a.bookingId=" + bookingId);
        //booking c = (booking) query.getSingleResult();
        Gson gson = new Gson();
        Type type = new TypeToken<Booking>() {}.getType();
        String response = gson.toJson(b, type);
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/booking/postbooking/
	@POST
	@Path("/postbooking")
    @Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_JSON)
	public String postbooking(String jsonString) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Gson gson = new Gson();
        Booking b = gson.fromJson(jsonString, Booking.class);
        String response;
        em.getTransaction().begin();
        Booking updatedbooking = em.merge(b);
        em.getTransaction().commit();
        if (updatedbooking != null){
        	response = "Booking updated";
        }
        else{
        	response = "Update Failed";
        }
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/booking/putbooking
	@PUT
	@Path("/putbooking")
    @Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_JSON)
	public String putbooking(String jsonString){
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Gson gson = new Gson();
        Booking b = gson.fromJson(jsonString, Booking.class);
        em.getTransaction().begin();
        Booking insertedbooking = em.merge(b);
        em.getTransaction().commit();
        String response;
        if (insertedbooking != null){
        	response = "Inserted";
        }
        else{
        	response = "Insert Failed";
        }
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/booking/deletebooking/5
	@DELETE
	@Path("/deletebooking/{bookingid}")
	public String deleteBooking(@PathParam("bookingid") int bookingId) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Booking b = em.find(Booking.class, bookingId);
        em.getTransaction().begin();
        em.remove(b);
        em.getTransaction().commit();
        em.close();
        factory.close();
        return "Booking deleted";
	}
}
