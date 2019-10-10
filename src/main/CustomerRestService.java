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
import javax.ws.rs.core.MediaType;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import model.Customer;


@Path("/customer")
public class CustomerRestService {


	//http://localhost:8080/TravelExperts/rs/customer/getallcustomers
	@GET
	@Path("/getallcustomers")
    @Produces(MediaType.APPLICATION_JSON)
	public String getAllCustomers() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Query query = em.createQuery("select c from Customer c");
        List<Customer> list = query.getResultList();
        Gson gson = new Gson();
        Type type = new TypeToken<List<Customer>>() {}.getType();
        String response = gson.toJson(list, type);
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/customer/getcustomer/104
	@GET
	@Path("/getcustomer/{customerid}")
    @Produces(MediaType.APPLICATION_JSON)
	public String getCustomer(@PathParam("customerid") int customerId) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Customer c = em.find(Customer.class, customerId);
        //Query query = em.createQuery("select a from Customer a where a.customerId=" + customerId);
        //Customer c = (Customer) query.getSingleResult();
        Gson gson = new Gson();
        Type type = new TypeToken<Customer>() {}.getType();
        String response = gson.toJson(c, type);
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/customer/postcustomer/
	@POST
	@Path("/postcustomer")
    @Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_JSON)
	public String postCustomer(String jsonString) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Gson gson = new Gson();
        Customer c = gson.fromJson(jsonString, Customer.class);
        String response;
        em.getTransaction().begin();
        Customer updatedCustomer = em.merge(c);
        em.getTransaction().commit();
        if (updatedCustomer != null){
        	response = "Updated";
        }
        else{
        	response = "Update Failed";
        }
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/customer/putcustomer
	@PUT
	@Path("/putcustomer")
    @Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_JSON)
	public String putCustomer(String jsonString){
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Gson gson = new Gson();
        Customer c = gson.fromJson(jsonString, Customer.class);
        em.getTransaction().begin();
        Customer insertedCustomer = em.merge(c);
        em.getTransaction().commit();
        String response;
        if (insertedCustomer != null){
        	response = "Inserted";
        }
        else{
        	response = "Insert Failed";
        }
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/customer/deletecustomer/10
	@DELETE
	@Path("/deletecustomer/{customerid}")
	public String deleteCustomer(@PathParam("customerid") int customerId) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Customer c = em.find(Customer.class, customerId);
        em.getTransaction().begin();
        em.remove(c);
        em.getTransaction().commit();
        em.close();
        factory.close();
        return "Customer deleted";
	}
}
