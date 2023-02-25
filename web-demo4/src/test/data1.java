package test;

import java.sql.*;
import java.util.concurrent.Callable;
import java.util.regex.Pattern;

public class data1 {
    String hubie;
    String type;
    String square;
    String number;
    String name;
    String id;
    String sex;
    String minzu;
    String edu;

    public String getHubie() {
        return hubie;
    }

    public void setHubie(String hubie) {
        this.hubie = hubie;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSquare() {
        return square;
    }

    public void setSquare(String square) {
        this.square = square;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMinzu() {
        return minzu;
    }

    public void setMinzu(String minzu) {
        this.minzu = minzu;
    }

    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu;
    }
    //*************************************数据初始化***********************************
    public Connection getConnection()//连接数据库
    {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");//加载驱动
        }
        catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        String user = "root";
        String password = "123456";
        String url = "jdbc:mysql://localhost:3306/kechengbiao?useSSL=false&serverTimezone=GMT&characterEncoding=utf-8&autoReconnect=true";
        Connection con=null;
        try{
            con= DriverManager.getConnection(url,user,password);
            //System.out.println("数据库连接成功");
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return con;

    }

    public void close (Connection con){
        try{
            if(con!=null){
                con.close();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public  void close (PreparedStatement preparedStatement)
    {
        try{
            if(preparedStatement!=null)
            {
                preparedStatement.close();
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
    }
    public  void close(ResultSet resultSet)
    {
        try{
            if(resultSet!=null)
            {
                resultSet.close();
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
    }//**********************************以上为数据库连接和关闭的方法**********************************************
//增加操作
    public void adddata(String hubie,String type,String square,String number,String name,String id,String sex,String minzu,String edu)
    {
        Connection connection = getConnection();
        PreparedStatement preparedStatement=null;
        try {
            //hubie,housetype,houseS,home,name,id,sex,minzu,edu;
            String sql = "insert into pucha (户别,住房类型,住房面积,房间数,姓名,身份证号码,性别,民族,教育程度) values (?,?,?,?,?,?,?,?,?)";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,hubie);
            preparedStatement.setString(2,type);
            preparedStatement.setString(3,square);
            preparedStatement.setString(4,number);
            preparedStatement.setString(5,name);
            preparedStatement.setString(6,id);
            preparedStatement.setString(7,sex);
            preparedStatement.setString(8,minzu);
            preparedStatement.setString(9,edu);
            preparedStatement.executeUpdate();
            //System.out.println("添加成功");

        } catch (SQLException  e) {
            e.printStackTrace();
        }finally{
            close(preparedStatement);
            close(connection);

        }

    }
    //判断是否为整数
    public boolean ifInteger(String str){
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        return pattern.matcher(str).matches();
    }
    //判断身份证号是否正确
    public boolean ifIdRight(String str){
        int len = str.length();
      if(len==18){
          for(int i =0;i<len-1;i++){
            char temp = str.charAt(i);
            if(temp=='0'||temp=='1'||temp=='2'||temp=='3'||temp=='4'||temp=='5'||temp=='6'||temp=='7'||temp=='8'||temp=='9'){
                continue;
            }else return false;
          }
          char temp = str.charAt(len-1);
          if(temp!='0'&&temp!='1'&&temp!='2'&&temp!='3'&&temp!='4'&&temp!='5'&&temp!='6'&&temp!='7'&&temp!='8'&&temp!='9'&&temp!='X'){
              return false;
          }
          else return true;

      }
      else {
          return false;
      }

    }
    //判断姓名和身份证号是否存在
    public boolean ifNameRepeat(String name){
        Connection conn = getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try{
            String sql = "select * from pucha";
            preparedStatement = conn.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()){
            if(name.equals(rs.getObject(5))||name.equals(rs.getObject(6))){
                return true;
            }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            close(conn);
            close(rs);
            close(preparedStatement);
        }
return false;
    }
    //删除
    public void deleteData(String name){
        Connection conn = getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try{
            String sql = "delete from pucha where 姓名= ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1,name);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            close(conn);
            close(preparedStatement);
            close(rs);
        }
    }
    public void updateData(String name,String id,String sex,String minzu,String edu){
        Connection conn = getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try{
            String sql = "update pucha set 身份证号码=?,性别=?,民族=?,教育程度=? where 姓名=?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1,id);
            preparedStatement.setString(2,sex);
            preparedStatement.setString(3,minzu);
            preparedStatement.setString(4,edu);
            preparedStatement.setString(5,name);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(conn);
            close(rs);
            close(preparedStatement);
        }
    }

}
