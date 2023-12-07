<?php
 include("../connections/connection.php");
// Check existence of id parameter before processing further
if(isset($_GET["id"]) && !empty(trim($_GET["id"]))){

    // Prepare a select statement
    $sql = 
"SELECT
    instructor.instructor_id,
    instructor.firstname,
    instructor.lastname,
    instructor_startend_date.startDate,
    instructor_startend_date.endDate
FROM
    instructor
INNER JOIN
    instructor_startend_date 
ON
    instructor.instructor_id = instructor_startend_date.instructorDate_id
WHERE
    instructor.instructor_id = ?";
    
    if($stmt = mysqli_prepare($connections, $sql)){
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "i", $param_id);
        
        // Set parameters
        $param_id = trim($_GET["id"]);
        
        // Attempt to execute the prepared statement
        if(mysqli_stmt_execute($stmt)){
            $result = mysqli_stmt_get_result($stmt);
    
            if(mysqli_num_rows($result) == 1){
                $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
                
                // Retrieve individual field value
                $instructor_id = $row["instructor_id"];
                $firstname =["firstname"];
                $lastname =["lastname"];
                $startDate =["startDate"];
                $endDate =["endDate"];

                
            } else{
                // URL doesn't contain valid id parameter. Redirect to error page
                header("location: error.php");
                
            }
            
        } else{
            echo "Oops! Something went wrong. Please try again later.";
        }
    }
     
    // Close statement
    mysqli_stmt_close($stmt);
    
    // Close connection
  
} else{
    // URL doesn't contain id parameter. Redirect to error page
    header("location: error.php");

}
$Strand = $sub =  $startTime=  $endTime= "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $selectedStrand = $_POST["strandDropdown"];
    $selectedSubject = $_POST["subjectDropdown"];
    $startTime = $_POST["startTime"];
    $endTime = $_POST["endTime"];

    if (isset($_POST["strandDropdown"])) {
        if ($selectedStrand === "Strand") {
            $Strand = "Na";
        } else if ($selectedStrand === "STEM") {
            $Strand = "SC99000STEM";
        } else if ($selectedStrand === "ADAS") {
            $Strand = "SC99000ADAS";
        } else if ($selectedStrand === "ABM") {
            $Strand = "SC99000ABM";
        } else if ($selectedStrand === "GAS") {
            $Strand = "SC99000GAS";
        } else if ($selectedStrand === "ICT") {
            $Strand = "SC99000ICT";
        } else if ($selectedStrand === "HE") {
            $Strand = "SC99000HE";
        }
    if ($selectedSubject === "oralCommunication") {
            $sub = "Oral Communication";
        } elseif ($selectedSubject === "komunikasyon") {
            $sub = "Komunikasyon";
        } elseif ($selectedSubject === "generalMath") {
            $sub = "General Mathematics";
        } elseif ($selectedSubject === "earthScience") {
            $sub = "Earth Science";
        } elseif ($selectedSubject === "philosophy") {
            $sub = "Philosophy";
        } elseif ($selectedSubject === "peh1") {
            $sub = "PEH1";
        } elseif ($selectedSubject === "empowermentTech") {
            $sub = "Empowerment Technologies";
        } elseif ($selectedSubject === "genChem1") {
            $sub = "General Chemistry 1";
        } elseif ($selectedSubject === "genBio1") {
            $sub = "General Biology 1";
        } elseif ($selectedSubject === "rhgp") {
            $sub = "RHGP";
        }

        $query = mysqli_query($connections, "INSERT INTO instructor_subject (instructor_id, strand,subject_code,StartTime,EndTime) VALUES ('$instructor_id','$Strand','$sub','$startTime','$endTime')");

        if ($query) {
            
        } else {
            echo "Error: " . mysqli_error($connections);
        }
    }
}
$instructorSearchResult = $res ="";

// Fetch instructor subjects
$query_subjects = mysqli_query($connections,
 "SELECT 
 strands.strand_name,
 subjects.subject_name,
 instructor_subject.StartTime,
 instructor_subject .EndTime
 FROM
 instructor_subject LEFT JOIN strands ON instructor_subject.strand = strands.strand_code
 INNER JOIN subjects ON instructor_subject.subject_code = subjects.subject_code 
 WHERE instructor_id = '$instructor_id' ORDER BY StartTime ASC;
 ");
if ($query_subjects) {
    // Generate table rows dynamically
    while ($subject_row = mysqli_fetch_assoc($query_subjects)) {
        $instructorSearchResult .= "<tr>";
        $instructorSearchResult .= "<td><div class='div-bx-chevron-right'><i class='bx bx-chevron-right'></div></i></td>";
        $instructorSearchResult .= "<td>{$subject_row['strand_name']}</td>";
        $instructorSearchResult .= "<td>{$subject_row['subject_name']}</td>";
        $instructorSearchResult .= "<td>{$subject_row['StartTime']}</td>";
        $instructorSearchResult .= "<td>{$subject_row['EndTime']}</td>";
        $instructorSearchResult .= "</tr>";
    }
    $instructorSearchResult;
} else {
    echo "Error: " . mysqli_error($connections);
}

$instructor_time_live = "";
$currentDateTime = date("Y-m-d H:i:s");
$query_time_live = mysqli_query($connections, "SELECT * FROM instructor_subject WHERE instructor_id = '$instructor_id' AND NOW() BETWEEN StartTime AND EndTime");
if ($query_time_live) {
    // Generate table rows dynamically
    while ($live_time_row = mysqli_fetch_assoc($query_time_live)) {
        $instructor_time_live .= "<tr>";
        $instructor_time_live .= "<td>{$live_time_row['strand']}</td>";
        $instructor_time_live .= "<td>{$live_time_row['subject_code']}</td>";
        $instructor_time_live .= "<td>{$live_time_row['StartTime']}</td>";
        $instructor_time_live .= "<td>{$live_time_row['EndTime']}</td>";
        $instructor_time_live .= "</tr>";
    }
} else {
    echo "Error: " . mysqli_error($connections);
}
?>