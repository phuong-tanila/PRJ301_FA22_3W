/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import utils.DBUtil;

/**
 *
 * @author 15tha
 */
public class CourseDAO {

    private final int ITEM_PER_PAGE = 20;
    private static List<CourseDTO> list;
    public static final int ACTIVE = 1;
    public static final int SUSPENDED = 0;

    public List<CourseDTO> getTopSeller() throws SQLException {
        return getAll(ACTIVE)
                .stream()
                .sorted((c1, c2) -> c2.getSoldCount() - c1.getSoldCount())
                .limit(8)
                .collect(Collectors.toList());
    }

    public CourseDTO find(int courseID) throws SQLException {
        return getAll(ACTIVE)
                .stream()
                .filter(course -> course.getCourseID() == courseID)
                .findFirst()
                .orElse(null);
    }

    public List<CourseDTO> getAll(int status) throws SQLException {
        if (list == null || list.size() != countCourse(status)) {
            Connection conn = DBUtil.getConnection();
            PreparedStatement stm = conn.prepareCall("SELECT TOP (1000) [CourseID]\n"
                    + "      ,[Course_Name]\n"
                    + "      ,[Teacher_ID]\n"
                    + "      ,[CategoryID]\n"
                    + "      ,[Description]\n"
                    + "      ,[Slot]\n"
                    + "      ,[Tuition_Fee]\n"
                    + "      ,[Image_Url]\n"
                    + "      ,[Start_Date]\n"
                    + "      ,[End_Date]\n"
                    + "      ,[Status]\n"
                    + "      ,[LevelID]\n"
                    + "      ,[Created_By]\n"
                    + "      ,[Last_Update_Date]\n"
                    + "      ,[Last_Update_User]\n"
                    + "      ,[Created_At]\n"
                    + "      ,[sold_count]\n"
                    + "  FROM [TKK_Piano].[dbo].[Course]\n"
                    + "  where [Status] = ? ");
            stm.setInt(1, status);
            ResultSet rs = stm.executeQuery();
            List<CourseDTO> tmpList = new ArrayList<>();
            while (rs.next()) {
                mappingCourseFromDB(rs, tmpList);
            }
            list = tmpList;
        }
        return list;
    }

    public List<CourseDTO> findByName(String name, int skip, int limit) throws SQLException {
        return getAll(1)
                .stream()
                 .sorted((c1, c2) -> c2.getCreatedAt().compareTo(c1.getCreatedAt()))
                .filter(i
                        -> i
                        .getCourseName()
                        .toLowerCase()
                        .contains(name.toLowerCase()))
                .skip(skip).limit(limit)
                .collect(Collectors.toList());
    }

    public long CountByName(String name) throws SQLException {
        return getAll(1)
                .stream()
                .filter(i
                        -> i             
                        .getCourseName()
                        .toLowerCase()
                        .contains(name.toLowerCase()))
                .count();
    }

    public List<CourseDTO> findByCate(int cateId, int skip, int limit) throws SQLException {
        return getAll(1)
                .stream()
                .sorted((c1, c2) -> c2.getCreatedAt().compareTo(c1.getCreatedAt()))
                .filter(i
                        -> i
                        .getCategoryID() == cateId)
                .skip(skip).limit(limit)
                .collect(Collectors.toList());
    }

    public long CountByCate(int cateId) throws SQLException {
        return getAll(1)
                .stream()
                .filter(i
                        -> i
                        .getCategoryID() == cateId)
                .count();
    }

    public List<CourseDTO> getAll() throws SQLException {
        if (list == null || list.size() != countCourse()) {
            System.out.println("!@#");
            Connection conn = DBUtil.getConnection();
            PreparedStatement stm = conn.prepareCall("SELECT [CourseID]\n"
                    + "      ,[Course_Name]\n"
                    + "      ,[Teacher_ID]\n"
                    + "      ,[CategoryID]\n"
                    + "      ,[Description]\n"
                    + "      ,[Slot]\n"
                    + "      ,[Tuition_Fee]\n"
                    + "      ,[Image_Url]\n"
                    + "      ,[Start_Date]\n"
                    + "      ,[End_Date]\n"
                    + "      ,[Status]\n"
                    + "      ,[LevelID]\n"
                    + "      ,[Created_By]\n"
                    + "      ,[Last_Update_Date]\n"
                    + "      ,[Last_Update_User]\n"
                    + "      ,[Created_At]\n"
                    + "      ,[sold_count]\n"
                    + "  FROM [TKK_Piano].[dbo].[Course]");
            ResultSet rs = stm.executeQuery();
            List<CourseDTO> tmpList = new ArrayList<>();
            while (rs.next()) {
                mappingCourseFromDB(rs, tmpList);
            }
            list = tmpList;
        }
        return list;
    }

    public void mappingCourseFromDB(ResultSet rs, List<CourseDTO> list) throws SQLException {
        CourseDTO c = new CourseDTO();
        c.setCourseID(rs.getInt("CourseID"));
        c.setCourseName(rs.getString("Course_Name"));
        c.setTeacherID(rs.getInt("Teacher_ID"));
        c.setCategoryID(rs.getInt("CategoryID"));
        c.setDescription(rs.getString("Description"));
        c.setSlot(rs.getInt("Slot"));
        c.setTuitionFee(rs.getInt("Tuition_Fee"));
        c.setImageUrl(rs.getString("Image_Url"));
        c.setStartDate(rs.getDate("Start_Date"));
        c.setEndDate(rs.getDate("End_Date"));
        c.setStatus(rs.getInt("Status") == 1 ? "active" : "suspended");
        c.setLevelID(rs.getInt("LevelID"));
        c.setCreatedBy(rs.getInt("Created_By"));
        c.setLastUpdateDate(rs.getDate("Last_Update_Date"));
        c.setLastUpdateUser(rs.getInt("Last_Update_User"));
        c.setCreatedAt(rs.getDate("Created_At"));
        c.setSoldCount(rs.getInt("sold_count"));
        list.add(c);
    }

    public int countCourse() throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareCall("select count(CourseID) from Course");
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public int countCourse(int status) throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareCall("select count(CourseID) from Course where [status] = ? ");
        stm.setInt(1, status);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public static void main(String[] args) {
        try {
            for (CourseDTO x : new CourseDAO().findByCate(1, 0, 20)) {
                System.out.println(x.getCreatedAt() +"||"+ x.getCourseName());
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
