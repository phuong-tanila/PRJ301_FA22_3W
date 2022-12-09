package course;

import java.util.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@NoArgsConstructor
@ToString
public class CourseDTO {
    private int courseID;
    private String courseName;
    private int teacherID;
    private int categoryID;
    private String description;
    private int slot;
    private int tuitionFee;
    private String imageUrl;
    private Date startDate;
    private Date endDate;
    private Date createdAt;
    private Date lastUpdateDate;
    private String status;
    private int levelID;
    private int createdBy;
    private int lastUpdateUser;
    private int soldCount;

}
