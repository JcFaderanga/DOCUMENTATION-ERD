<?php 
 include("../connections/connection.php");
 require_once "../PHPfunctions/instructorDetails.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="instructorProfile.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="header">Room Management System</div>
                <nav>
                    <ul>
                        <li><a href="../dashboard.php">Search</a></li>
                        <li><a href="../rooms/roomDashboard.php">Rooms</a></li>
                    </ul>
                    <ul>
			    <li><a href="../index.php">Log out</a></li>
			</ul>
                </nav>
            <div class="inner-container">
            <div class="leftSide">
                <div class="profile">
                    <div class="name-box">
                        <span class="name-title"><?php echo $row["firstname"];echo " " ;echo $row["lastname"]; ?></span>
                    </div>
                        <div class="profile-info">
                            <div class="info-box">
                                    <div class="details">
                                        <label>Instructor ID</label>
                                        <?php echo $row["instructor_id"]; ?>
                                    </div>
                                    <div class="details">
                                        <label>Started date effective</label>
                                        <?php echo $row["startDate"]; ?>
                                    </div>
                                    <div class="details">
                                        <label>End date effective</label>
                                        <?php echo $row["endDate"]; ?>
                                    </div>
                            </div>
                        </div>      
                </div>
                <div class="left">
                            <div class="upper-left">
                            <table>
                                <tr id="firstTr">
                
                                    <td>Coaching:</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                              </tr>

                            </thead>
                                <tbody>
                                    <?php echo $instructor_time_live;?>
                                </tbody>
                        </table>
                            
                            </div>
                            
                        </div>
            </div>
                <div class="right">
                    <div class="upper-right">
                        <div class="add_sub">
                            <form action="" method="post">
                                <div class="input-box-instructor">
                                    <button class="filter_logo" id="filter" name="addSub">Add subject</button>
                                            <div class="details">
                                                <select id="strandDropdown" name="strandDropdown" required>
                                                    <option value="">Strand</option> 
                                                    <option value="STEM">STEM</option>
                                                    <option value="ADAS">ADAS</option>
                                                    <option value="ABM">ABM</option>
                                                    <option value="GAS">GAS</option>
                                                    <option value="ICT">ICT</option>
                                                    <option value="HE">HE</option>
                                                </select>
                                            </div>
                                            <div class="details">
                                                <select id="subjectDropdown" name="subjectDropdown" required>
                                                    <option value="">Add sub</option>
                                                    <option value="oralCommunication">Oral Communication</option>
                                                    <option value="komunikasyon">Komunikasyon at Pananaliksik sa Wika at Kulturang Pilipino</option>
                                                    <option value="generalMath">General Mathematics</option>
                                                    <option value="earthScience">Earth Science</option>
                                                    <option value="philosophy">Introduction to the Philosophy of the Human Person</option>
                                                    <option value="peh1">Physical Education and Health 1</option>
                                                    <option value="empowermentTech">Empowerment Technologies</option>
                                                    <option value="genChem1">General Chemistry 1</option>
                                                    <option value="genBio1">General Biology 1</option>
                                                    <option value="rhgp">RHGP</option>
                                                    Add more options as needed 
                                                </select>
                                            </div>
                                            <div class="details">
                                                <input type="time" name="startTime" required>
                                            </div>  
                                            <div class="details">
                                                <input type="time" name="endTime" required>
                                            </div>  
                                    </div>
                                </form>
                        </div>
                    </div>
                    <div class="right-2tables">
                        <div class="table-box">
                            <div class="filters">

                            </div>
                            <table>
                                <tr id="firstTr">
                                    <td></td>
                                    <td>Subject Code</td>
                                    <td>Strand</td>
                                    <td>Start Time</td>
                                    <td>End Time</td>
                                </tr>

                                </thead>
                                <tbody>
                                    <?php echo $instructorSearchResult; ?>
                                </tbody>
                            </table>
                        </div>
                        
                    </div>  
                </div>
            </div>
            
    </div>
</body>
</html>