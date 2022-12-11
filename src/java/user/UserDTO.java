/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author 15tha
 */
@Getter @Setter
@NoArgsConstructor
@ToString
public class UserDTO {
    
    private int userID;
    private String username;
    private String password;
    private String fullName;
    private String phone;
    private String email;
    private String role;
    
    public boolean isAdmin(){
        return role.equalsIgnoreCase("AD");
    }
}
