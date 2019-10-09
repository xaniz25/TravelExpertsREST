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
import model.Package;


@Path("/package")
public class PackageRestService {


	//http://localhost:8080/TravelExperts/rs/package/getallpackages
	@GET
	@Path("/getallpackages")
    @Produces(MediaType.APPLICATION_JSON)
	public String getAllPackages() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Query query = em.createQuery("select c from Package c");
        List<Package> list = query.getResultList();
        Gson gson = new Gson();
        Type type = new TypeToken<List<Package>>() {}.getType();
        String response = gson.toJson(list, type);
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/package/getpackage/104
	@GET
	@Path("/getpackage/{packageid}")
    @Produces(MediaType.APPLICATION_JSON)
	public String getPackage(@PathParam("packageid") int packageId) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Package p = em.find(Package.class, packageId);
        //Query query = em.createQuery("select a from Package a where a.packageId=" + packageId);
        //Package c = (Package) query.getSingleResult();
        Gson gson = new Gson();
        Type type = new TypeToken<Package>() {}.getType();
        String response = gson.toJson(p, type);
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/package/postpackage/
	@POST
	@Path("/postpackage")
    @Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_JSON)
	public String postPackage(String jsonString) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Gson gson = new Gson();
        Package p = gson.fromJson(jsonString, Package.class);
        String response;
        em.getTransaction().begin();
        Package updatedPackage = em.merge(p);
        em.getTransaction().commit();
        if (updatedPackage != null){
        	response = "Updated";
        }
        else{
        	response = "Update Failed";
        }
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/package/putpackage
	@PUT
	@Path("/putpackage")
    @Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_JSON)
	public String putPackage(String jsonString)
	{
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Gson gson = new Gson();
        Package p = gson.fromJson(jsonString, Package.class);
        em.getTransaction().begin();
        Package insertedPackage = em.merge(p);
        em.getTransaction().commit();
        String response;
        if (insertedPackage != null){
        	response = "Inserted";
        }
        else{
        	response = "Insert Failed";
        }
        em.close();
        factory.close();
        return response;	
	}

	//http://localhost:8080/TravelExperts/rs/package/deletepackage/10
	@DELETE
	@Path("/deletepackage/{packageid}")
	public String deletePackage(@PathParam("packageid") int packageId) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TravelExperts");
        EntityManager em = factory.createEntityManager();
        Package p = em.find(Package.class, packageId);
        em.getTransaction().begin();
        em.remove(p);
        em.getTransaction().commit();
        em.close();
        factory.close();
        return "Package deleted";
	}
}
