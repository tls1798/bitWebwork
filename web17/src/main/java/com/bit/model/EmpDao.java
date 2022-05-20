package com.bit.model;

import java.util.*;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.*;

public class EmpDao {
	public List<?> selectAll() {
		List<?>list = new ArrayList<>();
		String addr ="localhost:27017";
		MongoClient client =null;
		try {
			client=new MongoClient(addr);
			MongoDatabase db = client.getDatabase("testDB");
			MongoCollection<Document> rs= db.getCollection("sales");
			MongoCursor<Document> cur=rs.find().iterator();
			while(cur.hasNext()) {
				Document doc=cur.next();
				System.out.println(doc);
			}
		} finally {
			if(client!=null) client.close();
		}
		return list;
	}
}
