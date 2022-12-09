/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package level;

import lombok.AllArgsConstructor;
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
@AllArgsConstructor
public class LevelDTO {
    private int levelID;
    private String levelName;
}
