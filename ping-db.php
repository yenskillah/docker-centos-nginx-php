<?

  $conn = pg_connect("host=postgresql dbname=example user=plusamp password=plusamp123");
  $result = pg_query($conn, "select 1");
  if (!$result) {
      echo "An error occurred.\n";
        exit;
  }

  $row = pg_fetch_row($result);
  echo $row[0] == 1 ? "OK" : "ERROR"; 
  echo "<br/>";
