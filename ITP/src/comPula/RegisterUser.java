package comPula;


import java.sql.*;
import java.sql.ResultSet;
import java.util.UUID;



public class RegisterUser {
	private String Name,uname,pass,NIC,address,lnum,vnum,vmodel,telephone,id;
    private Connection con;
private Statement st;
private ResultSet rs;
 private String url,duser,dpass;
   
   public  RegisterUser(){
            try {
                url="jdbc:mysql://localhost:3306/store";
    duser="root";
    dpass="root";
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection(url,duser,dpass);
         st=con.createStatement();
         System.out.println("DB Connected");
            }catch(Exception e){
            	System.out.println("DB Can't Connected");
            }
   }
   
    public  String inserDb(){
          id =UUID.randomUUID().toString().trim();
          
 String re="Error";
 String query ="INSERT INTO delivery_person_details(`DID`, `Name`, `Username`, `NIC`, `address`, `PhoneNumber`, `LicensNumber`, `VehicalNumber`, `VehicalType`, `Password`) VALUES ('"
                +id+"','" +Name+"','"+uname+"','"+NIC+"','"+address+"','"+telephone+"','"+lnum+"','"+vnum+"','"+vmodel+"','"+pass+"')";
        

         try {
            st.executeUpdate(query) ;
                   re= "Success/"+id;
       } catch (SQLException e) {
           if (e.toString().startsWith("java.sql.SQLIntegrityConstraintViolationException:")) {
        	   
             re="Username Alredy Tacken Enter Another Username";
       }
      
       }
     
    
   
 return re;
 }
   
    public  String getuserdetails(){
        String r="";
        String query1="select * from delivery_person_details where DID ='"+id+"'";
        try {
            rs= st.executeQuery(query1);
            if(rs.next()) {
                 r= rs.getString(1)+"~"+rs.getString(2)+"~"+rs.getString(3)+"~"+rs.getString(4)
                   +"~"+rs.getString(5)+"~"+rs.getString(6)+"~"+rs.getString(7)+"~"
                   +rs.getString(8)+"~"+rs.getString(9)+"~"+rs.getString(10) ;
            }
            
            
            
            
            
            
        } catch (Exception e) {
             r="Error "+ e;
        }
         
        return  r;
    }
    
    
     public  String updatedb(String upid){
         
 String re="Error";
 String query ="UPDATE `delivery_person_details` SET Name= '"+Name+"',"+" Username='"+uname+"',NIC='"+NIC+"',address='"+address+"',PhoneNumber='"+telephone+"',LicensNumber='"+lnum+"',VehicalNumber='"+vnum+"',"+" VehicalType='"+vmodel+"',Password='"+pass+"' WHERE DID='"+upid+"' Limit 1";
        

         try {
            st.executeUpdate(query) ;
                   re="success";
       } catch (SQLException e) {
           
               re=""+e;
           
      
       }
     
    
   
 return re;
 }
    
    public  String deletedb(String upid){
         
 String re="Error";
 String query ="DELETE FROM `delivery_person_details` WHERE DID='"+upid+"' Limit 1";
        

         try {
            st.executeUpdate(query) ;
                   re="success";
       } catch (SQLException e) {
           
               re=""+e;
          
      
       }
     
    
   
 return re;
 }
    
  
    
    
    
    
    
    
    
    public String logUser(String username,String password){
     String re="Error",x;
      String query="SELECT * FROM `delivery_person_details` WHERE Username='"+username+"' " ;
        try {
             rs= st.executeQuery(query);
             if (rs.next()) {
            
                 if ( rs.getString("Password").equals(password)) {
                     re="login/"+rs.getString("DID")   ;
                 }else{
                     re="Incorect Password";
                 }
                
            }else{
                 re="Username Incorrect";
             }
             
        } catch (Exception e) {
              re="error "+e;
        }
     return  re;
 }


    
    
    
    
    
    
    
    public String getId() {
     return id;
 }

 public void setId(String id) {
     this.id = id;
 }
    
    
   
 
  public void setName(String Name) {
     this.Name = Name;
 }
  
  
  public void setUname(String uname) {
	     this.uname = uname;
	 }
  
  
  
  public void setNIC(String NIC) {
	     this.NIC = NIC;
	 }
  
  
  public void setAddress(String address) {
	     this.address = address;
	 }
  
  
  public void setTelephone(String telephone) {
	     this.telephone = telephone;
	 }


  
  
  public void setLnum(String lnum) {
     this.lnum = lnum;
 }
  
  
  public void setVnum(String vnum) {
	     this.vnum = vnum;
	 }

 

 public void setVmodel(String vmodel) {
     this.vmodel = vmodel;
 }

 
 public void setPass(String pass) {
     this.pass = pass;
 }

	
	
}
