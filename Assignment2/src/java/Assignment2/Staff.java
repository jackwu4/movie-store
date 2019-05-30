package Assignment2;


public class Staff {
    private String firstname;
    private String lastname;
    private String email;
    private String position;
    private String address;
    private String status;
    private String password;
    
    public Staff(String firstname, String lastname, String email, String position, String address, String status, String password){
        super();
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.position = position;
        this.address = address;
        this.status = status;
        this.password = password;
    }

    public String getFirstName() {
        return firstname;
    }

    public void setFirstName(String firstname) {
        this.firstname = firstname;
    }
    
    public String getLastName(){
        return lastname;
    }
    
    public void setLastName(String lastname){
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
}
