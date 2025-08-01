package org.example.baitap.models;

import org.example.baitap.entites.Group;
import org.example.baitap.entites.Student;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public List<Student> getAllStudent() throws SQLException {
        String sql = "SELECT `groups`.name as `group_name`, student_info.*\n" +
                "FROM `groups`\n" +
                "JOIN (\n" +
                "\tSELECT s.*, sub.name as `subject_name`\n" +
                "\tFROM students s\n" +
                "\tLEFT JOIN subject_student subs\n" +
                "\tON s.id = subs.student_id\n" +
                "\tLEFT JOIN subjects sub\n" +
                "\tON sub.id = subs.subject_id\n" +
                ") as `student_info`\n" +
                "ON `groups`.id = `student_info`.group_id";
        PreparedStatement statement = conn.prepareStatement(sql);

        ResultSet resultSet = statement.executeQuery();
        List<Student> list = new ArrayList<>();

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            int gender = resultSet.getInt("gender");
            String email = resultSet.getString("email");
            String phone = resultSet.getString("phone");
            Student student = new Student(id, name, gender, email, phone);

            int groupId = resultSet.getInt("group_id");
            String groupName = resultSet.getString("group_name");
            Group group = new Group(groupId, groupName);

            student.setGroup(group);
            list.add(student);
        }


        return  list;
    }

}
