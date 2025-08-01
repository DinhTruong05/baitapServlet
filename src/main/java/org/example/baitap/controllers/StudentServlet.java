package org.example.baitap.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.baitap.dataBase.DBConnect;
import org.example.baitap.entites.Group;
import org.example.baitap.entites.Student;
import org.example.baitap.entites.Subject;
import org.example.baitap.models.StudentModel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"/student/*"})
public class StudentServlet extends HttpServlet {
    Connection conn = null;
    StudentModel studentModel;

    @Override
    public void init() {
        DBConnect dbConnect = new DBConnect();
        conn = dbConnect.getConnection();
        studentModel = new StudentModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String uri = req.getPathInfo();
        if (uri == null) {
            uri = "";
        }
        switch (uri) {
            case "/":
            case "":
                showListUserPage(req,resp);
                break;
            case "/create":
                showCreatPage(req, resp);
                break;
            case "/edit":
                showEditPage(req,resp);
                break;
            case "/delete":
                deleteStudent(req,resp);
                break;
            case "/search":
                searchStudent(req, resp);
                break;
            case "/subject":
                showListSubject(req, resp);
                break;
            case "/createsubject":
                addSubject(req, resp);
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String uri = req.getPathInfo();
        if (uri == null) {
            uri = "";
        }
        switch (uri) {
            case "/edit":
                editStudent(req, resp);
                break;
            case "/store":
                storeStudent(req,resp);
                break;

        }
    }

    public void showListUserPage(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try{
            String sql = "SELECT students.*, `groups`.name as 'group_name' FROM students\n" +
                    "JOIN `groups` ON students.group_id = `groups`.id";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
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
            req.setAttribute("listStudent", list);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/student/list.jsp");
            dispatcher.forward(req, resp);

        }catch (SQLException | IOException e){
            throw new RuntimeException(e);
        }
    }



    private void showCreatPage(HttpServletRequest req, HttpServletResponse resp) {
        try {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/student/create.jsp");
            dispatcher.forward(req, resp);
        }catch (ServletException | IOException e){
            throw new RuntimeException();
        }
    }
    private void storeStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String name = req.getParameter("name");
            int gender = Integer.parseInt(req.getParameter("gender"));
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            int groupID = Integer.parseInt(req.getParameter("group_id"));

            Student student = new Student(name, gender, email, phone);
            studentModel.createStudent(student, groupID);

            resp.sendRedirect("/student");
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void deleteStudent(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            studentModel.deleteStudent(id);
            response.sendRedirect("/student");
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void showEditPage(HttpServletRequest request, HttpServletResponse response){

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Student studentEdit = this.findStudentByID(id);
            if(studentEdit == null){
                response.sendRedirect("/student?error=notfound");
                return;
            }
            List<Group> listGroup = getAllGroup();
            request.setAttribute("studentEdit", studentEdit);
            request.setAttribute("listGroup", listGroup);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/student/edit.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void editStudent(HttpServletRequest request, HttpServletResponse response){
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Student studentEdit = this.findStudentByID(id);
            if(studentEdit == null){
                response.sendRedirect("/student?error=notfound");
                return;
            }
            String name = request.getParameter("name");
            int gender = Integer.parseInt(request.getParameter("gender"));
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String groupId = request.getParameter("group_id");
            Student student = new Student(id, name, gender, email, phone);

            studentModel.updateStudent(student, id, groupId);

            response.sendRedirect("/student");

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private Student findStudentByID(int id) throws SQLException {

        return studentModel.findStudentByID(id);
    }
    private List<Group> getAllGroup() throws SQLException {
        List<Group> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM `groups`";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Group group = new Group(id, name);
                list.add(group);

        }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return list;
    }

    public void searchStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String keyword = request.getParameter("keyword");
            String sql = "SELECT * FROM students WHERE name LIKE ? OR email LIKE ? ";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, '%' + keyword + '%');
            preparedStatement.setString(2, '%' + keyword + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Student> list = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int gender = resultSet.getInt("gender");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");

                Student student = new Student(id, name, gender, email, phone);
                list.add(student);
            }
            request.setAttribute("listStudent", list);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/student/list.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void showListSubject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String sql = "SELECT * FROM subjects";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Subject> list = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");

                Subject subject = new Subject(id, name);
                list.add(subject);
            }
            request.setAttribute("listSubject", list);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/student/subject.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addSubject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            Subject subject = new Subject(name);


            String sql = "INSERT INTO subjects (name) VALUES (?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, subject.getName());
            preparedStatement.executeUpdate();
            response.sendRedirect("/student/subject");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
