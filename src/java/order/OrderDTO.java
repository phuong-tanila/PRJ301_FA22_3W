/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.util.Date;
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
public class OrderDTO {
    private int orderID;
    private int userID;
    private Date buyDate;
    private int totalPrice;
    private String paymentMethod;
    private String paymentStatus;
}
