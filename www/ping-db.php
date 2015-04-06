<?php
  /**
   *  @description Pings the database using a test query e.g. `select 1` or `select 1 from dual`
   */
  $conn = pg_connect("host=postgresql dbname=example user=user password=pass");
  $result = pg_query($conn, "select 1");
  if (!$result) {
    echo "An error occurred.\n";
    exit;
  }

  $row = pg_fetch_row($result);
  echo $row[0] == 1 ? "OK" : "ERROR";
?>
