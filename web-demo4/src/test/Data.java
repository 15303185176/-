package test;

import java.sql.*;

public class Data {
    String topic ;
    String purpose;
    String type;
    String time ;
    String place;
    String duixiang;
    String neirong;
    String schedule;

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getDuixiang() {
        return duixiang;
    }

    public void setDuixiang(String duixiang) {
        this.duixiang = duixiang;
    }

    public String getNeirong() {
        return neirong;
    }

    public void setNeirong(String neirong) {
        this.neirong = neirong;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
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
    //增
    public void addData(String topic,String purpose,String type,String time,String place,String duixiang,String neirong,String schedule){
        Connection connection = getConnection();
        PreparedStatement preparedStatement=null;
        try {
            //hubie,housetype,houseS,home,name,id,sex,minzu,edu;
            String sql = "insert into activity (主题,目的,类型,时间,地点,对象,内容,安排) values (?,?,?,?,?,?,?,?)";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,topic);
            preparedStatement.setString(2,purpose);
            preparedStatement.setString(3,type);
            preparedStatement.setString(4,time);
            preparedStatement.setString(5,place);
            preparedStatement.setString(6,duixiang);
            preparedStatement.setString(7,neirong);
            preparedStatement.setString(8,schedule);

            preparedStatement.executeUpdate();
            //System.out.println("添加成功");

        } catch (SQLException  e) {
            e.printStackTrace();
        }finally{
            close(preparedStatement);
            close(connection);
        }
    }
    //对增加信息的细节性判断
    //判断活动主题是否存在
    public boolean ifTopicSame(String topic){
        Connection connection = getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet rs=null;
        try {
            String sql = "select * from activity";
            preparedStatement=connection.prepareStatement(sql);
            rs=preparedStatement.executeQuery();
            while(rs.next()){
                if(topic.equals(rs.getObject(1)) )
                    return true;
            }
            //preparedStatement.executeUpdate();

        } catch (SQLException  e) {
            e.printStackTrace();
        }finally{
            close(rs);
            close(preparedStatement);
            close(connection);
        }
        return false;
    }
    //删除信息
    public void deleteData(String topic){
        Connection connection = getConnection();
        PreparedStatement preparedStatement=null;
        try {
            String sql = "delete from activity where 主题 = ?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,topic);
            preparedStatement.executeUpdate();

        } catch (SQLException  e) {
            e.printStackTrace();
        }finally{
            close(preparedStatement);
            close(connection);
        }
    }
    //修改信息
    public void reviseData(String topic,String purpose,String type,String time,String place,String duixiang,String neirong,String schedule){
        Connection connection = getConnection();
        PreparedStatement preparedStatement=null;
        try {
            //身份证号码、性别、民族、受教育程度
            String sql = "update activity set 目的=?, 类型=?, 时间=?, 地点=?,对象=?,内容=?,安排=? where 主题=?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,purpose);
            preparedStatement.setString(2,type);
            preparedStatement.setString(3,time);
            preparedStatement.setString(4,place);
            preparedStatement.setString(5,duixiang);
            preparedStatement.setString(6,neirong);
            preparedStatement.setString(7,schedule);
            preparedStatement.setString(8,topic);
            preparedStatement.executeUpdate();

        } catch (SQLException  e) {
            e.printStackTrace();
        }finally{
            close(preparedStatement);
            close(connection);
        }
    }
}
