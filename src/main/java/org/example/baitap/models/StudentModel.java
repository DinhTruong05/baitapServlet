package org.example.baitap.models;

import org.example.baitap.entites.Group;
import org.example.baitap.entites.Student;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentModel extends BaseModel {
    public void createStudent(Student student, int groupID) throws SQLException {
        String sql = "INSERT INTO students (name, gender, email, phone,group_id ) VALUES (?, ?, ?, ?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, student.getName());
        ps.setInt(2, student.getGender());
        ps.setString(3, student.getEmail());
        ps.setString(4, student.getPhone());
        ps.setInt(5, groupID);
        ps.executeUpdate();
    }

    public void deleteStudent(int id) throws SQLException {
        String sql = "DELETE FROM students WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.execute();

    }

    public void updateStudent(Student student, int studentId, String groupId ) throws SQLException {
        String sql = "UPDATE students SET name = ?, gender =?, email = ?, phone = ?, group_id = ? WHERE id = ?";
        PreparedStatement preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1,student.getName());
        preparedStatement.setInt(2,student.getGender());
        preparedStatement.setString(3,student.getEmail());
        preparedStatement.setString(4,student.getPhone());
        preparedStatement.setString(5,groupId);
        preparedStatement.setInt(6,studentId);
        preparedStatement.execute();
    }

    public Student findStudentByID(int id) throws SQLException {
        String sql = "SELECT students.*, `groups`.name as 'group_name' FROM students\n" +
                "JOIN `groups` ON students.group_id = `groups`.id WHERE students.id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet resultSet = ps.executeQuery();
        Student s = null;
        if (resultSet.next()) {
            int idStudent = resultSet.getInt("id");
            String name = resultSet.getString("name");
            int gender = resultSet.getInt("gender");
            String email = resultSet.getString("email");
            String phone = resultSet.getString("phone");
            int groupId = resultSet.getInt("group_id");
            String groupName = resultSet.getString("group_name");
            Group group = new Group(groupId, groupName);
            s = new Student(idStudent, name, gender, email, phone);
            s.setGroup(group);
        }
        return s;
    }
}
