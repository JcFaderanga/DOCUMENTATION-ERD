<?php
$msg = "";
require 'connections/connection.php';
if ($_SERVER["REQUEST_METHOD"]=="POST") {
    $first_name = $_POST['firstname'];;
$last_name = $_POST['lastname'];;
$username = $_POST['username'];;
$password = $_POST['password']; 

    // Insert into Table 1 (user_info)
    $query1 = "INSERT INTO admins (name, lastname) VALUES (?, ?)";
    $stmt1 = mysqli_prepare($connections, $query1);
    mysqli_stmt_bind_param($stmt1, "ss", $first_name, $last_name);
    mysqli_stmt_execute($stmt1);
    $user_id = mysqli_insert_id($connections); // Get the last inserted ID

    // Insert into Table 2 (user_credentials)
    $query2 = "INSERT INTO admins_account (id, username, password) VALUES (?, ?, AES_ENCRYPT(?, '000'))";
    $stmt2 = mysqli_prepare($connections, $query2);
    mysqli_stmt_bind_param($stmt2, "iss", $user_id, $username, $password);
    mysqli_stmt_execute($stmt2);

    mysqli_stmt_close($stmt1);
    mysqli_stmt_close($stmt2);

    $msg = "Registration successful!";
    
}

mysqli_close($connections);
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="Instructor/StyleInstructor.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="header">Room Management System</div>
            <nav>
                <ul>
                    <li><a href="dashboard.php">Search</a></li>
                    <li><a href="rooms/roomDashboard.php">Rooms</a></li>
                </ul>
                <ul>
			        <li><a href="index.php">Log out</a></li>
			   </ul>
                
            </nav>
            
        <div class="addInstructor">        	
            <form action="" method="post">
                <div class="input-box-instructor">
                   
                    <div class="details">
                            <div>
                                <label for="firstname">Firstname:</label>
                            </div>
                        <input type="text" name="firstname" placeholder="Fisrtname" required>
                    </div>
                    <div class="details">
                            <div>
                                <label for="lastname">Lastname:</label>
                            </div>
                        <input type="text" name="lastname" placeholder="Lastname" required>
                    </div>   
                    <div class="details">
                            <div>
                                <label for="start">Username:</label>
                            </div>
                        <input type="text" name="username" placeholder="username" required>
                    </div>  
                    <div class="details">
                            <div>
                                <label for="end">Password:</label>
                            </div>
                        <input type="password" name="password" placeholder="password" required>
                    </div>  
                </div>
                <div class="search-btn-box-instructor">
					<button>Save</button>
				</div>  
            </form>
    </div>
    <?php echo $msg ;?>

</body>
</html>