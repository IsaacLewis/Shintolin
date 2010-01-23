require 'mysql'

def mysql_connect(db_name='shintolin')
  begin
    # connect to the MySQL server

    $mysql = Mysql.real_connect('localhost', 
                                'root', 
                                '', 
                                db_name, 
                                80)
    # print 'Succesfully connected to MySQL.'
    $mysql
  rescue Exception => e
    # print "Error code: ", e.errno, "\n"
    print "Error message: ", e.to_s, "\n"
  end
end

$mysql_debug = false
