/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order_item;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import user.UserDTO;

@Getter @Setter
@NoArgsConstructor
@ToString
public class OrderItemDTO {
    private int OrderID;
    private int courseID;
    private int quantity = 1;
    private double price;
    
    
    private course.CourseDTO course;
    private UserDTO user;
    
}
