<?php 
require 'connections/connection.php';

if (!empty($_SESSION["id"])) {
    header("Location: index.php");
}

$password_err = "";

if (isset($_POST["login"])) {
    $usernameemail = $_POST["usernameemail"];
    $password = $_POST["password"];

    $query = "SELECT * FROM admins_account WHERE username = ?";
    $stmt = mysqli_prepare($connections, $query);
    mysqli_stmt_bind_param($stmt, "s", $usernameemail);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);

        // Use AES_ENCRYPT function in the SQL query
        $query = "SELECT * FROM admins_account WHERE username = ? AND password = AES_ENCRYPT(?, '000')";
        $stmt = mysqli_prepare($connections, $query);
        mysqli_stmt_bind_param($stmt, "ss", $usernameemail, $password);
        mysqli_stmt_execute($stmt);

        $result = mysqli_stmt_get_result($stmt);

        if (mysqli_num_rows($result) > 0) {
            $_SESSION["login"] = true;
            $_SESSION["id"] = $row["id"];
            header("Location: dashboard.php");
            exit();
        } else {
            $password_err = '<div class="error-message-password">Wrong password</div>';
        }
    } else {
        $password_err = '<div class="error-message-password">User not registered</div>';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title> 
  <!--FOTNS-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="stylesheet" type="text/css" href="login.css">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300&display=swap" rel="stylesheet">
  <!--ICONS-->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <!--JQUERY-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="http://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
  <!--CSS-->
</head>
<style>

</style>
<body>
  <div id="particle-js" class="particle-js">
  <div class="header">Room Management System</div>
		<nav>
			<ul>

			</ul>
		</nav>
    <div class="content">
      <div class="form-container">
        <div class="login-label">
           <span id="title"></span>
        </div><!--echo htmlspecialchars($_SERVER["PHP_SELF"]); -->
        <?php echo $password_err;?>
       <form class="" action="" method="post" autocomplete="off">
           <div class="from-group" >
             <div id="login" class="text-field-mobile">
               <fieldset>
                 <legend>Username</legend>
                <input type="text" name="usernameemail" id = "usernameemail" required placeholder="Enter username here">
               </fieldset>
               <fieldset>
                    <legend>Password</legend>
                <input type="password" name="password" id = "password" required placeholder="Enter Password here">
               </fieldset>
               <button type="submit" name="login" class="btn-submit">login</button>
               <div class="register-button">
                 <span id="span-register"></span>&nbsp;
               </div>
             </div>
           </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>